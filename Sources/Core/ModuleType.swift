//
//  ModuleType.swift
//  Singularity
//
//  Created by Grzegorz Sagadyn on 22/09/2020.
//

import Foundation

public protocol ModuleType: AnyObject {
    /// Adds module's dependencies to dependency store
    ///
    /// - parameters:
    ///   - dependencyStore: Instance of dependency store.
    func load(to resolver: ResolverType)
}
