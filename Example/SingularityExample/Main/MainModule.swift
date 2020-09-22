//
//  MainModule.swift
//  SingularityExample
//
//  Created by Grzegorz Sagadyn on 22/09/2020.
//  Copyright © 2020 SingularityExample. All rights reserved.
//

import Foundation
import Singularity

internal class MainModule: ModuleType {
    internal func load(to resolver: Resolver) {
        resolver.register(type: HomeService.self, dependencyType: .weak) { HomeService() }
    }
}
