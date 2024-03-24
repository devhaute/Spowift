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
                
                Text("Fauzian Ahmad")
                    .typography(.title2)
                    .padding(.top, 16)
                
                follow
                    .padding(.top, 56)
                
                Spacer()
            }
            .padding(.top, 24)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundStyle(.neutralWhite)
            .background(.neutralBlack)
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
    
    private var follow: some View {
        HStack(spacing: 128) {
            VStack(spacing: 4) {
                Text("Followers")
                    .typography(.caption1)
                Text("129")
                    .typography(.title2)
            }
            
            VStack(spacing: 4) {
                Text("Following")
                    .typography(.caption1)
                Text("238")
                    .typography(.title2)
            }
        }
    }
}

#Preview {
    ArtistProfileView(id: "4Z8W4fKeB5YxbusRsdQVPb")
}
