//
//  ProductsStore.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 30.05.2024.
//

import Foundation
import SwiftUI
import SwiftData

typealias ProductsStore = ReduxStore<ProductsState, ProductsAction, ProductsEnvironment>

//TODO: можно ли использовать @Query за пределами View не понял, поэтому такой колхозный вариант c вызовом fetchItems() после модификации
struct ProductsState {
    private let modelContext: ModelContext
    var items: [CommonProduct] = .init()
    
    @MainActor
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        self.fetchItems()
    }
    
    mutating func addItem() {
        let newItem = CommonProduct(timestamp: Date())
        modelContext.insert(newItem)

        fetchItems()
    }
    
    mutating func deleteItem(index: Int) {
        modelContext.delete(items[index])
        fetchItems()
    }
    
    mutating func fetchItems() {
        do {
            items = try modelContext.fetch(FetchDescriptor<CommonProduct>()).sorted(by: { $0.timestamp < $1.timestamp})
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}

enum ProductsAction {
    case addItem
    case deleteItems(index: Int)
}

struct ProductsEnvironment {
    //для вызова каких-нибудь "внешних" сервисов
}
