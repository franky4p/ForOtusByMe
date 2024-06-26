//
//  NetLibraryService.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 18.06.2024.
//

import Foundation
import Combine
import NetLibrary

class NetLibraryService: NetLibraryServicing {
    func getBooks(_ cooking: TypeCooking, page: Int) -> Future<SearchResult, any Error> {
        Future<SearchResult, Error> { promise in
            SearchAPI.searchGet(q: cooking.rawValue, page: page) { data, error in
                if let data = data {
                    promise(.success((data)))
                } else {
                    promise(.failure(error ?? ErrorInfo(errorMessage: "NetLibraryService getBooks: request failed")))
                    print("Error")
                    print(error as Any)
                }
            }
        }
    }

    func getBook(id: String) -> Future<BookResult, any Error> {
        OpenAPIClientAPI.customHeaders = ["accept" : "application/json"]
        return Future<BookResult, Error> { promise in
            BooksAPI.booksGet(olid: id) { data, error in
                if let data = data {
                    promise(.success((data)))
                } else {
                    promise(.failure(error ?? ErrorInfo(errorMessage: "NetLibraryService getBook: request failed")))
                    print("Error")
                    print(error as Any)
                }
            }
        }
    }
}

class MockNetLibraryService: NetLibraryServicing {
    func getBooks(_ cooking: TypeCooking, page: Int) -> Future<SearchResult, any Error> {
        Future<SearchResult, Error> { promise in
        }
    }
    
    func getBook(id: String) -> Future<BookResult, any Error> {
        Future<BookResult, Error> { promise in
        }
    }
    
}
