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
    private var content: some View {
        switch selectedTab {
        case .home:
            Text("home")
                .foregroundStyle(Color.theme.neutralWhite)
        case .playlist:
            Text("playlist")
                .foregroundStyle(Color.theme.neutralWhite)
        case .center:
            Text("center")
                .foregroundStyle(Color.theme.neutralWhite)
        case .history:
            Text("history")
                .foregroundStyle(Color.theme.neutralWhite)
        case .profile:
            Text("profile")
                .foregroundStyle(Color.theme.neutralWhite)
        }
    }
}

#Preview {
    ContentView()
}
