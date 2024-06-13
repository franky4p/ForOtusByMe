//
//  UserSettingsModuleStore.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 11.06.2024.
//

import Foundation
import SwiftUI

typealias UserSettingsModuleStore = ReduxStore<UserSettingsModuleState, UserSettingsModuleAction, UserSettingsModuleEnvironment>

struct UserSettingsModuleState {
   
}

enum UserSettingsModuleAction {
    case tapCloseSettings
}

struct UserSettingsModuleEnvironment {
    let router: UserSettingsModuleOutput
}
