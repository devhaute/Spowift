//
//  ProfileViewModel.swift
//  Spowift
//
//  Created by kai on 3/19/24.
//

import Foundation
import Factory

final class ProfileViewModel: ViewModel {
    // MARK: - Dependencies -
    @InjectedObject(\.spotifyAuthManager) private var spotifyAuthManager
}

// MARK: - Actions -

extension ProfileViewModel {
    func logout() {
        spotifyAuthManager.api.authorizationManager.deauthorize()
    }
}

