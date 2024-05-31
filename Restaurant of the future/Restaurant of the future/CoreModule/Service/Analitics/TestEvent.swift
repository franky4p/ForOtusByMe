//
//  TestEvent.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 31.05.2024.
//

import Foundation

final class TestEvent: AnalyticsEvent {
    func systems() -> [AnalyticsSystem] {
        return [.firebase, .appsflyer]
    }

    func name(system: AnalyticsSystem) -> String {
        return "showSheet"
    }

    func data(system: AnalyticsSystem) -> [String: Any] {
        return [:]
    }
}
