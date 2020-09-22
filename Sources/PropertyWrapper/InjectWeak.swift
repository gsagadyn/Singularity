//
//  InjectWeak.swift
//  SingularityExample
//
//  Created by Grzegorz Sagadyn on 22/09/2020.
//

import Foundation

@propertyWrapper
public struct InjectWeak<Component> {
    // MARK: - Private Properties

    private let resolver: Resolver
    private let name: String?

    // MARK: - Initialization

    public init(_ resolver: Resolver, name: String? = nil) {
        self.resolver = resolver
        self.name = name
    }

    // MARK: - Wrapped Value

    public var wrappedValue: Component { try! resolver.resolve(type: Component.self, name: name) }
}
