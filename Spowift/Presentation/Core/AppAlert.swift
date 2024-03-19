//
//  AppAlert.swift
//  Spowift
//
//  Created by kai on 3/19/24.
//

import SwiftUI

enum AppAlert {
    case invalidURL
}

extension AppAlert: Identifiable {
    var id: String {
        switch self {
        case .invalidURL:
            return "invalidURL"
        }
    }
}

extension AppAlert {
    var alert: Alert {
        switch self {
        case .invalidURL:
            return Alert(title: Text("오류"), message: Text("연결 URL 주소가 잘못되었어요.\n얼른 수정할게요 😓"))
        }
    }
}
