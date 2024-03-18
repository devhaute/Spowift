//
//  GetAuthorizationUrlUC.swift
//  Spowift
//
//  Created by kai on 3/18/24.
//

import Foundation
import Factory

protocol GetAuthorizationUrlUC {
    func execute() -> Result<URL, AppError>
}

final class DefaultGetAuthorizationUrlUC: GetAuthorizationUrlUC {
    @Injected(\.authRepository) private var authRepository
    
    func execute() -> Result<URL, AppError> {
        authRepository.getAuthorizationURL()
    }
}
