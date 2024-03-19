//
//  AppAlert.swift
//  Spowift
//
//  Created by kai on 3/19/24.
//

import SwiftUI

enum AppAlert {
    case custom(title: String, message: String)
    case invalidURL
}

extension AppAlert: Identifiable {
    var id: String {
        switch self {
        case .custom:
            return "custom"
        case .invalidURL:
            return "invalidURL"
        }
    }
}

extension AppAlert {
    var alert: Alert {
        switch self {
        case let .custom(title, message):
            return Alert(title: Text(title), message: Text(message))
        case .invalidURL:
            return Alert(title: Text("Error"), message: Text("The URL is incorrect.\nWe'll fix it 😓"))
        }
    }
}
