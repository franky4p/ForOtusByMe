//
//  BooksInfoStore.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 20.06.2024.
//

import Foundation
import SwiftUI
import NetLibrary

typealias BooksInfoStore = ReduxStore<BooksInfoState, BooksInfoAction, BooksInfoEnvironment>

struct BooksInfoState {
    private let key: String
    private(set) var title: String = ""
    private(set) var publishDate: String = ""
    private(set) var format: String = ""
    private(set) var isbn10: [String] = []
    var loadComplite: Bool = false

    init(key: String) {
        self.key = key
    }

    mutating func loadContent(data: BookResult) {
        title = data.title ?? ""
        publishDate = data.publishDate ?? "не указано"
        format = data.physicalFormat ?? "не указано"
        isbn10 = data.isbn10 ?? []
        
        loadComplite = true
    }

    func getKey() -> String {
        key.replacingOccurrences(of: "/books/", with: "")
    }
}

enum BooksInfoAction {
    case tapCell
    case fetchInfo
    case loadDataFromBackend(data: BookResult)
}

struct BooksInfoEnvironment {
    let router: BooksInfoModuleOutput
    let libraryService: NetLibraryServicing
}

