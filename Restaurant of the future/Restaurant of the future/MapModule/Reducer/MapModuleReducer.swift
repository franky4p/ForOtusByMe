//
//  MapModuleReducer.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 31.05.2024.
//

import Foundation
import Combine

func mapModuleReducer(state: inout MapState, action: MapAction, environment: MapEnvironment) -> AnyPublisher<MapAction, Never> {
    switch action {
    case .showDetails:
        environment.router.openDetails()
    case .showDetailSheet:
        environment.analiticService.logEvent(event: TestEvent())
    case .close:
        environment.router.dismiss()
    }
    
    return Combine.Empty().eraseToAnyPublisher()
}
