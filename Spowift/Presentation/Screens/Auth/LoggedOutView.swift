//
//  LoggedOutView.swift
//  Spowift
//
//  Created by kai on 3/17/24.
//

import SwiftUI
import Factory

struct LoggedOutView: View {
    @InjectedObject(\.loggedOutViewModel) private var viewModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            background
            
            VStack(spacing: 16) {
                Spacer()
                
                title
                
                aboutTheApp
                
                login
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 48)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.neutralBlack)
        .onOpenURL(perform: viewModel.handleURL(_:))
        .alert(item: $viewModel.alert) { $0.alert }
    }
}

extension LoggedOutView {
    private var background: some View {
        Image.App.loggedOutBackground
            .resizable()
            .scaledToFit()
            .overlay {
                LinearGradient(gradient: Gradient(
                    colors: [.neutralBlack, .clear, .neutralBlack]
                ), startPoint: .top, endPoint: .bottom)
            }
            .padding(.bottom, 255)
    }
    
    private var title: some View {
        Text("Music for everyone.")
            .typography(.title1)
            .foregroundStyle(.main)
    }
    
    private var aboutTheApp: some View {
        Text("Nulla Lorem mollit cupidatat irure. Laborum magna nulla duis ullamco cillum dolor. Voluptate exercitation incididunt aliquip deserunt reprehenderit elit laborum.")
            .typography(.body2)
            .foregroundColor(.neutralWhite)
            .multilineTextAlignment(.center)
    }
    
    private var login: some View {
        Button(action: {
            viewModel.onTapStartButton()
        }, label: {
            Text("Get Started")
                .typography(.title1)
                .foregroundColor(.neutralBlack)
                .frame(maxWidth: .infinity)
                .frame(height: 72)
                .background(.main)
                .clipShape(RoundedRectangle(cornerRadius: 80))
        })
        .padding(.top, 16)
    }
}

#Preview {
    LoggedOutView()
}
