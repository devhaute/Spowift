//
//  AuthRepository.swift
//  Spowift
//
//  Created by kai on 3/18/24.
//

import Foundation
import Factory

protocol AuthRepository {
    func getAuthorizationURL() -> Result<URL, AppError>
}

final class DefaultAuthRepository: AuthRepository {
    @Injected(\.authDataSource) private var authDataSource
    
    func getAuthorizationURL() -> Result<URL, AppError> {
        do {
            let url = try authDataSource.getAuthorizationURL()
            return .success(url)
        } catch {
            print(error.self)
            return .failure(error.toAppError)
        }
    }
}
