//
//  Font+Extensions.swift
//  Spowift
//
//  Created by kai on 3/9/24.
//

import SwiftUI

enum TypographyStyle {
    case title1
    case title2
    case title3
    case headline1
    case headline2
    case body1
    case body2
    case caption1
    case caption2
    
    var name: String {
        switch self {
        case .title1:
            return "Montserrat-Bold"
        case .title2, .title3, .headline1, .body1, .body2, .caption1:
            return "Montserrat-SemiBold"
        case .headline2, .caption2:
            return "Montserrat-Regular"
        }
    }
    
    var size: CGFloat {
        switch self {
        case .title1:
            return 24
        case .title2:
            return 20
        case .title3:
            return 18
        case .headline1, .headline2:
            return 16
        case .body1, .body2:
            return 14
        case .caption1, .caption2:
            return 12
        }
    }
    
    var lineHeight: CGFloat {
        switch self {
        case .title1:
            32
        case .title2, .title3:
            28
        case .headline1, .headline2:
            24
        case .body1, .body2, .caption1, .caption2:
            20
        }
    }
    
    var styledFont: UIFont {
        return UIFont.systemFont(ofSize: self.size)
    }
}

struct BaseTypography: ViewModifier {
    let type: TypographyStyle
    
    func body(content: Content) -> some View {
        content
            .font(.custom(type.name, size: type.size))
            .lineSpacing(type.lineHeight - type.styledFont.lineHeight)
            .padding(.vertical, (type.lineHeight - type.styledFont.lineHeight) / 2)
    }
}
