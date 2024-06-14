//
//  MainViewModelStore.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 30.05.2024.
//

import Foundation
import SwiftUI
import SwiftData

typealias MainViewModuleStore = ReduxStore<MainViewModuleState, MainViewModuleAction, MainViewModuleEnvironment>

struct MainViewModuleState {
   
}

enum MainViewModuleAction {
    case tapButtonGoToMenu
    case openSettings
}

struct MainViewModuleEnvironment {
    let router: MainModuleOutput
}
