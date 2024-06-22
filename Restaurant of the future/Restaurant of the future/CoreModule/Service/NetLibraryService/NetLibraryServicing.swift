//
//  NetLibraryServicing.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 18.06.2024.
//

import Foundation
import Combine
import NetLibrary

protocol NetLibraryServicing {
    func getBooks(_ cooking: TypeCooking, page: Int) -> Future<SearchResult, Error>
    func getBook(id: String) -> Future<BookResult, Error>
}

enum TypeCooking: String, CaseIterable {
    case asian = "asian_cooking"
    case evro = "european_cooking"
    case mexican = "mexican_cooking"
    
    func getTitle() -> String {
        switch self {
        case .asian:
            return "Азиатская"
        case .evro:
           return "Европейская"
        case .mexican:
            return "Мексиканская"
        }
    }
}
