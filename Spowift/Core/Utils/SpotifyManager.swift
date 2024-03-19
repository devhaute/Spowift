//
//  SpotifyManager.swift
//  Spowift
//
//  Created by kai on 3/18/24.
//

import Foundation
import SpotifyWebAPI

/// singleton manager
final class SpotifyManager: ObservableObject {
    private let api: SpotifyAPI<AuthorizationCodeFlowManager>
    private let loginRedirectURI: URL
    
    /// A cryptographically-secure random string used to ensure than an incoming
    /// redirect from Spotify was the result of a request made by this app, and
    /// not an attacker. **This value is regenerated after each authorization**
    /// **process completes.**
    private let authorizationState = String.randomURLSafe(length: 128)
    
    init() {
        api = SpotifyAPI(
            authorizationManager: AuthorizationCodeFlowManager(
                clientId: "2dcd832363ad4720b3b32b07afda2f45",
                clientSecret: "054136b4ae794422a69c4a8a114b2a29"
            )
        )

        loginRedirectURI = URL(string: "spowift://login-callback")!
    }
    
    func getAuthorizationURL() throws -> URL {
        guard let url = api.authorizationManager.makeAuthorizationURL(
            redirectURI: loginRedirectURI,
            showDialog: true,
            state: authorizationState,
            scopes: [.userTopRead]
        ) else {
            throw NetworkError.invalidURL
        }

        return url
    }
}
