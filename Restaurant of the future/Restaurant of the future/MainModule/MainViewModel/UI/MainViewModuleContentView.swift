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
        NavigationView {
            VStack {
                Spacer()
                Text("Добро пожаловать")
                    .font(.largeTitle)
                Spacer()
                Button(action: {
                    store.send(.tapButtonGoToMenu)
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
            }.toolbar {
                ToolbarItem {
                    Image(systemName: "person.circle")
                        .onTapGesture {
                            withAnimation {
                                store.send(.openSettings)
                            }
                        }
                }
                
            }
        }
    }
}

#Preview {
    MainViewModuleContentView()
}
