//
//  ProductsContentView.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 30.05.2024.
//

import SwiftUI

struct ProductsContentView: View {
    @EnvironmentObject var store: ProductsStore

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(store.state.items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            store.send(.addItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                store.send(.deleteItems(index: index))
            }
        }
    }
}

#Preview {
    ProductsContentView()
        .environmentObject(ProductsStore(initialState: .init(modelContext: Restaurant_of_the_futureApp.commonStorage), reducer: productsReducer, environment: .init(router: Restaurant_of_the_futureApp.router)))
        
}
