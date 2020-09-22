//
//  HomeService.swift
//  SingularityExample
//
//  Created by Grzegorz Sagadyn on 22/09/2020.
//  Copyright © 2020 SingularityExample. All rights reserved.
//

import Foundation

internal protocol HomeServiceType {
    func echo(text: String) -> String
}

internal class HomeService: HomeServiceType {
    internal func echo(text: String) -> String {
        text
    }
}
