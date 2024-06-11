//
//  Restaurant_of_the_futureApp.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 30.05.2024.
//

import SwiftUI
import SwiftData

@main
struct Restaurant_of_the_futureApp: App {
    
    @MainActor
    static var commonStorage: ModelContext {
        let schema = Schema([CommonProduct.self,])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        let modelContainer = try! ModelContainer(for: schema, configurations: [modelConfiguration])
        
        return modelContainer.mainContext
    }
    
    static var analiticServise: AnalyticsServicing {
        AnalyticsService()
    }

    static var router: Router {
        Router()
    }

    var body: some Scene {
        WindowGroup {
            MainContentView()
        }
    }
}
