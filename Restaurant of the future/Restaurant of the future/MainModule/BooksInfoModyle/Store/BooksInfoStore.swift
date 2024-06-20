//
//  BooksInfoStore.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 20.06.2024.
//

import Foundation
import SwiftUI

typealias BooksInfoStore = ReduxStore<BooksInfoState, BooksInfoAction, BooksInfoEnvironment>

struct BooksInfoState {
    private let key: String
    
    init(key: String) {
        self.key = key
    }
    
    func getKey() -> String {
        key
    }
}

enum BooksInfoAction {
    case tapCell
}

struct BooksInfoEnvironment {
    let router: BooksInfoModuleOutput
    let libraryService: NetLibraryServicing
}

