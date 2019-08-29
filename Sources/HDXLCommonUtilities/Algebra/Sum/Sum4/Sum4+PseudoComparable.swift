//
//  Sum4+PseudoComparable.swift
//

import Foundation

public extension Sum4 where
  A:Comparable,
  B:Comparable,
  C:Comparable,
  D:Comparable {
  
  @inlinable
  func isPseudoLessThan(_ other: Sum4<A,B,C,D>) -> Bool {
    switch (self, other) {
    case (.a(let l), .a(let r)):
      return l < r
    case (.b(let l), .b(let r)):
      return l < r
    case (.c(let l), .c(let r)):
      return l < r
    case (.d(let l), .d(let r)):
      return l < r
    default:
      return self.occupiedPosition < other.occupiedPosition
    }
  }

  @inlinable
  func isPseudoGreaterThan(_ other: Sum4<A,B,C,D>) -> Bool {
    switch (self, other) {
    case (.a(let l), .a(let r)):
      return l > r
    case (.b(let l), .b(let r)):
      return l > r
    case (.c(let l), .c(let r)):
      return l > r
    case (.d(let l), .d(let r)):
      return l > r
    default:
      return self.occupiedPosition > other.occupiedPosition
    }
  }

  @inlinable
  func isPseudoLessThanOrEqual(_ other: Sum4<A,B,C,D>) -> Bool {
    switch (self, other) {
    case (.a(let l), .a(let r)):
      return l <= r
    case (.b(let l), .b(let r)):
      return l <= r
    case (.c(let l), .c(let r)):
      return l <= r
    case (.d(let l), .d(let r)):
      return l <= r
    default:
      return self.occupiedPosition < other.occupiedPosition
    }
  }

  @inlinable
  func isPseudoGreaterThanOrEqual(_ other: Sum4<A,B,C,D>) -> Bool {
    switch (self, other) {
    case (.a(let l), .a(let r)):
      return l >= r
    case (.b(let l), .b(let r)):
      return l >= r
    case (.c(let l), .c(let r)):
      return l >= r
    case (.d(let l), .d(let r)):
      return l >= r
    default:
      return self.occupiedPosition > other.occupiedPosition
    }
  }

}

