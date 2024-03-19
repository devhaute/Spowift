//
//  LoggedOutViewModel.swift
//  Spowift
//
//  Created by kai on 3/18/24.
//

import Foundation
import Factory
import WebKit

final class LoggedOutViewModel: ViewModel {
    
    // MARK: - Dependencies -
    @Injected(\.spotifyManager) private var spotifyManager
    
    // MARK: - Properties -
    
    // MARK: - Observable Properties -
    
    // MARK: - Init -
}

// MARK: - Actions -

extension LoggedOutViewModel {
    func handleURL(_ url: URL) {
        print(url)
    }
    
    func onTapStartButton() {
        do {
            let url = try spotifyManager.getAuthorizationURL()
            UIApplication.shared.open(url)
        } catch {
            alert = .invalidURL
        }
    }
}

