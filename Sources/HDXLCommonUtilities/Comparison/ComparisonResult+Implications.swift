//
//  ComparisonResult.swift
//

import Foundation

public extension ComparisonResult {

  /// `true` iff `self` is consistent with `lhs < rhs`.
  ///
  /// - note: Exists to make `ComparisonResult`-dependent `Comparable` implementations more-readable.
  ///
  @inlinable
  var impliesLessThan: Bool {
    get {
      return self == .orderedAscending
    }
  }

  /// `true` iff `self` is consistent with `lhs <= rhs`.
  ///
  /// - note: Exists to make `ComparisonResult`-dependent `Comparable` implementations more-readable.
  ///
  @inlinable
  var impliesLessThanOrEqual: Bool {
    get {
      return self != .orderedDescending
    }
  }

  /// `true` iff `self` is consistent with `lhs > rhs`.
  ///
  /// - note: Exists to make `ComparisonResult`-dependent `Comparable` implementations more-readable.
  ///
  @inlinable
  var impliesGreaterThan: Bool {
    get {
      return self == .orderedDescending
    }
  }
  
  /// `true` iff `self` is consistent with `lhs >= rhs`.
  ///
  /// - note: Exists to make `ComparisonResult`-dependent `Comparable` implementations more-readable.
  ///
  @inlinable
  var impliesGreaterThanOrEqual: Bool {
    get {
      return self != .orderedAscending
    }
  }
  
  /// `true` iff `self` is consistent with `lhs == rhs`.
  ///
  /// - note: Exists to make `ComparisonResult`-dependent `Equatable` implementations more-readable.
  ///
  @inlinable
  var impliesEquality: Bool {
    get {
      return self == .orderedSame
    }
  }

  /// `true` iff `self` is consistent with `lhs == rhs`.
  ///
  /// - note: Exists to make `ComparisonResult`-dependent `Equatable` implementations more-readable.
  ///
  @inlinable
  var impliesInequality: Bool {
    get {
      return self != .orderedSame
    }
  }

}
