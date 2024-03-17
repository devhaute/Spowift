//
//  AppError.swift
//  Spowift
//
//  Created by kai on 3/15/24.
//

import Foundation

enum AppError: Error, Equatable {
    case networkError(String)
    case parsingError(String)
    case serverError(String)
    case unknownError(String)
    case localDataFetchError(String)
}
