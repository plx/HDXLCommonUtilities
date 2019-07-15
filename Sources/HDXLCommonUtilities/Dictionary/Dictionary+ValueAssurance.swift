//
//  Dictionary+ValueAssurance.swift
//

import Foundation

public extension Dictionary {

  /// Retrieve a guaranteed non-nil value from a dictionary. Value for `key` always used when present;
  /// `fallback()` is evaluated when absent. Can *save* or *discard* the result of evaluating `fallback()`,
  /// with choice selected via the `preservingFallback` parameter.
  ///
  /// - parameter key: The key of interest.
  /// - parameter assurance: A lazily-evaluated autoclosure used to provide the fallback value if needed.
  /// - parameter preservingFallback: When `true`, the fallback from `assuarnce` will be stored into `self[key]`; when `false` that value will be discarded.
  ///
  /// - returns: Either the pre-existing wrapped value or the fallback value provided-by "assurance".
  ///
  @inlinable
  mutating func obtainAssuredValue(
    forKey key: Key,
    fallingBackUpon assurance: @autoclosure () -> Value,
    preservingFallback: @autoclosure () -> Bool) -> Value {
    if let value = self[key] {
      return value
    } else {
      let fallbackValue = assurance()
      if preservingFallback() {
        self[key] = fallbackValue
      }
      return fallbackValue
    }
  }

  
}
