//
//  MainViewModuleContentView.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 30.05.2024.
//

import SwiftUI

struct MainViewModuleContentView: View {
    @EnvironmentObject var store: MainViewModuleStore
    @State private var variant: TypeCooking = .asian
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Picker("", selection: $variant) {
                        ForEach(TypeCooking.allCases, id: \.self) { value in
                            Text(value.getTitle())
                                .tag(value.getTitle())
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                        .onChange(of: variant) { _, newValue in
                            store.send(.fetchBooks(type: newValue,
                                                   currentItem: store.state.booksLines[newValue]?.first))
                        }
                    
                    ScrollView {
                        LazyVStack(spacing: 0) {
                            ForEach(store.state.booksLines[variant] ?? [], id: \.self) { line in
                                bookLine(line)
                                    .onTapGesture {
                                        store.send(.openDetail(line.seed))
                                    }
                            }
                            
                        }
                        
                        
                        if store.state.dataLoad[variant] == false {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .black))
                                .onAppear { store.send(.fetchBooks(type: variant)) }
                        }
                    }
                }

                Spacer()
                Button(action: { store.send(.tapButtonGoToMenu)})
                {
                    Text("Погнали")
                        .font(.largeTitle)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .foregroundStyle(.black)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(16)
                }
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
    
    private func bookLine(_ line: BookLine) -> some View {
        VStack {
            Group {
                Text(line.title)
                    .font(.title)
                Text(line.aythor)
                    .font(.title2)
            }
            .padding(.horizontal)
            
            HStack {
                VStack {
                    Text("Дата публикации")
                    Text(line.firstPublishYear)
                }
                Spacer()
                VStack {
                    Text("Количество страниц")
                    Text(line.numberOfPages)
                }
            }
            .padding()
            
            Text("Формат: \(line.format)")
            
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(.gray)
                .padding(.horizontal)
        }
        .onAppear { store.send(.fetchBooks(type: variant, currentItem: line)) }
    }
}


#Preview {
    MainViewModuleContentView()
        .environmentObject(MainViewModuleStore(initialState: .init(), reducer: mainViewModuleReducer, environment: .init(router: Restaurant_of_the_futureApp.router, libraryService: MockNetLibraryService())))
}
