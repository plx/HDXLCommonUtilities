//
//  JointNullityCount.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Joint Nullity Count
// -------------------------------------------------------------------------- //

/// Special-purpose "pair" for doing simultaneous count-of-`nil`/non-`nil`.
public struct JointNullityCount {
  
  public var countOfNil: Int
  public var countOfNonNil: Int
  
  @inlinable
  public var count: Int {
    get {
      return self.countOfNil + self.countOfNonNil
    }
  }
  
  @inlinable
  public init() {
    self.init(
      countOfNil: 0,
      countOfNonNil: 0
    )
  }
  
  @inlinable
  public init(
    countOfNil: Int,
    countOfNonNil: Int) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(countOfNil >= 0)
    pedantic_assert(countOfNonNil >= 0)
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self.countOfNil = countOfNil
    self.countOfNonNil = countOfNonNil
  }
  
  @inlinable
  public init(withCountsFor value: Any?) {
    self.init()
    self.formIncorporation(ofCountsFor: value)
  }
  
  @inlinable
  public init<T,S:Sequence>(withCountsFrom values: S)
    where S.Element == Optional<T> {
    self.init()
    self.formIncorporation(ofCountsFrom: values)
  }

  @inlinable
  public init(withCountsForValues values: Any?...) {
    self.init()
    for value in values {
      self.formIncorporation(ofCountsFor: value)
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: JointNullityCount - Support
// -------------------------------------------------------------------------- //

public extension JointNullityCount {
  
  @inlinable
  internal func with(countOfNil: Int) -> JointNullityCount {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(countOfNil >= 0)
    pedantic_assert(self.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return JointNullityCount(
      countOfNil: countOfNil,
      countOfNonNil: self.countOfNonNil
    )
  }

  @inlinable
  internal func with(countOfNonNil: Int) -> JointNullityCount {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(countOfNonNil >= 0)
    pedantic_assert(self.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return JointNullityCount(
      countOfNil: self.countOfNil,
      countOfNonNil: countOfNonNil
    )
  }

  @inlinable
  func incorporating(countsFor value: Any?) -> JointNullityCount {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(self.isValid)
    // /////////////////////////////////////////////////////////////////////////
    switch value {
    case .none:
      return self.with(
        countOfNil: 1 + self.countOfNil
      )
    case .some(_):
      return self.with(
        countOfNonNil: 1 + self.countOfNonNil
      )
    }
  }
  
  @inlinable
  mutating func formIncorporation(ofCountsFor value: Any?) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(self.isValid)
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    switch value {
    case .none:
      self.countOfNil += 1
    case .some(_):
      self.countOfNonNil += 1
    }
  }
  
  @inlinable
  func incorporating(countsFrom other: JointNullityCount) -> JointNullityCount {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(self.isValid)
    pedantic_assert(other.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return JointNullityCount(
      countOfNil: self.countOfNil + other.countOfNil,
      countOfNonNil: self.countOfNonNil + other.countOfNonNil
    )
  }

  @inlinable
  mutating func formIncorporation(ofCountsFrom other: JointNullityCount) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(self.isValid)
    pedantic_assert(other.isValid)
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self.countOfNil += other.countOfNil
    self.countOfNonNil += other.countOfNonNil
  }

  @inlinable
  func incorporating<T,S:Sequence>(countsFrom values: S) -> JointNullityCount
    where S.Element == Optional<T> {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(self.isValid)
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    var result = self
    result.formIncorporation(ofCountsFrom: values)
    return result
  }

  @inlinable
  mutating func formIncorporation<T,S:Sequence>(ofCountsFrom values: S)
    where S.Element == Optional<T> {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(self.isValid)
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    for element in values {
      self.formIncorporation(ofCountsFor: element)
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: JointNullityCount - Validatable
// -------------------------------------------------------------------------- //

extension JointNullityCount : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      guard
        self.countOfNil >= 0,
        self.countOfNonNil >= 0 else {
          return false
      }
      return true
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: JointNullityCount - Equatable
// -------------------------------------------------------------------------- //

extension JointNullityCount : Equatable {
  
  @inlinable
  public static func ==(
    lhs: JointNullityCount,
    rhs: JointNullityCount) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    guard
      lhs.countOfNil == rhs.countOfNil,
      lhs.countOfNonNil == rhs.countOfNonNil else {
        return false
    }
    return true
  }

}

// -------------------------------------------------------------------------- //
// MARK: JointNullityCount - Hashable
// -------------------------------------------------------------------------- //

extension JointNullityCount : Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.countOfNil.hash(into: &hasher)
    self.countOfNonNil.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: JointNullityCount - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension JointNullityCount : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "\(self.count), split as \(self.countOfNil) `nil`s and \(self.countOfNonNil) non-`nil`s"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: JointNullityCount - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension JointNullityCount : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "JointNullityCount(countOfNil: \(self.countOfNil), countOfNonNil: \(self.countOfNonNil))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: JointNullityCount - Codable
// -------------------------------------------------------------------------- //

extension JointNullityCount : Codable {
  
  // synthesized ok
  
}

