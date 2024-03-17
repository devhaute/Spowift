//
//  Container.swift
//  Spowift
//
//  Created by kai on 3/14/24.
//

import Foundation
import Factory

// MARK: - Injecting ViewModels -

extension Container {
    var homeViewModel: Factory<HomeViewModel> {
        Factory(self) { return HomeViewModel() }
            .scope(.cached)
    }
    
    var artistProfileViewModel: Factory<ArtistProfileViewModel> {
        Factory(self) { return ArtistProfileViewModel() }
    }
}
