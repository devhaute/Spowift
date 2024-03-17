//
//  Logger.swift
//  Spowift
//
//  Created by kai on 3/15/24.
//

import Foundation
import OSLog

extension Logger {
    
    private static var subsystem = Bundle.main.bundleIdentifier!

    static let networking = Logger(subsystem: subsystem, category: "networking")
    static let localDataSource = Logger(subsystem: subsystem, category: "local data source")
}
