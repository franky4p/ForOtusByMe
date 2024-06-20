//
//  BooksInfoContentView.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 20.06.2024.
//

import SwiftUI

struct BooksInfoContentView: View {
    @EnvironmentObject var store: BooksInfoStore
    
    var body: some View {
        Text(store.state.getKey())
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .black))
    }
}

#Preview {
    BooksInfoContentView()
        .environmentObject(BooksInfoStore(initialState: .init(key: ""), reducer: booksInfoReducer, environment: .init(router: Restaurant_of_the_futureApp.router, libraryService: MockNetLibraryService())))
}
