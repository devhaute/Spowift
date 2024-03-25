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
    
    func getArtist(id: String) async throws -> ArtistResponse {
        let request = ArtistsRequest.getArtist(id: id)
        let response: ArtistResponse = try await networkManager.makeRequest(with: request)
        return response
    }
}


