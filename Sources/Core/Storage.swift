//
//  Storage.swift
//  Singularity
//
//  Created by Grzegorz Sagadyn on 22/09/2020.
//

import Foundation

internal class Storage {
    // MARK: - Private Properties

    private let dispatchQueue = DispatchQueue(label: "com.singularity.dependency_descriptors_queue")
    private var descriptors = [String: Descriptor]()

    // MARK: - Subscript

    internal subscript<T>(type: T.Type, name: String?) -> Descriptor? {
        get {
            var item: Descriptor?
            let itemId = identifier(for: type, withName: name)
            dispatchQueue.sync { item = descriptors[itemId] }
            return item
        }
        set {
            let item: Descriptor? = newValue
            let itemId = identifier(for: type, withName: name)
            dispatchQueue.sync { descriptors[itemId] = item }
        }
    }
}

// -----------------------------------------------------------------------------
// MARK: - Private Extension
// -----------------------------------------------------------------------------

extension Storage {
    private func identifier<T>(for type: T.Type, withName name: String?) -> String {
        let components = [String(describing: type), name].compactMap { $0 }
        return components.joined(separator: "-")
    }
}
