//
//  Sum7+PseudoComparable.swift
//

import Foundation

public extension Sum7 where
  A:Comparable,
  B:Comparable,
  C:Comparable,
  D:Comparable,
  E:Comparable,
  F:Comparable,
  G:Comparable {
  
  @inlinable
  func isPseudoLessThan(_ other: Sum7<A,B,C,D,E,F,G>) -> Bool {
    switch (self, other) {
    case (.a(let l), .a(let r)):
      return l < r
    case (.b(let l), .b(let r)):
      return l < r
    case (.c(let l), .c(let r)):
      return l < r
    case (.d(let l), .d(let r)):
      return l < r
    case (.e(let l), .e(let r)):
      return l < r
    case (.f(let l), .f(let r)):
      return l < r
    case (.g(let l), .g(let r)):
      return l < r
    default:
      return self.occupiedPosition < other.occupiedPosition
    }
  }

  @inlinable
  func isPseudoGreaterThan(_ other: Sum7<A,B,C,D,E,F,G>) -> Bool {
    switch (self, other) {
    case (.a(let l), .a(let r)):
      return l > r
    case (.b(let l), .b(let r)):
      return l > r
    case (.c(let l), .c(let r)):
      return l > r
    case (.d(let l), .d(let r)):
      return l > r
    case (.e(let l), .e(let r)):
      return l > r
    case (.f(let l), .f(let r)):
      return l > r
    case (.g(let l), .g(let r)):
      return l > r
    default:
      return self.occupiedPosition > other.occupiedPosition
    }
  }

  @inlinable
  func isPseudoLessThanOrEqual(_ other: Sum7<A,B,C,D,E,F,G>) -> Bool {
    switch (self, other) {
    case (.a(let l), .a(let r)):
      return l <= r
    case (.b(let l), .b(let r)):
      return l <= r
    case (.c(let l), .c(let r)):
      return l <= r
    case (.d(let l), .d(let r)):
      return l <= r
    case (.e(let l), .e(let r)):
      return l <= r
    case (.f(let l), .f(let r)):
      return l <= r
    case (.g(let l), .g(let r)):
      return l <= r
    default:
      return self.occupiedPosition < other.occupiedPosition
    }
  }

  @inlinable
  func isPseudoGreaterThanOrEqual(_ other: Sum7<A,B,C,D,E,F,G>) -> Bool {
    switch (self, other) {
    case (.a(let l), .a(let r)):
      return l >= r
    case (.b(let l), .b(let r)):
      return l >= r
    case (.c(let l), .c(let r)):
      return l >= r
    case (.d(let l), .d(let r)):
      return l >= r
    case (.e(let l), .e(let r)):
      return l >= r
    case (.f(let l), .f(let r)):
      return l >= r
    case (.g(let l), .g(let r)):
      return l >= r
    default:
      return self.occupiedPosition > other.occupiedPosition
    }
  }

}

