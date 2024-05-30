//
//  ContentView.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 30.05.2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView(selection: /*@START_MENU_TOKEN@*/.constant(1)/*@END_MENU_TOKEN@*/, content: {
            MainViewModuleContentView()
                .environmentObject(getMainViewModuleStore())
                .tabItem {
                    Label("Главная", systemImage: "clipboard")
                }.tag(1)
            ProductsContentView()
                .environmentObject(getProductStore())
                .tabItem {
                    Label("Menu", systemImage: "menucard")
                }.tag(2)
            Text("Тут будет карта")
                .tabItem {
                    Label("Карта", systemImage: "map")
                }.tag(3)
            Text("Тут будет корзина")
                .tabItem {
                    Label("Корзина", systemImage: "cart")
                }.tag(4)
        })
    }
    
    @MainActor 
    private func getProductStore() -> ProductsStore {
        ProductsStore(initialState: .init(), reducer: productsReducer, environment: .init())
    }
    
    private func getMainViewModuleStore() -> MainViewModuleStore {
        MainViewModuleStore(initialState: .init(), reducer: mainViewModuleReducer, environment: .init())
    }
}

#Preview {
    ContentView()
}
