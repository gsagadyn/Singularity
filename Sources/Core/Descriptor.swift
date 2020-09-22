//
//  Descriptor.swift
//  Singularity
//
//  Created by Grzegorz Sagadyn on 22/09/2020.
//

import Foundation

internal class Descriptor {
    // MARK: - Private Properties

    private let type: DependencyType
    private let producer: () -> Any
    private var instance: Any?

    // MARK: - Initialization

    internal init(type: DependencyType = .weak, producer: @escaping () -> Any) {
        self.type = type
        self.producer = producer
    }
}

// ----------------------------------------------------------------------------------------------------------------
// MARK: - Resolve / Reset Bind
// ----------------------------------------------------------------------------------------------------------------

extension Descriptor {
    internal func resolve<T>() throws -> T {
        let instanceTmp = instance ?? producer()
        instance = (type == .strong ? instanceTmp : nil)
        
        guard let result = instanceTmp as? T else {
            throw SingularityError.typeInconsistency
        }
        
        return result
    }

    internal func reset() {
        instance = nil
    }
}
