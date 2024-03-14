//
//  ContentView.swift
//  Spowift
//
//  Created by kai on 3/7/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: TabItems = .home
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                content
                
                Spacer(minLength: 0)
                
                TabItemsView(selectedTab: $selectedTab)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

extension ContentView {
    @ViewBuilder
    private var content: some View {
        ZStack {
            ForEach(TabItems.allCases) { item in
                item.tabView
                    .opacity(selectedTab == item ? 1 : 0)
            }
        }
    }
}

#Preview {
    ContentView()
}
