//
//  GetArtistUC.swift
//  Spowift
//
//  Created by kai on 3/25/24.
//

import Foundation
import Factory

// MARK: - Parameters -

struct GetArtistParams {
    let id: String
}

// MARK: - Protocol -

protocol GetArtistUC {
    
    func execute(with params: GetArtistParams) async -> Result<Artist, AppError>
}

// MARK: - Implementation -

final class DefaultGetArtistUC: GetArtistUC {
    @Injected(\.artistsRepository) private var repository
    
    func execute(with params: GetArtistParams) async -> Result<Artist, AppError> {
        return await repository.getArtist(id: params.id)
    }
}

