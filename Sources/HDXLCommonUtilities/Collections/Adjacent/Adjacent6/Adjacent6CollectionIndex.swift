//
//  Adjacent6CollectionIndex.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Adjacent6CollectionIndex - Definition
// -------------------------------------------------------------------------- //

public struct Adjacent6CollectionIndex<PositionRepresentation:AlgebraicProduct6> : IndexPositionStorageWrapper
  where
  PositionRepresentation.A:Comparable,
  PositionRepresentation.A == PositionRepresentation.B,
  PositionRepresentation.A == PositionRepresentation.C,
  PositionRepresentation.A == PositionRepresentation.D,
  PositionRepresentation.A == PositionRepresentation.E,
  PositionRepresentation.A == PositionRepresentation.F {

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
// MARK: Adjacent6CollectionIndex - Validatable
// -------------------------------------------------------------------------- //

extension Adjacent6CollectionIndex : Validatable {
  
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
          position.e < position.f else {
            return false
        }
        return true
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Adjacent6CollectionIndex - Equatable
// -------------------------------------------------------------------------- //

extension Adjacent6CollectionIndex : Equatable {
  
  @inlinable
  public static func ==(
    lhs: Adjacent6CollectionIndex<PositionRepresentation>,
    rhs: Adjacent6CollectionIndex<PositionRepresentation>) -> Bool {
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
// MARK: Adjacent6CollectionIndex - Comparable
// -------------------------------------------------------------------------- //

extension Adjacent6CollectionIndex : Comparable {
  
  @inlinable
  public static func <(
    lhs: Adjacent6CollectionIndex<PositionRepresentation>,
    rhs: Adjacent6CollectionIndex<PositionRepresentation>) -> Bool {
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
    lhs: Adjacent6CollectionIndex<PositionRepresentation>,
    rhs: Adjacent6CollectionIndex<PositionRepresentation>) -> Bool {
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
    lhs: Adjacent6CollectionIndex<PositionRepresentation>,
    rhs: Adjacent6CollectionIndex<PositionRepresentation>) -> Bool {
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
    lhs: Adjacent6CollectionIndex<PositionRepresentation>,
    rhs: Adjacent6CollectionIndex<PositionRepresentation>) -> Bool {
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
// MARK: Adjacent6CollectionIndex - Hashable
// -------------------------------------------------------------------------- //

extension Adjacent6CollectionIndex : Hashable where PositionRepresentation:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Adjacent6CollectionIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension Adjacent6CollectionIndex : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return self.storage.description
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Adjacent6CollectionIndex - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension Adjacent6CollectionIndex : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "Adjacent6CollectionIndex<\(String(reflecting: PositionRepresentation.self))>(storage: \(String(reflecting: self.storage)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Adjacent6CollectionIndex - Codable
// -------------------------------------------------------------------------- //

extension Adjacent6CollectionIndex : Codable where PositionRepresentation:Codable {
  
}

