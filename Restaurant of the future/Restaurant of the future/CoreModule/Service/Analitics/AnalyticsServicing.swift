//
//  AnalyticsServicing.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 31.05.2024.
//

import Foundation

protocol AnalyticsServicing: AnyObject {
    func logEvent(event: AnalyticsEvent)
    func logEvents(events: [AnalyticsEvent])
}

protocol AnalyticsEvent {
    func systems() -> [AnalyticsSystem]
    func name(system: AnalyticsSystem) -> String
    func data(system: AnalyticsSystem) -> [String: Any]
}

public enum AnalyticsSystem: CaseIterable {
    case firebase
    case appsflyer
}
