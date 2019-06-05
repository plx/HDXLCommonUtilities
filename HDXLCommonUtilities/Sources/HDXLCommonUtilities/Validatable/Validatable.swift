//
//  Validatable.swift
//  
//

import Foundation

public protocol Validatable {
  
  var isValid: Bool { get }
  
}

@inlinable
public func isValidOrIndifferent(_ value: Any) -> Bool {
  guard let validatable = value as? Validatable else {
    return true
  }
  return validatable.isValid
}

