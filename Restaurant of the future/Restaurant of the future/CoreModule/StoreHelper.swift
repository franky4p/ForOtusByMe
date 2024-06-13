//
//  StoreHelper.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 11.06.2024.
//

import Foundation

final class StoreHelper {
    static func getUserSettingsStore(router: Router) -> UserSettingsModuleStore {
        UserSettingsModuleStore(initialState: .init(), reducer: userSettingsModuleReducer, environment: .init(router: router))
    }
    
    static func getMapStore(router: Router) -> MapStore {
        MapStore(initialState: .init(), reducer: mapModuleReducer, environment: .init(router: router, analiticService: Restaurant_of_the_futureApp.analiticServise))
    }
    
    static func getMainViewModuleStore(router: Router) -> MainViewModuleStore {
        MainViewModuleStore(initialState: .init(), reducer: mainViewModuleReducer, environment: .init(router: router))
    }
    
    @MainActor
    static func getProductStore(router: Router) -> ProductsStore {
        ProductsStore(initialState: .init(modelContext: Restaurant_of_the_futureApp.commonStorage), reducer: productsReducer, environment: .init(router: router))
    }
}
