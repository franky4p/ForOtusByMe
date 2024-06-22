//
//  BooksInfoReducer.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 20.06.2024.
//

import Foundation
import Combine
import NetLibrary

func booksInfoReducer(state: inout BooksInfoState, action: BooksInfoAction, environment: BooksInfoEnvironment) -> AnyPublisher<BooksInfoAction, Never> {
    switch action {
    case .tapCell:
        environment.router.goToInfo()

    case .loadDataFromBackend(data: let response):
        state.loadContent(data: response)

    case .fetchInfo:
        return environment.libraryService.getBook(id: state.getKey())
            .replaceError(with: BookResult(key: ""))
            .map { BooksInfoAction.loadDataFromBackend(data: $0) }
            .eraseToAnyPublisher()
    }

    return Combine.Empty().eraseToAnyPublisher()
}

