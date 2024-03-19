//
//  ContentView.swift
//  Spowift
//
//  Created by kai on 3/7/24.
//

import SwiftUI
import Factory
import Combine

struct ContentView: View {
    @InjectedObject(\.spotifyAuthManager) private var spotifyAuthManager
    
    var body: some View {
        if spotifyAuthManager.isAuthorized {
            LoggedView()
        } else {
            LoggedOutView()
        }
    }
}

#Preview {
    ContentView()
}
