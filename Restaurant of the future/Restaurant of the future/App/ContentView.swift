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
        .environmentObject(router)
    }
}


struct ContentView: View {
    @EnvironmentObject var router: Router
    //@State private var selectedTab: SelectedTab = .main
    
    var body: some View {
        TabView(selection: createTabViewBinding()) {
            MainViewModuleContentView()
                .environmentObject(getMainViewModuleStore())
                .tabItem {
                    Label("Главная", systemImage: "clipboard")
                }.tag(SelectedTab.main)
            ProductsContentView()
                .environmentObject(getProductStore())
                .tabItem {
                    Label("Menu", systemImage: "menucard")
                }.tag(SelectedTab.menu)
            MapModuleContentView()
                .environmentObject(getMapStore())
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
    
    @MainActor 
    private func getProductStore() -> ProductsStore {
        ProductsStore(initialState: .init(modelContext: Restaurant_of_the_futureApp.commonStorage), reducer: productsReducer, environment: .init(router: router))
    }
    
    private func getMainViewModuleStore() -> MainViewModuleStore {
        MainViewModuleStore(initialState: .init(), reducer: mainViewModuleReducer, environment: .init(router: router))
    }
    
    private func getMapStore() -> MapStore {
        MapStore(initialState: .init(), reducer: mapModuleReducer, environment: .init(router: router, analiticService: Restaurant_of_the_futureApp.analiticServise))
    }
    
    private func createTabViewBinding() -> Binding<SelectedTab> {
        Binding<SelectedTab>(
            get: { router.selectedTab },
            set: { selectedTab in
                print("tapped  \(selectedTab)")
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
                
                // Make sure the new value is persisted.
                router.selectedTab = selectedTab
            }
        )
    }
    
}

#Preview {
    MainContentView()
}
