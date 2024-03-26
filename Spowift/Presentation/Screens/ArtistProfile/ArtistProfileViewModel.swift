//
//  ArtistProfileView.swift
//  Spowift
//
//  Created by kai on 3/10/24.
//

import Foundation
import Factory

final class ArtistProfileViewModel: ViewModel {
    
    // MARK: - Dependencies -
    @Injected(\.getArtistUC) private var getArtistUC
    
    // MARK: - Properties -
    
    // MARK: - Observable Properties -
    @Published var artist: Artist = .dummy
    
    // MARK: - Init -
}

// MARK: - Actions -

extension ArtistProfileViewModel {
    @MainActor
    func getArtist(id: String) async {
        let result = await getArtistUC.execute(with: .init(id: id))
        
        switch result {
        case .success(let artist):
            self.artist = artist
        case .failure(let error):
            alert = .error(error)
        }
    }
}

