//
//  Resolver+Shared.swift
//  SingularityExample
//
//  Created by Grzegorz Sagadyn on 22/09/2020.
//  Copyright © 2020 SingularityExample. All rights reserved.
//

import Foundation
import Singularity

extension Resolver {
    internal static let shared: Resolver = {
        let resolver = Resolver()
        resolver.registerModule(MainModule())
        return resolver
    }()
}
