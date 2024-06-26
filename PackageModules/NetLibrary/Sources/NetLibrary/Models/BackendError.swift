//
// BackendError.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct BackendError: Codable, JSONEncodable, Hashable {

    public var loc: [String]
    public var msg: String
    public var type: String

    public init(loc: [String], msg: String, type: String) {
        self.loc = loc
        self.msg = msg
        self.type = type
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case loc
        case msg
        case type
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(loc, forKey: .loc)
        try container.encode(msg, forKey: .msg)
        try container.encode(type, forKey: .type)
    }
}

