//
//  ArtistsRepository.swift
//  Spowift
//
//  Created by kai on 3/25/24.
//

import Foundation
import Factory

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
            print(error.self)
            return .failure(error.toAppError)
        }
    }
}
