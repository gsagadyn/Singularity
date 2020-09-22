//
//  ResolverType.swift
//  SingularityExample
//
//  Created by Grzegorz Sagadyn on 22/09/2020.
//

import Foundation

public protocol ResolverType {
    /// Registers dependencies defined within module.
    ///
    /// - parameters:
    ///   - module: A class that definies binding.
    func registerModule<T: ModuleType>(_ module: T)

    /// Registers new dependency definition.
    ///
    /// - parameters:
    ///   - type: Type of class or protocol.
    ///   - name: Name of dependency.
    ///   - dependencyType: Defines dependency type [weak / strong].
    ///   - closure: Closure that produce an injection object.
    func register<T>(type: T.Type, name: String?, dependencyType: DependencyType, closure: @escaping (()) -> T)

    /// Unregisters dependency definition.
    ///
    /// - parameters:
    ///   - type: Type of class or protocol.
    ///   - name: Name of dependency.
    func unregister<T>(type: T.Type, name: String?)

    /// Returns an instance of an object based on existing dependencies or will trigger fatal error if missing.
    ///
    /// - parameters:
    ///   - type: Type of object to provide.
    ///   - name: Name of dependency.
    /// - returns: An instance of class or an implementation of a protocol.
    func resolve<T>(type: T.Type, name: String?) throws -> T
}

// -----------------------------------------------------------------------------
// MARK: - Default Implementation
// -----------------------------------------------------------------------------

extension ResolverType {
    /// Registers new dependency definition.
    ///
    /// - parameters:
    ///   - closure: Closure that produce an injection object.
    public func register<T>(closure: @escaping (()) -> T) {
        register(type: T.self, name: nil, dependencyType: .weak, closure: closure)
    }
    
    /// Registers new dependency definition.
    ///
    /// - parameters:
    ///   - type: Type of class or protocol.
    ///   - closure: Closure that produce an injection object.
    public func register<T>(type: T.Type, closure: @escaping (()) -> T) {
        register(type: type, name: nil, dependencyType: .weak, closure: closure)
    }
    
    /// Registers new dependency definition.
    ///
    /// - parameters:
    ///   - name: Name of dependency.
    ///   - closure: Closure that produce an injection object.
    public func register<T>(name: String?, closure: @escaping (()) -> T) {
        register(type: T.self, name: name, dependencyType: .weak, closure: closure)
    }
    
    /// Registers new dependency definition.
    ///
    /// - parameters:
    ///   - dependencyType: Defines dependency type [weak / strong].
    ///   - closure: Closure that produce an injection object.
    public func register<T>(dependencyType: DependencyType, closure: @escaping (()) -> T) {
        register(type: T.self, name: nil, dependencyType: dependencyType, closure: closure)
    }
    
    /// Registers new dependency definition.
    ///
    /// - parameters:
    ///   - type: Type of class or protocol.
    ///   - name: Name of dependency.
    ///   - closure: Closure that produce an injection object.
    public func register<T>(type: T.Type, name: String?, closure: @escaping (()) -> T) {
        register(type: type, name: name, dependencyType: .weak, closure: closure)
    }
    
    /// Registers new dependency definition.
    ///
    /// - parameters:
    ///   - type: Type of class or protocol.
    ///   - dependencyType: Defines dependency type [weak / strong].
    ///   - closure: Closure that produce an injection object.
    public func register<T>(type: T.Type, dependencyType: DependencyType, closure: @escaping (()) -> T) {
        register(type: type, name: nil, dependencyType: dependencyType, closure: closure)
    }
    
    /// Registers new dependency definition.
    ///
    /// - parameters:
    ///   - name: Name of dependency.
    ///   - dependencyType: Defines dependency type [weak / strong].
    ///   - closure: Closure that produce an injection object.
    public func register<T>(name: String?, dependencyType: DependencyType, closure: @escaping (()) -> T) {
        register(type: T.self, name: name, dependencyType: dependencyType, closure: closure)
    }
    
    /// Unregisters dependency definition.
    ///
    /// - parameters:
    ///   - type: Type of class or protocol.
    public func unregister<T>(type: T.Type) {
        unregister(type: type, name: nil)
    }
}
