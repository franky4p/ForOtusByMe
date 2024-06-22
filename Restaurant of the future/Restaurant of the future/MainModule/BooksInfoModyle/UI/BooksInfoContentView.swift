//
//  BooksInfoContentView.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 20.06.2024.
//

import SwiftUI

struct BooksInfoContentView: View {
    @EnvironmentObject var store: BooksInfoStore
    @State private var add: Bool = true
    
    var body: some View {
        VStack {
            VStack {
                Text(store.state.title)
                Text(store.state.publishDate)
                Text(store.state.format)
                Text("\(store.state.isbn10)")
            }
            .padding()
            .opacity(add ? 1 : 0.5)
            .onAppear {
                store.send(.fetchInfo)
            }
            .onTapGesture {
                withAnimation(.easeInOut(duration: 1.5)) {
                    add.toggle()
                }
            }
            
            if !store.state.loadComplite {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .black))
            }
            Spacer()
        }
        .frame(width: add ? 300 : 150,
               height: add ? 300 : 150,
               alignment: add ? .center : .bottom)
        .offset(x: add ? 0 : 100 , y: add ? 0 : 240)
    }
}

#Preview {
    BooksInfoContentView()
        .environmentObject(BooksInfoStore(initialState: .init(key: ""), reducer: booksInfoReducer, environment: .init(router: Restaurant_of_the_futureApp.router, libraryService: MockNetLibraryService())))
}
