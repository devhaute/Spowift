//
//  ArtistsRequest.swift
//  Spowift
//
//  Created by kai on 3/25/24.
//

import Foundation

enum ArtistsRequest: RequestProtocol {
    case getArtist(id: String)
    
    var path: String {
        switch self {
        case .getArtist(let id):
            "/artists/\(id)"
        }
    }
        
    var requestType: RequestType {
        .GET
    }
}
