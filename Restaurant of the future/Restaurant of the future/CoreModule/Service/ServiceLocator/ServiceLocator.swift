//
//  ServiceLocator.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 09.07.2024.
//

import Foundation

final class ServiceLocator: LocatorServicing {
    private static let instance = ServiceLocator()
    private lazy var services: [String: Any] = [:]

    class func service<T>() -> T? {
        return instance.service()
    }

    class func addService<T>(_ service: T) {
        instance.addService(service)
    }

    class func removeService<T>(_ service: T) {
        instance.removeService(service)
    }

    func service<T>() -> T? {
        let key = typeName(T.self)
        return services[key] as? T
    }

    private func addService<T>(_ service: T) {
        let key = typeName(T.self)
        services[key] = service
    }

    private func removeService<T>(_ service: T) {
        let key = typeName(T.self)
        services.removeValue(forKey: key)
    }

    private func typeName(_ some: Any) -> String {
        (some is Any.Type) ? "\(some)" : "\(type(of: some))"
    }
}
