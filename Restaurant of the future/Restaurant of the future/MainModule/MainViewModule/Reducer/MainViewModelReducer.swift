//
//  MainViewModelReducer.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 30.05.2024.
//

import Foundation
import Combine
import NetLibrary

func mainViewModuleReducer(state: inout MainViewModuleState, action: MainViewModuleAction, environment: MainViewModuleEnvironment) -> AnyPublisher<MainViewModuleAction, Never> {
    switch action {
    case .tapButtonGoToMenu:
        environment.router.goToMenu()
        
    case .openSettings:
        environment.router.openSettings()
        
    case .fetchBooks(type: let typeCooking, currentItem: let currentItem):
        let thresholdIndex: Int?
        if let endIndex = state.booksLines[typeCooking]?.endIndex {
            thresholdIndex = state.booksLines[typeCooking]?.index(endIndex, offsetBy: -1)
        } else {
            thresholdIndex = nil
        }

        let currentId: Int?
        if let currentItem = currentItem {
            currentId = state.booksLines[typeCooking]?.lastIndex(of: currentItem)
        } else {
            currentId = nil
        }

        if (thresholdIndex == currentId || currentItem == nil) {
            state.dataLoad[typeCooking] = false
            let page = state.currentPage[typeCooking] ?? 1

            return environment.libraryService.getBooks(typeCooking, page: page)
                .replaceError(with: SearchResult())
                .map { MainViewModuleAction.loadDataFromBackend(data: $0, type: typeCooking) }
                .eraseToAnyPublisher()
        }
        
    case .loadDataFromBackend(data: let response, type: let typeCooking):
        guard let docs = response.docs else {
            return Empty().eraseToAnyPublisher()
        }
        
        state.loadMoreContent(data: docs, type: typeCooking)
    case .openDetail(let data):
        environment.router.goToBooksDetail(data: data)
    }
    
    return Combine.Empty().eraseToAnyPublisher()
}
