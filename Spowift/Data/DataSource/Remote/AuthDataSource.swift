//
//  AuthDataSource.swift
//  Spowift
//
//  Created by kai on 3/18/24.
//

import Foundation
import Factory

protocol AuthDataSource {
    func getAuthorizationURL() throws -> URL
}

final class DefaultAuthDataSource: AuthDataSource {
    @Injected(\.spotifyManager) private var spotifyManager
    
    func getAuthorizationURL() throws -> URL {
        guard let url = spotifyManager.api.authorizationManager.makeAuthorizationURL(
            redirectURI: spotifyManager.loginRedirectURI,
            showDialog: true,
            state: spotifyManager.authorizationState,
            scopes: [.userTopRead]
        ) else {
            throw NetworkError.invalidURL
        }

        return url
    }
}
