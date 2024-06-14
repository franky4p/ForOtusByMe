//
//  UserSettingsContentView.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 11.06.2024.
//

import SwiftUI

struct UserSettingsContentView: View {
    @EnvironmentObject var store: UserSettingsModuleStore
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .padding()
        Button("Exit") {
            withAnimation {
                store.send(.tapCloseSettings)
            }
            
        }
    }
}

#Preview {
    UserSettingsContentView()
}
