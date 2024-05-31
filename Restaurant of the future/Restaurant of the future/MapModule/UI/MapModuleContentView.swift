//
//  MapModuleContentView.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 31.05.2024.
//

import SwiftUI

struct MapModuleContentView: View {
    @EnvironmentObject var store: MapStore
    @State private var isShowingDetails = false
    
    var body: some View {
        VStack {
            Text("Когда нибудь здесь появится карта, а пока вот кнопка. Ее можно нажать")
                .padding()
            Button("Нажми меня") {
                isShowingDetails = true
                store.send(.showDetails)
            }
        }.sheet(isPresented: $isShowingDetails) {
            DetailsView()
        }
    }
}

struct DetailsView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            Text("Как-то так")
                .padding()
            Button("Понятно", action: dismiss.callAsFunction)
        }
    }
}


#Preview {
    MapModuleContentView()
}