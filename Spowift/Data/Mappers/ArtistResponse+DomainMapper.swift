//
//  CharacterModel+DomainMapper.swift
//  Spowift
//
//  Created by kai on 3/25/24.
//

import Foundation

extension ArtistResponse: DomainMapper {
    func toDomain() -> Artist {
        .init(
            id: self.id,
            name: self.name,
            totalFollowers: self.followers.total,
            popularity: self.popularity,
            imageURL: self.images.first?.url ?? ""
        )
    }
}
