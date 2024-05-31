//
//  MainViewModuleContentView.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 30.05.2024.
//

import SwiftUI

struct MainViewModuleContentView: View {
    @EnvironmentObject var store: MainViewModuleStore
    @Binding var selectedTab: String
    
    var body: some View {
        VStack {
            Spacer()
            Text("Добро пожаловать")
                .font(.largeTitle)
            Spacer()
            Button(action: {
                selectedTab = "Menu"
                store.send(.tapButton)
            }) {
                Text("Погнали")
                    .font(.largeTitle)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundStyle(.black)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(16)
            }
            Spacer()
        }
    }
}

#Preview {
    MainViewModuleContentView(selectedTab: .constant("Menu"))
}
