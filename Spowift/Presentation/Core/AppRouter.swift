//
//  AppRouter.swift
//  Spowift
//
//  Created by kai on 3/10/24.
//

import SwiftUI

final class AppRouter: ObservableObject {
    enum Route: Hashable {
        case artistProfile(Int)
    }
    
    @Published fileprivate var path: NavigationPath = NavigationPath()
    
    @ViewBuilder
    fileprivate func view(for route: Route) -> some View {
        switch route {
        case .artistProfile(let id):
            ArtistProfileView(id: id)
        }
    }
    
    func navigateTo(_ appRoute: Route) {
        path.append(appRoute)
    }
    
    func navigateBack() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
}

struct BaseRouterView<Content: View>: View {
    @StateObject var router: AppRouter = AppRouter()
    
    private let content: Content // root view content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationStack(path: $router.path) {
            content
                .background(.neutralBlack)
                .edgesIgnoringSafeArea(.all)
                .navigationDestination(for: AppRouter.Route.self) { route in
                    router.view(for: route)
                }
        }
        .environmentObject(router)
    }
}
