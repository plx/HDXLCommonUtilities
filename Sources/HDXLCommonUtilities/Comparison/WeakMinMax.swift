//
//  WeakExtrema.swift
//

import Foundation

/// Calculates the minimum-and-maximum while ignoring `nil` values: `weakMinMax(a, nil) == (a,a)`, in other words.
///
/// - returns: The minimum-and-maximum supplied arguments, or `nil` if all arguments were `nil`.
///
@inlinable
public func weakMinMax<T:Comparable>(_ a: T?, _ b: T?) -> OrderedPair<T>? {
  switch (a, b) {
  case (.none, .none):
    return .none
  case (.some(let value), .none):
    return OrderedPair<T>(
      value: value
    )
  case (.none, .some(let value)):
    return OrderedPair<T>(
      value: value
    )
  case (.some(let aa), .some(let bb)):
    return OrderedPair<T>(
      unordered: aa, bb
    )
  }
}

/// Calculates the minimum-and-maximum while ignoring `nil` values: `weakMinMax(a, nil) == (a,a)`, in other words.
///
/// - returns: The minimum-and-maximum supplied arguments, or `nil` if all arguments were `nil`.
///
/// - note: Sub-optimal insofar as we do `O(rest.count)` comparisons when we could perhaps do `O(ln(rest.count))` comparisons.
///
@inlinable
public func weakMinMax<T:Comparable>(_ a: T?, _ b: T?, _ c: T?, _ rest: T?...) -> OrderedPair<T>? {
  var result = weakMinMax(a, b)
  result?.formIncorporation(of: c)
  for candidate in rest {
    result?.formIncorporation(of: candidate)
  }
  return result
}
