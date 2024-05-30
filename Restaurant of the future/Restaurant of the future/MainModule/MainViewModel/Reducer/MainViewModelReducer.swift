//
//  MainViewModelReducer.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 30.05.2024.
//

import Foundation
import Combine

func mainViewModuleReducer(state: inout MainViewModuleState, action: MainViewModuleAction, environment: MainViewModuleEnvironment) -> AnyPublisher<MainViewModuleAction, Never> {
    switch action {
    case .tapButton:
        print(#function)
    }
    
    return Combine.Empty().eraseToAnyPublisher()
}
