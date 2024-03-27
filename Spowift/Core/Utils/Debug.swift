//
//  Debug.swift
//  Spowift
//
//  Created by kai on 3/27/24.
//

import Foundation

func debug(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    #if DEBUG
    print(["🐛 "] + items, separator: separator, terminator: terminator)
    #endif
}
