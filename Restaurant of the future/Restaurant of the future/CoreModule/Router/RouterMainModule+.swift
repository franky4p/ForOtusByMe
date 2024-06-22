//
//  RouterMainModule+.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 20.06.2024.
//

import Foundation

extension Router: DetailsBooksModuleOutput {
    func goToBook(key: String) {
        path.append(Route.bookInfo(key))
    }
}

extension Router: BooksInfoModuleOutput {
    func goToInfo() {
        
    }
    
}

extension Router: MainModuleOutput {
    func goToBooksDetail(data: [String]) {
        path.append(Route.bookDetail(data))
    }

    func openSettings() {
        presentFullScreen(Route.settings)
    }
    
    func goToMenu() {
        selectedTab = .menu
    }
}

extension Router: UserSettingsModuleOutput {
    func closeSettings() {
        dismiss()
    }
}
