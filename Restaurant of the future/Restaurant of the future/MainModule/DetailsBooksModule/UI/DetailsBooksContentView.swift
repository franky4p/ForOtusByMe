//
//  DetailsBooksContentView.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 20.06.2024.
//

import SwiftUI

struct DetailsBooksContentView: View {
    @EnvironmentObject var store: DetailsBooksStore
    
    var body: some View {
        List {
            ForEach(store.state.lines, id: \.self) { line in
                Text(line)
                    .onTapGesture {
                        store.send(.tapCell(line))
                    }
            }
            
        }
    }
}

#Preview {
    DetailsBooksContentView()
        .environmentObject(DetailsBooksStore(initialState: .init(), reducer: detailsBooksReducer, environment: .init(router: Restaurant_of_the_futureApp.router)))
}
