//
//  Resolver.swift
//  Singularity
//
//  Created by Grzegorz Sagadyn on 22/09/2020.
//

import UIKit

open class Resolver {
    // MARK: - Private Properties

    private var storage = Storage()

    // MARK: - Initialization

    public required init() {}
}

// ----------------------------------------------------------------------------------------------------------------
// MARK: - Create Bindings
// ----------------------------------------------------------------------------------------------------------------

extension Resolver: ResolverType {
    public func reset<T>(type: T.Type, name: String? = nil) {
        storage[type, name]?.reset()
    }
    
    public func registerModule<T: ModuleType>(_ module: T) {
        module.load(to: self)
    }
    
    public func register<T>(type: T.Type, name: String?, dependencyType: DependencyType, closure: @escaping (()) -> T) {
        storage[type, name] = Descriptor(type: dependencyType) { closure(()) }
    }
    
    public func unregister<T>(type: T.Type = T.self, name: String? = nil) {
        storage[type, name] = nil
    }
    
    public func resolve<T>(type: T.Type, name: String? = nil) throws -> T {
        guard let descriptor = storage[type, name] else {
            let type = String(describing: T.self)
            let message = #"Not found definition for type \#(type) with name "\#(name ?? "nil")""#
            throw SingularityError.definitionNotFound(message: message)
        }
        
        return try descriptor.resolve()
    }
}
