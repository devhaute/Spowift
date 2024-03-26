//
//  RequestProtocol.swift
//  Spowift
//
//  Created by kai on 3/15/24.
//

import Foundation
import OSLog

protocol RequestProtocol {
    var host: String { get }
    var path: String { get }
    var requestType: RequestType { get }
    var headers: HTTPHeaders { get }
    var params: [String: Any] { get }
    var urlParams: [String: String?] { get }
}

// MARK: - Default RequestProtocol
extension RequestProtocol {
    var host: String {
        return APIConstants.apiHost
    }
    
    var params: [String: Any] {
        [:]
    }
    
    var urlParams: [String: String?] {
        [:]
    }
    
    var headers: HTTPHeaders {
        [:]
    }
    
    func request() throws -> URLRequest {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = APIConstants.currentAPIVersionPath + path
        
        /// Add default query params
        var queryParamsList: [URLQueryItem] = []
        
        if !urlParams.isEmpty {
            queryParamsList.append(contentsOf: urlParams.map { URLQueryItem(name: $0, value: $1) })
            components.queryItems = queryParamsList
        }
        
        guard let url = components.url else { throw NetworkError.invalidURL }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = requestType.rawValue
        
        if !headers.isEmpty {
            urlRequest.allHTTPHeaderFields = headers
        }
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if !params.isEmpty {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params)
        }
        
        Logger.networking.info("🚀 [REQUEST] [\(requestType.rawValue)] \(urlRequest, privacy: .private)")
        
        return urlRequest
    }
}

