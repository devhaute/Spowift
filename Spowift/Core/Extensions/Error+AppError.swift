//
//  Error+AppError.swift
//  Spowift
//
//  Created by kai on 3/15/24.
//

import Foundation

extension Error {
    /// Converts any error to an `AppError` object.
    var toAppError: AppError {
        if self is NetworkError {
            return .networkError("errorWhileFetchingData")
        }
        return .unknownError("unknownError")
    }
}
