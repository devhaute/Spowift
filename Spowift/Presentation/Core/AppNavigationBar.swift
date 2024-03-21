//
//  AppNavigationBar.swift
//  Spowift
//
//  Created by kai on 3/21/24.
//

import SwiftUI

struct AppNavigationBar<V: View>: ViewModifier {
    let left: () -> V
    let center: (() -> V)?
    let right: (() -> V)?
    
    func body(content: Content) -> some View {
        ZStack {
            content
        }
        .navigationBarTitle("", displayMode: .inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                left()
            }
            
            ToolbarItem(placement: .principal) {
                center?()
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                right?()
            }
        }
        .toolbarBackground(Color.theme.neutralBlack.opacity(0.9), for: .navigationBar)
    }
}

// MARK: -  Extenstion
extension View {
    func appNavigationBar<V: View>(
        left: @escaping () -> V,
        center: (() -> V)? = nil,
        right: (() -> V)? = nil
    ) -> some View {
        self.modifier(
            AppNavigationBar(
                left: left,
                center: center,
                right: right
            )
        )
    }
}
