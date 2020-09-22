//
//  SingularityError.swift
//  SingularityExample
//
//  Created by Grzegorz Sagadyn on 22/09/2020.
//

import Foundation

public enum SingularityError: Error {
    case definitionNotFound(message: String)
    case typeInconsistency
}
