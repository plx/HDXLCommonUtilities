//
//  Adjacent8CollectionIndex.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Adjacent8CollectionIndex - Definition
// -------------------------------------------------------------------------- //

public struct Adjacent8CollectionIndex<PositionRepresentation:AlgebraicProduct8> : IndexPositionStorageWrapper
  where
  PositionRepresentation.A:Comparable,
  PositionRepresentation.A == PositionRepresentation.B,
  PositionRepresentation.A == PositionRepresentation.C,
  PositionRepresentation.A == PositionRepresentation.D,
  PositionRepresentation.A == PositionRepresentation.E,
  PositionRepresentation.A == PositionRepresentation.F,
  PositionRepresentation.A == PositionRepresentation.G,
  PositionRepresentation.A == PositionRepresentation.H {

  @usableFromInline
  typealias Storage = IndexPositionStorage<PositionRepresentation>

  @usableFromInline
  internal var storage: Storage
  
  @inlinable
  internal init(storage: Storage) {
    self.storage = storage
  }
    
}

// -------------------------------------------------------------------------- //
// MARK: Adjacent8CollectionIndex - Validatable
// -------------------------------------------------------------------------- //

extension Adjacent8CollectionIndex : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      return self.storage.customizedValidation() {
        (position: PositionRepresentation) -> Bool
        in
        guard
          position.a < position.b,
          position.b < position.c,
          position.c < position.d,
          position.d < position.e,
          position.e < position.f,
          position.f < position.g,
          position.g < position.h else {
            return false
        }
        return true
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Adjacent8CollectionIndex - Equatable
// -------------------------------------------------------------------------- //

extension Adjacent8CollectionIndex : Equatable {
  
  @inlinable
  public static func ==(
    lhs: Adjacent8CollectionIndex<PositionRepresentation>,
    rhs: Adjacent8CollectionIndex<PositionRepresentation>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage.customizedEquivalence(to: rhs.storage) {
      (l,r) -> Bool
      in
      return l.firstValue == r.firstValue
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Adjacent8CollectionIndex - Comparable
// -------------------------------------------------------------------------- //

extension Adjacent8CollectionIndex : Comparable {
  
  @inlinable
  public static func <(
    lhs: Adjacent8CollectionIndex<PositionRepresentation>,
    rhs: Adjacent8CollectionIndex<PositionRepresentation>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage.customizedComparison(to: rhs.storage) {
      (l,r) -> ComparisonResult
      in
      return l.firstValue <=> r.firstValue
    }.impliesLessThan
  }

  @inlinable
  public static func >(
    lhs: Adjacent8CollectionIndex<PositionRepresentation>,
    rhs: Adjacent8CollectionIndex<PositionRepresentation>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage.customizedComparison(to: rhs.storage) {
      (l,r) -> ComparisonResult
      in
      return l.firstValue <=> r.firstValue
    }.impliesGreaterThan
  }

  @inlinable
  public static func <=(
    lhs: Adjacent8CollectionIndex<PositionRepresentation>,
    rhs: Adjacent8CollectionIndex<PositionRepresentation>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage.customizedComparison(to: rhs.storage) {
      (l,r) -> ComparisonResult
      in
      return l.firstValue <=> r.firstValue
    }.impliesLessThanOrEqual
  }

  @inlinable
  public static func >=(
    lhs: Adjacent8CollectionIndex<PositionRepresentation>,
    rhs: Adjacent8CollectionIndex<PositionRepresentation>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage.customizedComparison(to: rhs.storage) {
      (l,r) -> ComparisonResult
      in
      return l.firstValue <=> r.firstValue
    }.impliesGreaterThanOrEqual
  }

}

// -------------------------------------------------------------------------- //
// MARK: Adjacent8CollectionIndex - Hashable
// -------------------------------------------------------------------------- //

extension Adjacent8CollectionIndex : Hashable where PositionRepresentation:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Adjacent8CollectionIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension Adjacent8CollectionIndex : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return self.storage.description
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Adjacent8CollectionIndex - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension Adjacent8CollectionIndex : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "Adjacent8CollectionIndex<\(String(reflecting: PositionRepresentation.self))>(storage: \(String(reflecting: self.storage)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Adjacent8CollectionIndex - Codable
// -------------------------------------------------------------------------- //

extension Adjacent8CollectionIndex : Codable where PositionRepresentation:Codable {
  
}

