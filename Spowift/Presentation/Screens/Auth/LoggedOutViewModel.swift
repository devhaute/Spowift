//
//  LoggedOutViewModel.swift
//  Spowift
//
//  Created by kai on 3/18/24.
//

import Foundation
import Factory
import WebKit
import Combine
import SpotifyWebAPI

final class LoggedOutViewModel: ViewModel {
    // MARK: - Dependencies -
    @Injected(\.spotifyAuthManager) private var spotifyAuthManager
    
    // MARK: - Properties -
    private var cancellables: Set<AnyCancellable> = []
}

// MARK: - Actions -

extension LoggedOutViewModel {
    func handleURL(_ url: URL) {
        guard url.scheme == spotifyAuthManager.loginRedirectURI.scheme else {
            print("not handling URL: unexpected scheme: '\(url)'")
            alert = .custom(
                title: "Cannot Handle Redirect",
                message: "Unexpected URL"
            )
            
            return
        }
        
        spotifyAuthManager.api.authorizationManager.requestAccessAndRefreshTokens(
            redirectURIWithQuery: url,
            state: spotifyAuthManager.authorizationState
        )
        .receive(on: RunLoop.main)
        .sink(receiveCompletion: { [weak self] completion in
            guard let self else { return }
            if case .failure(let error) = completion {
                print("couldn't retrieve access and refresh tokens:\n\(error)")
                let alertTitle: String
                let alertMessage: String
                
                if let authError = error as? SpotifyAuthorizationError,
                   authError.accessWasDenied {
                    alertTitle = "You Denied The Authorization Request :("
                    alertMessage = ""
                }
                else {
                    alertTitle = "Couldn't Authorization With Your Account"
                    alertMessage = error.localizedDescription
                }
                
                alert = .custom(title: alertTitle, message: alertMessage)
            }
        })
        .store(in: &cancellables)
        
        // MARK: IMPORTANT: generate a new value for the state parameter after
        // MARK: each authorization request. This ensures an incoming redirect
        // MARK: from Spotify was the result of a request made by this app, and
        // MARK: and not an attacker.
        spotifyAuthManager.authorizationState = String.randomURLSafe(length: 128)
    }
    
    func onTapStartButton() {
        do {
            let url = try spotifyAuthManager.getAuthorizationURL()
            UIApplication.shared.open(url)
        } catch {
            alert = .invalidURL
        }
    }
}

