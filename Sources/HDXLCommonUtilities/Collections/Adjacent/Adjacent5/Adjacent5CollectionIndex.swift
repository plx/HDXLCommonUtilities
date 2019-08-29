//
//  Adjacent5CollectionIndex.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Adjacent5CollectionIndex - Definition
// -------------------------------------------------------------------------- //

public struct Adjacent5CollectionIndex<PositionRepresentation:AlgebraicProduct5> : IndexPositionStorageWrapper
  where
  PositionRepresentation.A:Comparable,
  PositionRepresentation.A == PositionRepresentation.B,
  PositionRepresentation.A == PositionRepresentation.C,
  PositionRepresentation.A == PositionRepresentation.D,
  PositionRepresentation.A == PositionRepresentation.E {

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
// MARK: Adjacent5CollectionIndex - Validatable
// -------------------------------------------------------------------------- //

extension Adjacent5CollectionIndex : Validatable {
  
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
          position.d < position.e else {
            return false
        }
        return true
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Adjacent5CollectionIndex - Equatable
// -------------------------------------------------------------------------- //

extension Adjacent5CollectionIndex : Equatable {
  
  @inlinable
  public static func ==(
    lhs: Adjacent5CollectionIndex<PositionRepresentation>,
    rhs: Adjacent5CollectionIndex<PositionRepresentation>) -> Bool {
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
// MARK: Adjacent5CollectionIndex - Comparable
// -------------------------------------------------------------------------- //

extension Adjacent5CollectionIndex : Comparable {
  
  @inlinable
  public static func <(
    lhs: Adjacent5CollectionIndex<PositionRepresentation>,
    rhs: Adjacent5CollectionIndex<PositionRepresentation>) -> Bool {
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
    lhs: Adjacent5CollectionIndex<PositionRepresentation>,
    rhs: Adjacent5CollectionIndex<PositionRepresentation>) -> Bool {
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
    lhs: Adjacent5CollectionIndex<PositionRepresentation>,
    rhs: Adjacent5CollectionIndex<PositionRepresentation>) -> Bool {
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
    lhs: Adjacent5CollectionIndex<PositionRepresentation>,
    rhs: Adjacent5CollectionIndex<PositionRepresentation>) -> Bool {
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
// MARK: Adjacent5CollectionIndex - Hashable
// -------------------------------------------------------------------------- //

extension Adjacent5CollectionIndex : Hashable where PositionRepresentation:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Adjacent5CollectionIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension Adjacent5CollectionIndex : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return self.storage.description
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Adjacent5CollectionIndex - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension Adjacent5CollectionIndex : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "Adjacent5CollectionIndex<\(String(reflecting: PositionRepresentation.self))>(storage: \(String(reflecting: self.storage)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Adjacent5CollectionIndex - Codable
// -------------------------------------------------------------------------- //

extension Adjacent5CollectionIndex : Codable where PositionRepresentation:Codable {
  
}

