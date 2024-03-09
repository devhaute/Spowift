//
//  View+Extension.swift
//  Spowift
//
//  Created by kai on 3/9/24.
//

import SwiftUI

extension View {
   func typography(_ type: TypographyStyle) -> some View {
       self.modifier(BaseTypography(type: type))
   }
}
