//
//  Color+Extension.swift
//  Spowift
//
//  Created by kai on 3/9/24.
//

import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let main = Color("mainColor")
    let secondary = Color("secondaryThemeColor")
    let neutralBlack = Color("neutralBlackColor")
    let neutralGray = Color("neutralGrayColor")
    let neutralWhite = Color("neutralWhiteColor")
}
