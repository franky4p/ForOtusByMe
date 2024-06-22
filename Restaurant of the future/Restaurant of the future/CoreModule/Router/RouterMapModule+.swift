//
//  RouterMapModule+.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 20.06.2024.
//

import Foundation

extension Router: MapModuleOutput {
    func openDetails() {
        presentSheet(.details)
    }
}
