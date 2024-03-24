//
//  HomeView.swift
//  Spowift
//
//  Created by kai on 3/10/24.
//

import SwiftUI
import Factory

struct HomeView: View {
    @EnvironmentObject private var router: AppRouter
    @InjectedObject(\.homeViewModel) private var viewModel
    @FocusState private var isSearching: Bool
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: 32) {
                banners
                
                todayHits
                
                artists
            }
            .padding(.bottom, 55)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(.neutralWhite)
        .background(.neutralBlack)
        .onTapDownGesture {
            onTapDownScrollView()
        }
        .appNavigationBar(left: {
            HStack(spacing: 0) {
                Image.App.search
                    .resizable()
                    .frame(width: 24, height: 24)
                    .onTapGesture { onTapSearchButton() }
                    .padding(.trailing, 15)
                
                TextField("", text: $viewModel.searchText)
                    .typography(.body1)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .foregroundStyle(.white)
                    .padding(.vertical, 5)
                    .frame(maxWidth: isSearching ? .infinity : 0)
                    .overlay(alignment: .bottom) {
                        Rectangle().fill(.neutralWhite).frame(height: 2)
                    }
                    .animation(.spring(), value: isSearching)
                    .focused($isSearching)
                
                Spacer()
            }
            .frame(
                width: isSearching
                    ? UIScreen.main.bounds.width - .appContainerPadding - 15
                    : nil
            )
        })
    }
}

extension HomeView {
    private var banners: some View {
        Image.App.dummyHomeBanner
            .resizable()
            .scaledToFit()
            .padding(.horizontal, .appContainerPadding)
    }
    
    private var todayHits: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Today’s hits")
                .typography(.title1)
                .padding(.horizontal, .appContainerPadding)
            
            ScrollView(.horizontal) {
                HStack(spacing: 16) {
                    ForEach(0..<10) { _ in
                        VStack(alignment: .leading, spacing: 8) {
                            Image.App.dummyAlbumCovers
                                .resizable()
                                .frame(width: 128, height: 128)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                            
                            VStack(alignment: .leading, spacing: 2) {
                                Text("ArTi Untuk Cinta")
                                    .typography(.body1)
                                Text("Arsy Widianto, Tiar...")
                                    .typography(.caption2)
                            }
                        }
                    }
                }
                .padding(.horizontal, .appContainerPadding)
            }
        }
    }
    
    private var artists: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Artist")
                .typography(.title1)
            
            VStack(spacing: 12) {
                ForEach(0..<10) { _ in
                    HStack(spacing: 16) {
                        Image.App.dummyArtistProfile
                            .resizable()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Adele")
                                .typography(.title3)
                            Text("43,877,516 monthly listeners")
                                .typography(.caption2)
                        }
                        
                        Spacer()
                        
                        Image.App.rightArrow
                            .resizable()
                            .frame(width: 9, height: 17)
                    }
                    .onTapGesture {
                        router.navigateTo(.artistProfile(id: "4Z8W4fKeB5YxbusRsdQVPb"))
                    }
                }
            }
        }
        .padding(.horizontal, .appContainerPadding)
    }
    
    private func onTapSearchButton() {
        viewModel.resetSearchText()
        isSearching.toggle()
    }
    
    private func onTapDownScrollView() {
        guard isSearching else { return }
        viewModel.resetSearchText()
        isSearching.toggle()
    }
}
