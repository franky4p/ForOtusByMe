//
//  DetailsBooksReducer.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 20.06.2024.
//

import Foundation
import Combine
import NetLibrary

func detailsBooksReducer(state: inout DetailsBooksState, action: DetailsBooksAction, environment: DetailsBooksEnvironment) -> AnyPublisher<DetailsBooksAction, Never> {
    switch action {
    case .tapCell(let key):
        environment.router.goToBook(key: key)
    }

    return Combine.Empty().eraseToAnyPublisher()
}
