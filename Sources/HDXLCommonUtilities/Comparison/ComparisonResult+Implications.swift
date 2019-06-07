//
//  ComparisonResult.swift
//

import Foundation

public extension ComparisonResult {
  
  @inlinable
  var impliesLessThan: Bool {
    get {
      return self == .orderedAscending
    }
  }

  @inlinable
  var impliesLessThanOrEqual: Bool {
    get {
      return self != .orderedDescending
    }
  }

  @inlinable
  var impliesGreaterThan: Bool {
    get {
      return self == .orderedDescending
    }
  }
  
  @inlinable
  var impliesGreaterThanOrEqual: Bool {
    get {
      return self != .orderedAscending
    }
  }
  
  @inlinable
  var impliesEquality: Bool {
    get {
      return self == .orderedSame
    }
  }

  @inlinable
  var impliesInequality: Bool {
    get {
      return self != .orderedSame
    }
  }

}
