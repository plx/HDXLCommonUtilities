//
//  SUM9+PseudoComparable.swift
//

import Foundation

public extension Sum9 where
  A:Comparable,
  B:Comparable,
  C:Comparable,
  D:Comparable,
  E:Comparable,
  F:Comparable,
  G:Comparable,
  H:Comparable,
  I:Comparable {
  
  @inlinable
  func isPseudoLessThan(_ other: Sum9<A,B,C,D,E,F,G,H,I>) -> Bool {
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
    case (.h(let l), .h(let r)):
      return l < r
    case (.i(let l), .i(let r)):
      return l < r
    default:
      return self.occupiedPosition < other.occupiedPosition
    }
  }

  @inlinable
  func isPseudoGreaterThan(_ other: Sum9<A,B,C,D,E,F,G,H,I>) -> Bool {
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
    case (.h(let l), .h(let r)):
      return l > r
    case (.i(let l), .i(let r)):
      return l > r
    default:
      return self.occupiedPosition > other.occupiedPosition
    }
  }

  @inlinable
  func isPseudoLessThanOrEqual(_ other: Sum9<A,B,C,D,E,F,G,H,I>) -> Bool {
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
    case (.h(let l), .h(let r)):
      return l <= r
    case (.i(let l), .i(let r)):
      return l <= r
    default:
      return self.occupiedPosition < other.occupiedPosition
    }
  }

  @inlinable
  func isPseudoGreaterThanOrEqual(_ other: Sum9<A,B,C,D,E,F,G,H,I>) -> Bool {
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
    case (.h(let l), .h(let r)):
      return l >= r
    case (.i(let l), .i(let r)):
      return l >= r
    default:
      return self.occupiedPosition > other.occupiedPosition
    }
  }

}

