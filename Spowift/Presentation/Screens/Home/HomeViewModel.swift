//
//  HomeViewModel.swift
//  Spowift
//
//  Created by kai on 3/14/24.
//

import Foundation

final class HomeViewModel: ViewModel {
    
    // MARK: - Dependencies -

    // MARK: - Properties -
    
    // MARK: - Observable Properties -
    @Published var searchText = ""
    
    // MARK: - Init -
}

// MARK: - Actions -

extension HomeViewModel {
    func resetSearchText() {
        searchText = ""
    }
}
