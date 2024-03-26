//
//  ArtistsRequest.swift
//  Spowift
//
//  Created by kai on 3/25/24.
//

import Foundation

enum ArtistsRequest: RequestProtocol {
    case getArtist(headers: HTTPHeaders, id: String)
    
    var path: String {
        switch self {
        case let .getArtist(_, id):
            "/artists/\(id)"
        }
    }
        
    var requestType: RequestType {
        .GET
    }
    
    var headers: HTTPHeaders {
        switch self {
        case let .getArtist(headers, _):
            headers
        }
    }
}
