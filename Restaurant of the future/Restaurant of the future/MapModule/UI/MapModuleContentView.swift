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
            HStack {
                Spacer()
                Button("X") {
                    var transaction = Transaction(animation: .none)
                    transaction.disablesAnimations = true
                    withTransaction(transaction) {
                        store.send(.close)
                    }
                }.padding(.horizontal)
            }
            Spacer()
            Text("Когда нибудь здесь появится карта, а пока вот кнопка. Ее можно нажать")
                .padding()
            Button("Открой шторку без роутера и анимации") {
                //FIXME: пример выключения стандартной анимации, срабатывает не с первого раза
                var transaction = Transaction(animation: .none)
                transaction.disablesAnimations = true
                withTransaction(transaction) {
                    isShowingDetails = true
                }
                store.send(.sendAnaliticShowDetailSheet)
            }
            
            //TODO: нужно доработать роутер ибо
            //Currently, only presenting a single sheet is supported.
            //The next sheet will be presented when the currently presented sheet gets dismissed.
            Button("Открой шторку с роутером") {
                store.send(.showDetails)
            }
            Spacer()
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
            Button("Понятно") {
                var transaction = Transaction(animation: .none)
                transaction.disablesAnimations = true
                withTransaction(transaction) {
                    dismiss.callAsFunction()
                }
            }
        }
    }
}


#Preview {
    MapModuleContentView()
}
