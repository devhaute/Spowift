//
//  LoggedView.swift
//  Spowift
//
//  Created by kai on 3/19/24.
//

import SwiftUI

struct LoggedView: View {
    @State private var selectedTab: TabItems = .home
    
    var body: some View {
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
    LoggedView()
}
