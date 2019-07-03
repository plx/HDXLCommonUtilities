//
//  Optional+ConditionalNullification.swift
//  

import Foundation

public extension Optional {
  
  /// Equivalent to `if condition() { self = .none }`, but avoiding evaluation of `condition`
  /// whenever `self` is already-nil. Intended to make "if $foo changes, reset $bar" more-efficient whenever
  /// *confirming* $foo changed might not be cheap.
  @inlinable
  mutating func nullify(when condition: @autoclosure () -> Bool) {
    switch self {
    case .none:
      ();
    case .some(_):
      if condition() {
        self = .none
      }
    }
  }
  
}
