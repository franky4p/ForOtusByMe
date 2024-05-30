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

//TODO: можно ли использовать @Query за пределами View не понял, поэтому такой колхозный вариант
//из-за этого вызываю после каждого добавления/уддаления fetchItems() для обновления items и порядок скачет
struct ProductsState {
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext
    var items: [CommonProduct] = .init()
    
    @MainActor
    init() {
        let schema = Schema([CommonProduct.self,])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        self.modelContainer = try! ModelContainer(for: schema, configurations: [modelConfiguration])
        self.modelContext = modelContainer.mainContext
        
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
            items = try modelContext.fetch(FetchDescriptor<CommonProduct>())
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
