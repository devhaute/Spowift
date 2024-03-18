//
//  ContentView.swift
//  Spowift
//
//  Created by kai on 3/7/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: TabItems = .home
    
    @State private var isLoggedIn: Bool = false
    
    var body: some View {
        if isLoggedIn {
            loggedView
        } else {
            LoggedOutView()
        }
    }
}

extension ContentView {
    @ViewBuilder
    private var loggedView: some View {
        VStack {
            ZStack {
                ForEach(TabItems.allCases) { item in
                    item.tabEntryView
                        .opacity(selectedTab == item ? 1 : 0)
                }
            }
            
            Spacer(minLength: 0)
            
            TabItemsView(selectedTab: $selectedTab)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    ContentView()
}
