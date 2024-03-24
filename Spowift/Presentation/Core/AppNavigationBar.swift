//
//  AppNavigationBar.swift
//  Spowift
//
//  Created by kai on 3/21/24.
//

import SwiftUI

struct AppNavigationBar<L: View, C: View, R: View>: ViewModifier {
    let left: () -> L
    let center: () -> C
    let right: () -> R
    
    func body(content: Content) -> some View {
        ZStack {
            content
        }
        .navigationBarBackButtonHidden()
        .navigationBarTitle("", displayMode: .inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                left()
            }
            
            ToolbarItem(placement: .principal) {
                center()
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                right()
            }
        }
        .toolbarBackground(Color.theme.neutralBlack.opacity(0.9), for: .navigationBar)
    }
}

// MARK: -  Extenstion
extension View {
    func appNavigationBar<L: View, C: View, R: View>(
        left: @escaping () -> L = { EmptyView() },
        center: @escaping () -> C = { EmptyView() },
        right: @escaping () -> R = { EmptyView() }
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
