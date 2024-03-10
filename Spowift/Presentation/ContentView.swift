//
//  ContentView.swift
//  Spowift
//
//  Created by kai on 3/7/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: TabBarItems = .home
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                content
                
                Spacer()
                
                TabBar(selectedTab: $selectedTab)
            }
        }
        .background(Color.theme.neutralBlack)
        .edgesIgnoringSafeArea(.bottom)
    }
}

extension ContentView {
    @ViewBuilder
    private var content: some View {
        switch selectedTab {
        case .home:
            BaseRouterView {
                HomeView()
            }
        case .playlist:
            BaseRouterView {
                PlayListView()
            }
        case .center:
            BaseRouterView {
                HomeView()
            }
        case .history:
            BaseRouterView {
                HomeView()
            }
        case .profile:
            BaseRouterView {
                HomeView()
            }
        }
    }
}

#Preview {
    ContentView()
}
