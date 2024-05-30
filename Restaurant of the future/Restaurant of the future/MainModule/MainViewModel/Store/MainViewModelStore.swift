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
    case tapButton
}

struct MainViewModuleEnvironment {
    //для вызова каких-нибудь "внешних" сервисов
}