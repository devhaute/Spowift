//
//  RequestType.swift
//  Spowift
//
//  Created by kai on 3/15/24.
//

import Foundation

enum RequestType: String {
    case GET
    case POST
}

typealias JSON = [String: Any]
typealias HTTPHeaders = [String: String]
