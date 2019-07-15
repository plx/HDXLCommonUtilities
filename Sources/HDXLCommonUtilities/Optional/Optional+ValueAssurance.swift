//
//  Optional+ValueAssurance.swift
//

import Foundation

public extension Optional {
  
  /// Utility function equivalent to a snippet like `optional ?? fallback`
  /// except that if `fallback` is used we set `self = .some(fallback)` before
  /// returning `fallback`.
  ///
  /// - parameter assurance: A lazily-evaluated autoclosure used to provide the fallback value if needed.
  ///
  /// - returns: Either the pre-existing wrapped value or the fallback value provided-by "assurance".
  ///
  /// - postcondition: `self != nil`; the wrapped value will be the original value if there was one, otherwise it's the value obtained by evaluating `assurance`.
  ///
  /// - note: I'd consider an operator calling this *if* I had a good operator in mind, but nothing I can think of seems like a great choice right now.
  ///
  @inlinable
  mutating func obtainAssuredValue(
    fallingBackUpon assurance: @autoclosure () -> Wrapped) -> Wrapped {
    switch self {
    case .some(let value):
      return value
    case .none:
      let value = assurance()
      self = .some(value)
      return value
    }
  }
  
}
