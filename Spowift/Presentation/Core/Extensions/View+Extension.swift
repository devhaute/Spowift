//
//  View+Extension.swift
//  Spowift
//
//  Created by kai on 3/9/24.
//

import SwiftUI

extension View {
    @ViewBuilder
    func hide(_ bool: Bool) -> some View {
        if bool {
            EmptyView()
        } else {
            self
        }
    }
    
    func onTapDownGesture(perform: @escaping () -> Void) -> some View {
        self
            ._onButtonGesture { pressing in
                if pressing {
                    perform()
                }
            } perform: { }
    }
}
