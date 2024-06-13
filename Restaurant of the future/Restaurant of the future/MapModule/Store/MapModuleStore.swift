//
//  MapModuleStore.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 31.05.2024.
//

import Foundation

typealias MapStore = ReduxStore<MapState, MapAction, MapEnvironment>

struct MapState {
    
}

enum MapAction {
    case showDetailSheet
    case showDetails
    case close
}

struct MapEnvironment {
    var router: MapModuleOutput
    var analiticService: AnalyticsServicing
}
