//
//  Route.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 11.06.2024.
//

import Foundation
import SwiftUI

enum Route: Hashable, Identifiable {
    var id: Self { self }
    
    case main
    case product(Int64)
    case cart
    case menu
    case map
    case details
    case bookDetail([String])
    case bookInfo(String)
    case settings
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

enum SelectedTab: String {
    case main
    case menu
    case map
    case cart
}

enum ScrollAnchor {
    case menu
}
