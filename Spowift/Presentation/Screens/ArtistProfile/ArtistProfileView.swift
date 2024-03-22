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
        VStack {
            Circle()
                .frame(width: 96, height: 96)
            
            Text("Fauzian Ahmad")
            
            HStack {
                
            }
        }
    }
}

#Preview {
    ArtistProfileView(id: "4Z8W4fKeB5YxbusRsdQVPb")
}
