//
//  ArtistProfileView.swift
//  Spowift
//
//  Created by kai on 3/10/24.
//

import SwiftUI
import Factory

struct ArtistProfileView: View {
    @EnvironmentObject private var router: AppRouter
    @InjectedObject(\.artistProfileViewModel) private var viewModel
    
    let id: String
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            curveEffects
            
            VStack(spacing: 0) {
                profileImage
                
                Text(viewModel.artist.name)
                    .typography(.title2)
                    .padding(.top, 16)
                
                summary
                    .padding(.top, 56)
                
                Spacer()
            }
            .padding(.top, 24)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundStyle(.neutralWhite)
            .background(.neutralBlack)
        }
        .appNavigationBar {
            Image.App.navigationBack
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .onTapGesture {
                    onTapNavigationBack()
                }
        } center: {
            Text("Artist")
                .typography(.title1)
                .foregroundStyle(.neutralWhite)
        }
        .task {
            await viewModel.getArtist(id: id)
        }
    }
}

extension ArtistProfileView {
    private var curveEffects: some View {
        Image.App.curveEffects
            .resizable()
            .scaledToFit()
            .frame(width: 136, height: 178)
            .offset(x: -80, y: -80)
            .zIndex(1)
    }
    
    private var profileImage: some View {
        Image.App.centerTab
            .resizable()
            .scaledToFit()
            .frame(width: 96, height: 96)
    }
    
    private var summary: some View {
        HStack(spacing: 128) {
            VStack(spacing: 4) {
                Text("Followers")
                    .typography(.caption1)
                Text(viewModel.artist.totalFollowers.abbreviate)
                    .typography(.title2)
            }
            
            VStack(spacing: 4) {
                Text("Popularity")
                    .typography(.caption1)
                Text(viewModel.artist.popularity.abbreviate)
                    .typography(.title2)
            }
        }
    }
    
    private func onTapNavigationBack() {
        router.navigateBack()
    }
}

#Preview {
    ArtistProfileView(id: "4Z8W4fKeB5YxbusRsdQVPb")
}
