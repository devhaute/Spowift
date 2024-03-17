//
//  NetworkManager.swift
//  Spowift
//
//  Created by kai on 3/15/24.
//

import Foundation
import OSLog

/// The network manager protocol.
/// It is responsible for making network requests.
protocol NetworkManager {
    func makeRequest<T: Decodable>(with requestData: RequestProtocol) async throws -> T
}

class DefaultNetworkManager: NetworkManager {
    private let urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    /// Makes a network request.
    func makeRequest<T: Decodable>(with requestData: RequestProtocol) async throws -> T {
        let request = try requestData.request()
        var responseStatusCode: Int?
        do {
            let (data, response) = try await urlSession.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                responseStatusCode = (response as? HTTPURLResponse)?.statusCode
                throw NetworkError.invalidServerResponse
            }
            let decoded: T = try decoder.decode(data: data)
            
            logSuccess(request)
            return decoded
        } catch {
            logError(responseStatusCode, request, error)
            throw error
        }
    }
    
    private func logSuccess(_ request: URLRequest) {
        Logger.networking.info("""
                                    ✅ [\(200)] [\(request.httpMethod  ?? "")] \
                                     \(request, privacy: .private)
                                    """)
    }
    
    private func logError(_ responseStatusCode: Int?, _ request: URLRequest, _ error: Error) {
        Logger.networking.error("""
                                    🛑 [Error] [\(responseStatusCode ?? 0)] [\(request.httpMethod  ?? "")] \
                                     \(request, privacy: .private)
                                     Error Type: \(error.localizedDescription)
                                    """)
    }
}

// MARK: - Returns Data Parser -

extension NetworkManager {
    var decoder: DataDecoder {
        return DefaultDataDecoder()
    }
}
