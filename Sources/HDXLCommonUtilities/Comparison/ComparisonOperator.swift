//
//  ComparisonOperator.swift
//

import Foundation

/// "Spaceship operator" intended to get `ComparisonResult` values from comparables.
infix operator <=> : ComparisonPrecedence

public extension Comparable {
  
  /// Compare `lhs` and `rhs`, yielding a `ComparisonResult`.
  ///
  /// - note: In theory there could be a protocol refining `Comparable` for adoption by types that can do better than the below; in practice dispatching rules will typically shadow that and it's a bit hard to envision a specific type that could take advantage of it, so, yeah.
  @inlinable
  static func <=>(
    lhs: Self,
    rhs: Self) -> ComparisonResult {
    guard lhs != rhs else {
      return .orderedSame
    }
    return lhs < rhs ? .orderedAscending : .orderedDescending
  }
  
}
