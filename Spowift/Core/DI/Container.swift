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
    var loggedOutViewModel: Factory<LoggedOutViewModel> {
        Factory(self) { return LoggedOutViewModel() }
    }
    
    var homeViewModel: Factory<HomeViewModel> {
        Factory(self) { return HomeViewModel() }
    }
    
    var artistProfileViewModel: Factory<ArtistProfileViewModel> {
        Factory(self) { return ArtistProfileViewModel() }
    }
}

// MARK: - Injecting Use Cases -

extension Container {
    
}

 // MARK: - Injecting Repositories -

extension Container {
    
}

// MARK: - Injecting DataSources -

extension Container {
    
}

// MARK: - Injecting Utils -

extension Container {
    var networkManager: Factory<NetworkManager> {
        Factory(self) { return DefaultNetworkManager() }
            .singleton
    }
    
    var spotifyManager: Factory<SpotifyManager> {
        Factory(self) { return SpotifyManager() }
            .singleton
    }
}
