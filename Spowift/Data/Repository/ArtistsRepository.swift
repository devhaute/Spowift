//
//  ArtistsRepository.swift
//  Spowift
//
//  Created by kai on 3/25/24.
//

import Foundation
import Factory
import OSLog

protocol ArtistsRepository {
    func getArtist(id: String) async -> Result<Artist, AppError>
}

final class DefaultArtistsRepository: ArtistsRepository {
    @Injected(\.artistsDataSource) private var dataSource
    
    func getArtist(id: String) async -> Result<Artist, AppError> {
        do {
            let data = try await dataSource.getArtist(id: id)
            return .success(data.toDomain())
        } catch {
            return .failure(error.toAppError)
        }
    }
}
