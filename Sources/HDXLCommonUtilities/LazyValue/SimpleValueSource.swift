//
//  SimpleValueSource.swift
//

import Foundation

/// Refinement of `ValueSource` for value sources that can be initialized from a simple closure.
public protocol SimpleValueSource : ValueSource {
  
  /// Initializes the`ValueSource` with the value obtained by evaluating `value`.
  init(value: @escaping @autoclosure () -> Value)
  
}
