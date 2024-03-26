//
//  ArtistsDataSource.swift
//  Spowift
//
//  Created by kai on 3/25/24.
//

import Foundation
import Factory

// MARK: - Protocol -

protocol ArtistsDataSource {
    func getArtist(id: String) async throws -> ArtistResponse
}

// MARK: - Implementation -

final class DefaultArtistsDataSource: ArtistsDataSource {
    @Injected(\.networkManager) private var networkManager
    @Injected(\.spotifyAuthManager) private var authManager
    
    func getArtist(id: String) async throws -> ArtistResponse {
        let headers: HTTPHeaders = ["Authorization" : "Bearer \(authManager.api.authorizationManager.accessToken ?? "")"]
        
        let request = ArtistsRequest.getArtist(headers: headers, id: id)
        let response: ArtistResponse = try await networkManager.makeRequest(with: request)
        return response
    }
}


