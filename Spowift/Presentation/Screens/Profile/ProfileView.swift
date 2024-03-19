//
//  ProfileView.swift
//  Spowift
//
//  Created by kai on 3/14/24.
//

import SwiftUI
import Factory

struct ProfileView: View {
    @InjectedObject(\.profileViewModel) private var viewModel
    
    var body: some View {
        Text("Logout")
            .onTapGesture {
                viewModel.logout()
            }
    }
}

#Preview {
    ProfileView()
}
