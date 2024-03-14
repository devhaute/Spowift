//
//  ViewModel.swift
//  Spowift
//
//  Created by kai on 3/14/24.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var state: ViewState = .initial
}

enum ViewState: Equatable {
    case initial, loading, error(String), success, empty
}
