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
    
    let id: Int
    
    var body: some View {
        Text("ArtistProfileView")
    }
}

#Preview {
    ArtistProfileView(id: 1)
}
