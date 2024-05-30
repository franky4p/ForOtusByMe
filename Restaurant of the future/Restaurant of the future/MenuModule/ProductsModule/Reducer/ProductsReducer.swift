//
//  ProductsReducer.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 30.05.2024.
//

import Foundation
import Combine

func productsReducer(state: inout ProductsState, action: ProductsAction, environment: ProductsEnvironment) -> AnyPublisher<ProductsAction, Never> {
    switch action {
    case .addItem:
        state.addItem()
    case .deleteItems(index: let index):
        state.deleteItem(index: index)
    }
    
    return Combine.Empty().eraseToAnyPublisher()
}
