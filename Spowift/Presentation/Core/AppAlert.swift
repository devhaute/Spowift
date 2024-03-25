//
//  AppAlert.swift
//  Spowift
//
//  Created by kai on 3/19/24.
//

import SwiftUI

enum AppAlert {
    case custom(title: String, message: String)
    case error(_ error: AppError)
}

extension AppAlert: Identifiable {
    var id: String {
        switch self {
        case .custom:
            return "custom"
        case .error:
            return "error"
        }
    }
}

extension AppAlert {
    var alert: Alert {
        switch self {
        case let .custom(title, message):
            return Alert(title: Text(title), message: Text(message))
        case .error(let error):
            return Alert(title: Text("Spowift"), message: Text(error.message))
        }
    }
}
