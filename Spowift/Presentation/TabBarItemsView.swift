//
//  TabBarItemsView.swift
//  Spowift
//
//  Created by kai on 3/9/24.
//

import SwiftUI

enum TabItems: CaseIterable, Identifiable {
    case home, playlist, center, history, profile
    
    var id: String {
        title
    }
}

extension TabItems {
    var title: String {
        switch self {
        case .home: "Home"
        case .playlist: "Playlist"
        case .center: ""
        case .history: "History"
        case .profile: "Profile"
        }
    }
    
    var onIcon: Image {
        switch self {
        case .home: Image.App.homeTabOn
        case .playlist: Image.App.playlistTabOn
        case .center: Image.App.centerTab
        case .history: Image.App.historyTabOn
        case .profile: Image.App.profileTabOn
        }
    }
    
    var offIcon: Image {
        switch self {
        case .home: Image.App.homeTabOff
        case .playlist: Image.App.playlistTabOff
        case .center: Image.App.centerTab
        case .history: Image.App.historyTabOff
        case .profile: Image.App.profileTabOff
        }
    }
    
    var isCenter: Bool {
        self == .center
    }

    @ViewBuilder
    var tabEntryView: some View {
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

struct TabItemsView: View {
    @Binding var selectedTab: TabItems
    @Namespace private var animation

    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            Spacer()
            ForEach(TabItems.allCases) { tab in
                Spacer()
                    .hide(tab.isCenter)
                
                ZStack(alignment: .top) {
                    Image.App.tabSelectionStatusIcon
                        .hide(tab.isCenter || tab != selectedTab)
                        .matchedGeometryEffect(id: "selectedTabs", in: animation)
                        .animation(.spring, value: selectedTab)
                    
                    VStack(spacing: 2) {
                        tab == selectedTab ? tab.onIcon : tab.offIcon
                        
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
    TabItemsView(selectedTab: .constant(.home))
}
