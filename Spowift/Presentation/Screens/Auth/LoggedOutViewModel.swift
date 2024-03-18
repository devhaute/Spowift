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
    @Injected(\.getAuthorizationUrlUC) private var getAuthorizationUrlUC
    
    // MARK: - Properties -
    
    // MARK: - Observable Properties -
    
    // MARK: - Init -
}

// MARK: - Actions -

extension LoggedOutViewModel {
    func onTapStartButton() {
        let result = getAuthorizationUrlUC.execute()
        
        switch result {
        case .success(let url):
            UIApplication.shared.open(url)
        case .failure(let error):
            // TODO: Error View 구현하기
            break
        }
    }
}

