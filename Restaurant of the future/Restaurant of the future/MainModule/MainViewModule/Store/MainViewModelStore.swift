//
//  MainViewModelStore.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 30.05.2024.
//

import Foundation
import SwiftUI
import NetLibrary

typealias MainViewModuleStore = ReduxStore<MainViewModuleState, MainViewModuleAction, MainViewModuleEnvironment>

struct MainViewModuleState {
    private(set) var booksLines: [TypeCooking : [BookLine]] = [.asian : []]
    private(set) var currentPage: [TypeCooking : Int] = [.asian : 1]
    var dataLoad: [TypeCooking : Bool] = [.asian : false]
    
    mutating func loadMoreContent(data: [Doc], type: TypeCooking) {
        currentPage[type] = (currentPage[type] ?? 1) + 1
        dataLoad[type] = true
        
        if booksLines[type] == nil {
            booksLines[type] = []
        }
        
        booksLines[type]! += data.compactMap {
            BookLine(id: $0.key,
                     title: $0.title ?? "",
                     aythor: $0.authorName?.first ?? "",
                     numberOfPages: $0.numberOfPagesMedian == nil ? "Неизвестно" : "\($0.numberOfPagesMedian ?? 0)",
                     firstPublishYear: $0.firstPublishYear == nil ? "Неизвестно" : "\($0.firstPublishYear ?? 0) г.",
                     format: $0.format ?? [],
                     seed: $0.seed ?? [])
        }
    }
    
}

enum MainViewModuleAction {
    case tapButtonGoToMenu
    case openSettings
    case fetchBooks(type: TypeCooking, currentItem: BookLine? = nil)
    case loadDataFromBackend(data: SearchResult, type: TypeCooking)
    case openDetail(_ data: [String])
}

struct MainViewModuleEnvironment {
    let router: MainModuleOutput
    let libraryService: NetLibraryServicing
}

struct BookLine: Identifiable, Hashable {
    let id: String
    let title: String
    let aythor: String
    let numberOfPages: String
    let firstPublishYear: String
    let format: [String]
    let seed: [String]
}
