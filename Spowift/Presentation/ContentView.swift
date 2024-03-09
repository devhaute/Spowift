//
//  ContentView.swift
//  Spowift
//
//  Created by kai on 3/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world")
                .typography(.title1)
                .background(Color.red)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
