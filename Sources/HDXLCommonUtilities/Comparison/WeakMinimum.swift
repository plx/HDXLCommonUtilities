//
//  WeakMinimum.swift
//

import Foundation

/// Calculates the minimum while ignoring `nil` values: `weakMinimum(a, nil) == a`, in other words.
///
/// - returns: The minimum supplied argument, or `nil` if all arguments were `nil`.
///
@inlinable
public func weakMinimum<T:Comparable>(_ a: T?, _ b: T?) -> T? {
  switch (a, b) {
  case (.none, .none):
    return .none
  case (.some(let value), .none):
    return value
  case (.none, .some(let value)):
    return value
  case (.some(let aa), .some(let bb)):
    return min(aa, bb)
  }
}


/// Variadic-argument version of `weakMinimum`.
///
/// - returns: The minimum supplied argument, or `nil` if all arguments were `nil`.
///
/// - note: Sub-optimal insofar as we do `O(rest.count)` comparisons when we could perhaps do `O(ln(rest.count))` comparisons.
///
@inlinable
public func weakMinimum<T:Comparable>(_ a: T?, _ b: T?, _ c: T?, _ rest: T?...) -> T? {
  var result = weakMinimum(a, b)
  result = weakMinimum(result, c)
  for candidate in rest {
    result = weakMinimum(result, candidate)
  }
  return result
}
