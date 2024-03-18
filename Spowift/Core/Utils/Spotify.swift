//
//  Spotify.swift
//  Spowift
//
//  Created by kai on 3/18/24.
//

import Foundation
import SpotifyWebAPI

final class SpotifyManager {
    let api: SpotifyAPI<AuthorizationCodeFlowManager>
    let loginRedirectURI: URL
    
    /// A cryptographically-secure random string used to ensure than an incoming
    /// redirect from Spotify was the result of a request made by this app, and
    /// not an attacker. **This value is regenerated after each authorization**
    /// **process completes.**
    var authorizationState = String.randomURLSafe(length: 128)
    
    init() {
        api = SpotifyAPI(
            authorizationManager: AuthorizationCodeFlowManager(
                clientId: "",
                clientSecret: ""
            )
        )

        loginRedirectURI = URL(string: "spowift://login-callback")!
    }
}
