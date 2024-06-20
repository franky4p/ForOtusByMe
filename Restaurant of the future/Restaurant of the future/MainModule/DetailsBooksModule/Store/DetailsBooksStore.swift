//
//  DetailsBooksStore.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 20.06.2024.
//

import Foundation
import SwiftUI

typealias DetailsBooksStore = ReduxStore<DetailsBooksState, DetailsBooksAction, DetailsBooksEnvironment>

struct DetailsBooksState {
    private(set) var lines: [String] = []
    
    mutating func configure(data: [String]) {
        lines = data.filter { $0.contains("books") }
    }
    
}

enum DetailsBooksAction {
    case tapCell(_ key: String)
}

struct DetailsBooksEnvironment {
    let router: DetailsBooksModuleOutput
}

