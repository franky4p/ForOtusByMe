//
//  AnaliticServise.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 31.05.2024.
//

import Foundation

final class AnalyticsService: AnalyticsServicing & ServiceProtocol {
    class var service: AnalyticsService {
        if let service: AnalyticsService = ServiceLocator.service() {
            return service
        }

        let service = AnalyticsService()
        ServiceLocator.addService(service)
        
        return service
    }

    func logEvent(event: any AnalyticsEvent) {
        
    }
    
    func logEvents(events: [any AnalyticsEvent]) {
        
    }
}
