//
//  OrderedPair.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: OrderedPair - Definition
// -------------------------------------------------------------------------- //

/// A type for a "2-tuple certified to be ordered non-descendingly".
@frozen
public struct OrderedPair<T:Comparable> {

  /// The lesser of the two values.
  public var lesser: T
  
  /// The greter of the two values.
  public var greater: T
  
  /// "Designated initializer" for `OrderedPair<T>`.
  ///
  /// - parameter lesser: The lesser of the two values.
  /// - parameter greater: The greater of the two values.
  ///
  /// - returns: An `OrderedPair<T>` containing the same two values.
  ///
  @inlinable
  public init(lesser: T, greater: T) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lesser <= greater)
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self.lesser = lesser
    self.greater = greater
  }

  /// "Convenience initializer" for when `lesser == greater == value`.
  @inlinable
  public init(value: T) {
    self.init(
      lesser: value,
      greater: value
    )
  }
  
  /// "Convenience initiailzer" for when we don't know the ordering for `a` and `b`.
  @inlinable
  public init(unordered a: T, _ b: T) {
    if a <= b {
      self.init(
        lesser: a,
        greater: b
      )
    } else {
      self.init(
        lesser: b,
        greater: a
      )
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: OrderedPair - Conveniences
// -------------------------------------------------------------------------- //

public extension OrderedPair {
  
  /// Returns an ordered pair that "fuses" `self` and `pair`, using the minimum
  /// and maximum between the components of `self` and `pair`.
  @inlinable
  func incorporating(pair other: OrderedPair<T>) -> OrderedPair<T> {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(other.isValid)
    pedantic_assert(self.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return OrderedPair<T>(
      lesser: min(self.lesser, other.lesser),
      greater: max(self.greater, other.greater)
    )
  }

  /// Returns an ordered pair that "fuses" `self` and `pair`, using the minimum
  /// and maximum between the components of `self` and `pair`; returns `self`,
  /// however, whenever `pair` is nil.
  @inlinable
  func incorporating(pair other: OrderedPair<T>?) -> OrderedPair<T> {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(self.isValid)
    // /////////////////////////////////////////////////////////////////////////
    guard let concreteOther = other else {
      return self
    }
    return self.incorporating(
      pair: concreteOther
    )
  }

  /// Returns a value derived from `self` by "incorporating" `value`: if `value`
  /// is less-than `self.lesser` the result will use `value` as `lesser`, and
  /// similarly when `value > greater`.
  @inlinable
  func incorporating(value: T) -> OrderedPair<T> {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(self.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return OrderedPair<T>(
      lesser: min(self.lesser, value),
      greater: max(self.greater, value)
    )
  }

  /// Returns a value derived from `self` by "incorporating" `value`: if `value`
  /// is less-than `self.lesser` the result will use `value` as `lesser`, and
  /// similarly when `value > greater`; when `value` is `nil`, `self` is returned as-is.
  @inlinable
  func incorporating(value: T?) -> OrderedPair<T> {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(self.isValid)
    // /////////////////////////////////////////////////////////////////////////
    guard let concreteValue = value else {
      return self
    }
    return self.incorporating(
      value: concreteValue
    )
  }

  /// In-place modifies `self` by incorporating values from `other`.
  @inlinable
  mutating func formIncorporation(of other: OrderedPair<T>) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(other.isValid)
    pedantic_assert(self.isValid)
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self.lesser = min(self.lesser, other.lesser)
    self.greater = max(self.greater, other.greater)
  }

  /// In-place modifies `self` by incorporating values from `other`; a no-op
  /// whenever `value` is `nil`.
  @inlinable
  mutating func formIncorporation(of other: OrderedPair<T>?) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(self.isValid)
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    if let concreteOther = other {
      self.formIncorporation(of: concreteOther)
    }
  }
  
  /// In-place modifies `self` by incorporating `value`.
  @inlinable
  mutating func formIncorporation(of value: T) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(self.isValid)
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self.lesser = min(self.lesser, value)
    self.greater = max(self.greater, value)
  }

  /// In-place modifies `self` by incorporating `value`; a no-op whenever `value` is `nil`.
  @inlinable
  mutating func formIncorporation(of value: T?) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(self.isValid)
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    if let concreteValue = value {
      self.formIncorporation(of: concreteValue)
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: OrderedPair - Validatable
// -------------------------------------------------------------------------- //

extension OrderedPair : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      guard
        self.lesser <= self.greater,
        isValidOrIndifferent(self.lesser),
        isValidOrIndifferent(self.greater) else {
          return false
      }
      return true
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: OrderedPair - Equatable
// -------------------------------------------------------------------------- //

extension OrderedPair : Equatable {
  
  @inlinable
  public static func ==(
    lhs: OrderedPair<T>,
    rhs: OrderedPair<T>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    guard
      lhs.lesser == rhs.lesser,
      lhs.greater == rhs.greater else {
        return false
    }
    return true
  }

}

// -------------------------------------------------------------------------- //
// MARK: OrderedPair - Hashable
// -------------------------------------------------------------------------- //

extension OrderedPair : Hashable where T:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.lesser.hash(into: &hasher)
    self.greater.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: OrderedPair - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension OrderedPair : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "(\(String(describing: self.lesser)), \(String(describing: self.greater)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: OrderedPair - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension OrderedPair : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "OrderedPair<\(String(reflecting: T.self))>(lesser: \(String(reflecting: self.lesser)), greater: \(String(reflecting: self.greater)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: OrderedPair - Codable
// -------------------------------------------------------------------------- //

extension OrderedPair : Codable where T:Codable {
  
  // synthesized ok
  
}

// could do `CaseIterable` but will wait until either `some` is more-featureful
// or I happen to specifically need that, for this
