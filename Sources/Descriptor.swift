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
    internal func resolve<T>() -> T {
        let instanceTmp = instance ?? producer()
        instance = (type == .strong ? instanceTmp : nil)
        return instanceTmp as! T
    }

    internal func reestablish() {
        instance = nil
    }
}
