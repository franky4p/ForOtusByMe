//
//  ContentView.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 30.05.2024.
//

import SwiftUI
import SwiftData

struct MainContentView: View {
    @StateObject private var router = Restaurant_of_the_futureApp.router
    @State private var loadingComplete: Bool = false

    var body: some View {
        if loadingComplete {
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
        } else {
            SplashScreen(isActive: $loadingComplete)
        }
    }
}


struct ContentView: View {
    @EnvironmentObject var router: Router

    var body: some View {
        ScrollViewReader { proxy in
            TabView(selection: createTabViewBinding(scrollViewProxy: proxy)) {
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
    }

    private func createTabViewBinding(scrollViewProxy: ScrollViewProxy) -> Binding<SelectedTab> {
        Binding<SelectedTab>(
            get: { router.selectedTab },
            set: { selectedTab in
                if selectedTab == router.selectedTab {
                    print("tapped same tab")
                    
                    switch selectedTab {
                    case .main:
                        withAnimation {
                            router.backToRoot()
                        }
                        
                    case .menu:
                        ///The minor detail about not going with the obvious .top is the scroll view will happily scroll to the top of that view
                        ///but will not account for the default spacing between itself and the app bar title.
                        ///Instead, by tagging the first view in the scroll view and using .bottom, the content below the view will push it to the top, preserving the default spacing.
                        withAnimation {
                            scrollViewProxy.scrollTo(ScrollAnchor.menu, anchor: .bottom)
                        }
                        
                    default:
                        print("Not implimented")
                    }
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
