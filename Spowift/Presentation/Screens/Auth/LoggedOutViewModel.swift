//
//  LoggedOutViewModel.swift
//  Spowift
//
//  Created by kai on 3/18/24.
//

import Foundation
import Factory
import WebKit
import Combine
import SpotifyWebAPI

final class LoggedOutViewModel: ViewModel {
    // MARK: - Dependencies -
    @Injected(\.spotifyAuthManager) private var spotifyAuthManager
    
    // MARK: - Properties -
    private var cancellables = Set<AnyCancellable>()
}

// MARK: - Actions -

extension LoggedOutViewModel {
    // TODO: - 일관성 유지를 위해 Combine 방식 -> Result 반환 타입으로 변경하기
    func handleURL(_ url: URL) {
        spotifyAuthManager.requestAccessAndRefreshTokens(url: url)
            .receive(on: RunLoop.main)
            .sink { [weak self] completion in
                guard let self else { return }
                switch completion {
                case .finished:
                    spotifyAuthManager.generateAuthorizationState()
                case .failure(let error):
                    alert = .error(error)
                }
            }
            .store(in: &cancellables)
    }
    
    func onTapStartButton() {
        let result = spotifyAuthManager.getAuthorizationURL()
        
        switch result {
        case .success(let url):
            UIApplication.shared.open(url)
        case .failure(let error):
            alert = .error(error.toAppError)
        }
    }
}
