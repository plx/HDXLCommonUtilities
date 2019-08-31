//
//  SpecificError.swift
//

import Foundation

public enum SpecificError<Expectation:Error> {
  
  case expected(Expectation)
  case unexpected(Error)
  
  @inlinable
  public init(unexaminedError error: Error) {
    switch error as? Expectation {
    case .some(let expected):
      self = .expected(expected)
    case .none:
      self = .unexpected(error)
    }
  }
  
}
