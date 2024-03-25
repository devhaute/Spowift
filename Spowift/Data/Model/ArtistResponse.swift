//
//  ArtistResponse.swift
//  Spowift
//
//  Created by kai on 3/22/24.
//

import Foundation

/*
{
    "followers": {
        "href": null,
        "total": 9532461
    },
    "popularity": 81,
    "id": "4Z8W4fKeB5YxbusRsdQVPb",
    "images": [
        {
            "height": 640,
            "url": "https://i.scdn.co/image/ab6761610000e5eba03696716c9ee605006047fd",
            "width": 640
        },
        {
            "height": 320,
            "url": "https://i.scdn.co/image/ab67616100005174a03696716c9ee605006047fd",
            "width": 320
        },
        {
            "height": 160,
            "url": "https://i.scdn.co/image/ab6761610000f178a03696716c9ee605006047fd",
            "width": 160
        }
    ],
    "name": "Radiohead",
}
*/

// MARK: - ArtistResponse
struct ArtistResponse: Codable {
    let id: String
    let followers: Followers
    let popularity: Int
    let images: [ArtistImage]
    let name: String
}

// MARK: - Followers
struct Followers: Codable {
    let href: String?
    let total: Int
}

// MARK: - Image
struct ArtistImage: Codable {
    let height: Int
    let url: String
    let width: Int
}
