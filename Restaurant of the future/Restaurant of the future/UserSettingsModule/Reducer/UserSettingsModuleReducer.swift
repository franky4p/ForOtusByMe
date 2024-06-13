//
//  UserSettingsModuleReducer.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 11.06.2024.
//

import Foundation
import Combine

func userSettingsModuleReducer(state: inout UserSettingsModuleState, action: UserSettingsModuleAction, environment: UserSettingsModuleEnvironment) -> AnyPublisher<UserSettingsModuleAction, Never> {
    switch action {
    case .tapCloseSettings:
        environment.router.closeSettings()
    }
    
    return Combine.Empty().eraseToAnyPublisher()
}
