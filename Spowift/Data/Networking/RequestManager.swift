//
//  RequestManager.swift
//  Spowift
//
//  Created by kai on 3/15/24.
//

import Foundation

// MARK: - Request Manager Protocol -

protocol RequestManager {
    var networkManager: NetworkManager { get }
    var decoder: DataDecoder { get }
    func makeRequest<T: Decodable>(with requestData: RequestProtocol) async throws -> T
}

// MARK: - Default Request Manager
class DefaultRequestManager: RequestManager {
    let networkManager: NetworkManager
    
    init(networkManager: NetworkManager = DefaultNetworkManager()) {
        self.networkManager = networkManager
    }
    
    /// Makes a network request.
    func makeRequest<T: Decodable>(with requestData: RequestProtocol) async throws -> T {
        let data = try await networkManager.makeRequest(with: requestData)
        let decoded: T = try decoder.decode(data: data)
        return decoded
    }
}

// MARK: - Returns Data Parser -

extension RequestManager {
    var decoder: DataDecoder {
        return DefaultDataDecoder()
    }
}
