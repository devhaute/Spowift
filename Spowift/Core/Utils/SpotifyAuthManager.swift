//
//  SpotifyAuthManager.swift
//  Spowift
//
//  Created by kai on 3/18/24.
//

import Foundation
import SpotifyWebAPI
import KeychainAccess
import ArkanaKeys
import Combine
import OSLog

/// singleton manager
final class SpotifyAuthManager: ObservableObject {
    @Published var isAuthorized = false
    
    var loginRedirectURI: URL {
        URL(string: "spowift://login-callback")!
    }
    
    /// The keychain to store the authorization information in.
    let keychain = Keychain(service: "com.devhaute.Spowift")
    let authorizationManagerKey = "authorizationManager"
    
    /// A cryptographically-secure random string used to ensure than an incoming
    /// redirect from Spotify was the result of a request made by this app, and
    /// not an attacker. **This value is regenerated after each authorization**
    /// **process completes.**
    var authorizationState = String.randomURLSafe(length: 128)
    
    var api = SpotifyAPI(
        authorizationManager: AuthorizationCodeFlowManager(
            clientId: ArkanaKeys.Keys.Debug().spotifyClientID,
            clientSecret: ArkanaKeys.Keys.Debug().spotifyClientSecret
        )
    )
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        // Configure the loggers.
        api.apiRequestLogger.logLevel = .trace
        
        // MARK: Important: Subscribe to `authorizationManagerDidChange` BEFORE
        // MARK: retrieving `authorizationManager` from persistent storage
        api.authorizationManagerDidChange
            // We must receive on the main thread because we are updating the
            // @Published `isAuthorized` property.
            .receive(on: RunLoop.main)
            .sink(receiveValue: authorizationManagerDidChange)
            .store(in: &cancellables)
        
        api.authorizationManagerDidDeauthorize
            .receive(on: RunLoop.main)
            .sink(receiveValue: authorizationManagerDidDeauthorize)
            .store(in: &cancellables)
        
        
        // MARK: Check to see if the authorization information is saved in
        // MARK: the keychain.
        if let authManagerData = keychain[data: authorizationManagerKey] {
            
            do {
                // Try to decode the data.
                let authorizationManager = try JSONDecoder().decode(
                    AuthorizationCodeFlowManager.self,
                    from: authManagerData
                )
                print("found authorization information in keychain")
                
                /*
                 This assignment causes `authorizationManagerDidChange` to emit
                 a signal, meaning that `authorizationManagerDidChange()` will
                 be called.

                 Note that if you had subscribed to
                 `authorizationManagerDidChange` after this line, then
                 `authorizationManagerDidChange()` would not have been called
                 and the @Published `isAuthorized` property would not have been
                 properly updated.

                 We do not need to update `isAuthorized` here because it is
                 already done in `authorizationManagerDidChange()`.
                 */
                self.api.authorizationManager = authorizationManager
                
            } catch {
                print("could not decode authorizationManager from data:\n\(error)")
            }
        }
        else {
            print("did NOT find authorization information in keychain")
        }
    }
}

extension SpotifyAuthManager {
    func getAuthorizationURL() -> Result<URL, NetworkError> {
        guard let url = api.authorizationManager.makeAuthorizationURL(
            redirectURI: loginRedirectURI,
            showDialog: true,
            state: authorizationState,
            scopes: [.userTopRead]
        ) else {
            return .failure(.invalidURL)
        }

        return .success(url)
    }
    
    func generateAuthorizationState() {
        authorizationState = String.randomURLSafe(length: 128)
    }
    
    func requestAccessAndRefreshTokens(url: URL) -> AnyPublisher<Void, AppError> {
        guard url.scheme == loginRedirectURI.scheme else {
            Logger.networking.error("not handling URL: unexpected scheme: '\(url)'")
            return Fail(error: .networkError).eraseToAnyPublisher()
        }
        
        return api.authorizationManager.requestAccessAndRefreshTokens(
            redirectURIWithQuery: url,
            state: authorizationState
        )
        .mapError { error in
            Logger.networking.error("couldn't retrieve access and refresh tokens:\n\(error)")
            return error.toAppError
        }
        .eraseToAnyPublisher()
    }

    private func authorizationManagerDidChange() {
        isAuthorized = api.authorizationManager.isAuthorized()
        
        do {
            // Encode the authorization information to data.
            let authManagerData = try JSONEncoder().encode(
                api.authorizationManager
            )
            
            // Save the data to the keychain.
            keychain[data: authorizationManagerKey] = authManagerData
            print("did save authorization manager to keychain")
            
        } catch {
            print(
                "couldn't encode authorizationManager for storage " +
                    "in keychain:\n\(error)"
            )
        }
    }

    private func authorizationManagerDidDeauthorize() {
        isAuthorized = false
        
        do {
            try keychain.remove(authorizationManagerKey)
            print("did remove authorization manager from keychain")
            
        } catch {
            print(
                "couldn't remove authorization manager " +
                "from keychain: \(error)"
            )
        }
    }
}
