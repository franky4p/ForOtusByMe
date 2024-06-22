//
//  UserSettingsContentView.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 11.06.2024.
//

import SwiftUI

struct UserSettingsContentView: View {
    @EnvironmentObject var store: UserSettingsModuleStore
    @State private var scale = false
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .padding()
            Button("Exit") {
                store.send(.tapCloseSettings)
            }

            VStack {
                AnimatedView(scale: scale ? 0.5 : 1)
                    .transaction { transaction in
                        transaction.animation = .spring(duration: 2)
                    }
                   
                AnimatedView(scale: scale ? 0.5 : 1)
                    .transaction { transaction in
                        transaction.disablesAnimations = true
                        transaction.animation =  .default.repeatCount(3)
                    }
            }.onTapGesture {
                scale.toggle()
            }
        
        }.frame(maxWidth: scale ? .infinity : 150)
    }
}

struct AnimatedView: View {
    let scale: CGFloat

    var body: some View {
        Circle()
            .fill(Color.accentColor)
            .scaleEffect(scale)
    }
}

#Preview {
    UserSettingsContentView()
}
