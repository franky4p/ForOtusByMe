//
//  Item.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 30.05.2024.
//

import Foundation
import SwiftData

@Model
final class CommonProduct {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
