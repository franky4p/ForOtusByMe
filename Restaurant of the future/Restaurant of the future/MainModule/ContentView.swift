//
//  ContentView.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 30.05.2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var selectedTab = "Main"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            MainViewModuleContentView(selectedTab: $selectedTab)
                .environmentObject(getMainViewModuleStore())
                .tabItem {
                    Label("Главная", systemImage: "clipboard")
                }.tag("Main")
            ProductsContentView()
                .environmentObject(getProductStore())
                .tabItem {
                    Label("Menu", systemImage: "menucard")
                }.tag("Menu")
            MapModuleContentView()
                .environmentObject(getMapStore())
                .tabItem {
                    Label("Карта", systemImage: "map")
                }.tag("Map")
            CartContentView()
                .tabItem {
                    Label("Корзина", systemImage: "cart")
                }.tag("Cart")
        }
    }
    
    @MainActor 
    private func getProductStore() -> ProductsStore {
        ProductsStore(initialState: .init(modelContext: Restaurant_of_the_futureApp.commonStorage), reducer: productsReducer, environment: .init())
    }
    
    private func getMainViewModuleStore() -> MainViewModuleStore {
        MainViewModuleStore(initialState: .init(), reducer: mainViewModuleReducer, environment: .init())
    }
    
    private func getMapStore() -> MapStore {
        MapStore(initialState: .init(), reducer: mapModuleReducer, environment: .init(analiticService: Restaurant_of_the_futureApp.analiticServise))
    }
}

#Preview {
    ContentView()
}
