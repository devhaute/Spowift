//
//  Artist.swift
//  Spowift
//
//  Created by kai on 3/25/24.
//

import Foundation

struct Artist {
    let id: String
    let name: String
    let totalFollowers: Int
    let popularity: Int
    let imageURL: String
    
    static let dummy: Artist = .init(
        id: "",
        name: "",
        totalFollowers: 0,
        popularity: 0,
        imageURL: ""
    )
}
