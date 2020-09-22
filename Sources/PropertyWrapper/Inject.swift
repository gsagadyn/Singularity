//
//  Inject.swift
//  Singularity
//
//  Created by Grzegorz Sagadyn on 22/09/2020.
//

import Foundation

@propertyWrapper
public struct Inject<Component> {
    // MARK: - Private Properties
    
    private var component: Component

    // MARK: - Initialization
    
    public init(_ resolver: Resolver, name: String? = nil) {
        self.component = try! resolver.resolve(type: Component.self, name: name)
    }

    // MARK: - Wrapped Value
    
    public var wrappedValue: Component {
        get { component }
        mutating set { component = newValue }
    }
}
