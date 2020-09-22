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
// MARK: - Subscript
// ----------------------------------------------------------------------------------------------------------------

extension Resolver {
    /// Returns an instance of an object based on existing bindings or will trigger fatal error if missing.
    ///
    /// - parameters:
    ///   - type: Type of object to provide.
    ///   - name: Name of dependency.
    /// - returns: An instance of class or an implementation of a protocol.
    public subscript<T>(type: T.Type, name: String? = nil) -> T { resolve(type: type, name: name) }
}

// ----------------------------------------------------------------------------------------------------------------
// MARK: - Create Bindings
// ----------------------------------------------------------------------------------------------------------------

extension Resolver {
    /// Register bindings defined within module.
    ///
    /// - parameters:
    ///   - module: A class that definies binding.
    public func registerModule<T: ModuleType>(_ module: T) {
        module.load(to: self)
    }

    /// Returns an instance of an object based on existing bindings or will trigger fatal error if missing.
    ///
    /// - parameters:
    ///   - type: Type of object to provide.
    ///   - name: Name of dependency.
    /// - returns: An instance of class or an implementation of a protocol.
    public func resolve<T>(type: T.Type, name: String? = nil) -> T {
        storage[type, name].resolve()
    }

    /// Register a class/protocol to an instance provided through a closure.
    ///
    /// - parameters:
    ///   - type: Type of class or protocol.
    ///   - name: Name of dependency.
    ///   - dependencyType: Defines dependency type [weak / strong].
    ///   - closure: Closure that produce an injection object.
    public func register<T>(type: T.Type = T.self, name: String? = nil, dependencyType: DependencyType = .weak, closure: @escaping (()) -> T) {
        storage[type, name] = Descriptor(type: dependencyType) { closure(()) }
    }
    
    /// Reestablish dependency described by type and name.
    ///
    /// - parameters:
    ///   - type: Protocol or a Class.
    ///   - name: Name of dependency.
    public func reestablish<T>(type: T.Type, name: String? = nil) {
        storage[type, name].reestablish()
    }
}
