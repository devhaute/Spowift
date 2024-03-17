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
    }
}

extension HomeView {
    private var banners: some View {
        Image.App.dummyHomeBanner
            .resizable()
            .scaledToFit()
            .padding(.horizontal, 32)
    }
    
    private var todayHits: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Today’s hits")
                .typography(.title1)
                .padding(.horizontal, 32)
            
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
                .padding(.horizontal, 32)
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
                        router.navigateTo(.artistProfile(123))
                    }
                }
            }
        }
        .padding(.horizontal, 32)
    }
}
