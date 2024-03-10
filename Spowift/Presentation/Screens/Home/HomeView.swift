//
//  HomeView.swift
//  Spowift
//
//  Created by kai on 3/10/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var router: Router
    
    var body: some View {
        Text("아티스트 프로필 뷰로 이동")
            .onTapGesture {
                router.navigateTo(.artistProfile(123))
            }
    }
}

#Preview {
    HomeView()
}
