//
//  RouterProduct+.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 20.06.2024.
//

import Foundation

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
