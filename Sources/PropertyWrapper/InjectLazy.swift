//
//  InjectLazy.swift
//  Singularity
//
//  Created by Grzegorz Sagadyn on 22/09/2020.
//

import Foundation

@propertyWrapper
public struct InjectLazy<Component> {
    // MARK: - Private Properties
    
    private let resolver: Resolver
    private let name: String?
    private var component: Component?

    // MARK: - Initialization
    
    public init(_ resolver: Resolver, name: String? = nil) {
        self.resolver = resolver
        self.name = name
    }

    // MARK: - Wrapped Value
    
    public var wrappedValue: Component {
        mutating get {
            if let component = component { return component }
            let component = try! resolver.resolve(type: Component.self, name: name)
            self.component = component
            return component
        }
        mutating set { component = newValue }
    }
}
