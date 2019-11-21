//
//  ComparisonResult+Inversion.swift
//

import Foundation

public extension ComparisonResult {
  
  @inlinable
  var inverted: ComparisonResult {
    get {
      switch self {
      case .orderedAscending:
        return .orderedDescending
      case .orderedSame:
        return .orderedSame
      case .orderedDescending:
        return .orderedAscending
      }
    }
  }
  
  @inlinable
  mutating func formInverse() {
    self = self.inverted
  }
  
}
