//
//  ContentView.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 30.05.2024.
//

import SwiftUI
import SwiftData

struct MainContentView: View {
    @StateObject var router = Restaurant_of_the_futureApp.router
    
    var body: some View {
        NavigationStack(path: $router.path) {
            ContentView()
                .navigationDestination(for: Route.self) { route in
                    router.view(for: route)
                }
        }
        .sheet(item: $router.presentingSheet) { route in
            router.view(for: route)
        }
        .fullScreenCover(item: $router.presentingFullScreenCover) { route in
            router.view(for: route)
        }
        .environmentObject(router)
    }
}


struct ContentView: View {
    @EnvironmentObject var router: Router

    var body: some View {
        TabView(selection: createTabViewBinding()) {
            MainViewModuleContentView()
                .environmentObject(StoreHelper.getMainViewModuleStore(router: router))
                .tabItem {
                    Label("Главная", systemImage: "clipboard")
                }.tag(SelectedTab.main)
            ProductsContentView()
                .environmentObject(StoreHelper.getProductStore(router: router))
                .tabItem {
                    Label("Menu", systemImage: "menucard")
                }.tag(SelectedTab.menu)
            MapModuleContentView()
                .environmentObject(StoreHelper.getMapStore(router: router))
                .tabItem {
                    Label("Карта", systemImage: "map")
                }.tag(SelectedTab.map)
            CartContentView()
                .environmentObject(router)
                .tabItem {
                    Label("Корзина", systemImage: "cart")
                }.tag(SelectedTab.cart)
        }
    }

    private func createTabViewBinding() -> Binding<SelectedTab> {
        Binding<SelectedTab>(
            get: { router.selectedTab },
            set: { selectedTab in
                if selectedTab == router.selectedTab {
                    print("tapped same tab")
                    
//                    switch selectedTab {
//                    case .home:
//                        withAnimation {
//                            appState.homeNavigation = []
//                        }
//                        
//                    case .settings:
//                        withAnimation {
//                            appState.settingsNavigation = []
//                        }
//                    }
                }
                
                if selectedTab == .map {
                    router.presentingFullScreenCover = Route.map
                } else {
                    router.selectedTab = selectedTab
                }
            }
        )
    }
    
}

#Preview {
    MainContentView()
}
