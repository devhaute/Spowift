//
//  DataDecoder.swift
//  Spowift
//
//  Created by kai on 3/15/24.
//

import Foundation

protocol DataDecoder {
    func decode<T: Decodable>(data: Data) throws -> T
}

class DefaultDataDecoder: DataDecoder {
    private var jsonDecoder: JSONDecoder
    init(jsonDecoder: JSONDecoder = JSONDecoder()) {
        self.jsonDecoder = jsonDecoder
        self.jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    func decode<T: Decodable>(data: Data) throws -> T {
        return try jsonDecoder.decode(T.self, from: data)
    }
}
