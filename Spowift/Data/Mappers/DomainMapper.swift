//
//  DomainMapper.swift
//  Spowift
//
//  Created by kai on 3/25/24.
//

import Foundation

protocol DomainMapper {
    associatedtype EntityType
    func toDomain() -> EntityType
}
