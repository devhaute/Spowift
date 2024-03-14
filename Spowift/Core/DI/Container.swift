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
    var homeViewModel: Factory<HomeView.HomeViewModel> {
        Factory(self) { return HomeView.HomeViewModel() }
    }
    
    var artistProfileViewModel: Factory<ArtistProfileView.ArtistProfileViewModel> {
        Factory(self) { return ArtistProfileView.ArtistProfileViewModel() }
    }
}
