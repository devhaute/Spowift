//
//  AppError.swift
//  Spowift
//
//  Created by kai on 3/15/24.
//

import Foundation

enum AppError: Error, Equatable {
    case networkError
    case unexpectedError
    
    var message: String {
        switch self {
        case .networkError:
            return "네트워크 오류가 발생했습니다. 잠시 후 다시 시도해주세요."
        case .unexpectedError:
            return "알 수 없는 오류가 발생했습니다. 잠시 후 다시 시도해주세요."
        }
    }
}
