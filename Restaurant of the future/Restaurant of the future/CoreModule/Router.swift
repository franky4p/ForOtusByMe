//
//  Router.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 11.06.2024.
//

import Foundation
import SwiftUI

final class Router: ObservableObject {
    @Published var selectedTab: SelectedTab = .main
    @Published var path: NavigationPath = NavigationPath()
    @Published var presentingSheet: Route?
    @Published var presentingFullScreenCover: Route?
    
    private func backToRoot() {
        path.removeLast(path.count)
    }
    
    private func back() {
        path.removeLast()
    }

    private func presentSheet(_ route: Route) {
        self.presentingSheet = route
    }

    private func presentFullScreen(_ route: Route) {
        self.presentingFullScreenCover = route
    }

    func dismiss() {
        if !path.isEmpty {
            path.removeLast()
        } else if presentingSheet != nil {
            presentingSheet = nil
        } else if presentingFullScreenCover != nil {
            presentingFullScreenCover = nil
        }
    }
    
    // Builds the views
    @ViewBuilder func view(for route: Route) -> some View {
        switch route {
        case .map:
            MapModuleContentView()
                .environmentObject(StoreHelper.getMapStore(router: self))
        case .product(let id):
            CartContentView()
        case .cart:
            CartContentView()
        case .menu:
            CartContentView()
        case .details:
            DetailsView()
        case .settings:
            UserSettingsContentView()
                .environmentObject(StoreHelper.getUserSettingsStore(router: self))
        case .main:
            MainViewModuleContentView()
                .environmentObject(StoreHelper.getMainViewModuleStore(router: self))
        }
    }
    
    enum NavigationType {
        case push
        case sheet
        case fullScreenCover
    }
}

extension Router: ProductModuleOutput {
    func goTo() {
        
    }
    
    func showProduct(_ productId: Int64) {
        path.append(Route.product(productId))
    }
    
    func showMap() {
        selectedTab = .map
    }
    
    func showCart() {
        selectedTab = .cart
    }
}

extension Router: MainModuleOutput {
    func openSettings() {
        presentFullScreen(Route.settings)
    }
    
    func goToMenu() {
        selectedTab = .menu
    }
}

extension Router: MapModuleOutput {
    func openDetails() {
        path.append(Route.details)
    }
}

extension Router: UserSettingsModuleOutput {
    func closeSettings() {
        dismiss()
    }
}
