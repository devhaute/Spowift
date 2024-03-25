//
//  Error+AppError.swift
//  Spowift
//
//  Created by kai on 3/15/24.
//

import Foundation

extension Error {
    var toAppError: AppError {
        switch self {
        case _ as NetworkError:
            return .networkError
        case let appError as AppError:
            return appError
        default:
            return .unexpectedError
        }
    }
}
