//
//  TabBarItemsView.swift
//  Spowift
//
//  Created by kai on 3/9/24.
//

import SwiftUI

enum TabBarItems: CaseIterable, Identifiable {
    case home, playlist, center, history, profile
    
    var id: String {
        title
    }
}

extension TabBarItems {
    var title: String {
        switch self {
        case .home: "Home"
        case .playlist: "Playlist"
        case .center: ""
        case .history: "History"
        case .profile: "Profile"
        }
    }
    
    var onIcon: String {
        switch self {
        case .home: "home_tab_on"
        case .playlist: "playlist_tab_on"
        case .center: "center_tab"
        case .history: "history_tab_on"
        case .profile: "profile_tab_on"
        }
    }
    
    var offIcon: String {
        switch self {
        case .home: "home_tab_off"
        case .playlist: "playlist_tab_off"
        case .center: "center_tab"
        case .history: "history_tab_off"
        case .profile: "profile_tab_off"
        }
    }
    
    var isCenter: Bool {
        self == .center
    }

    @ViewBuilder
    var tabView: some View {
        switch self {
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
                HistoryView()
            }
        case .profile:
            BaseRouterView {
                ProfileView()
            }
        }
    }
}

struct TabBarItemsView: View {
    @Binding var selectedTab: TabBarItems
    @Namespace private var animation

    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            Spacer()
            ForEach(TabBarItems.allCases) { tab in
                Spacer()
                    .hide(tab.isCenter)
                
                ZStack(alignment: .top) {
                    Image("selected_tabs")
                        .hide(tab.isCenter || tab != selectedTab)
                        .matchedGeometryEffect(id: "selectedTabs", in: animation)
                        .animation(.spring, value: selectedTab)
                    
                    VStack(spacing: 2) {
                        Image(tab == selectedTab ? tab.onIcon : tab.offIcon)
                        
                        Text(tab.title)
                            .typography(.caption1)
                            .foregroundStyle(
                                tab == selectedTab
                                    ? Color.theme.main
                                    : Color.theme.neutralWhite
                            )
                    }
                    .padding(.top, tab.isCenter ? 0 : 16)
                    .offset(y: tab.isCenter ? -22 : 0)
                    .onTapGesture {
                        selectedTab = tab
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                
                Spacer()
                    .hide(tab == .center)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 112)
        .background(Color.theme.neutralGray)
    }
}

#Preview {
    TabBarItemsView(selectedTab: .constant(.home))
}
