//
//  MainViewModuleContentView.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 30.05.2024.
//

import SwiftUI

struct MainViewModuleContentView: View {
    @EnvironmentObject var store: MainViewModuleStore
    
    var body: some View {
        VStack {
            Spacer()
            Text("Добро пожаловать")
                .font(.largeTitle)
            Spacer()
            Button(action: { store.send(.tapButton) }) {
                Text("Погнали")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
            Spacer()
        }
    }
}

#Preview {
    MainViewModuleContentView()
}
