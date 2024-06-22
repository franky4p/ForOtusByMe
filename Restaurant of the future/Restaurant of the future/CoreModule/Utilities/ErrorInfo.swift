//
//  ErrorInfo.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 18.06.2024.
//

import Foundation

public class ErrorInfo: NSObject, Error {
    public let error: Error?
    public let httpStatusCode: Int?
    public let errorMessage: String

    public init(error: Error? = nil, httpStatusCode: Int? = nil, errorMessage: String) {
        self.error = error
        self.httpStatusCode = httpStatusCode
        self.errorMessage = errorMessage
    }
}
