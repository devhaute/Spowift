//
//  Int+Extension.swift
//  Spowift
//
//  Created by kai on 3/26/24.
//

import Foundation

extension Int {
    /// 1,000 이상시 K+, 백만이상시 M+로 축약하여 표현합니다.
    var abbreviate: String {
        let number = Double(self)
        switch number {
        case 1_000_000...:
            return String(format: "%.1fM+", number / 1_000_000)
        case 1_000...:
            return String(format: "%.0fK+", number / 1_000)
        default:
            return "\(self)"
        }
    }
}
