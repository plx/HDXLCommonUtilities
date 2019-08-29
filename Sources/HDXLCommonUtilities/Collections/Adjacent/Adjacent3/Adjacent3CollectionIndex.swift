//
//  Adjacent3CollectionIndex.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Adjacent3CollectionIndex - Definition
// -------------------------------------------------------------------------- //

public struct Adjacent3CollectionIndex<PositionRepresentation:AlgebraicProduct3> : IndexPositionStorageWrapper
  where
  PositionRepresentation.A:Comparable,
  PositionRepresentation.A == PositionRepresentation.B,
  PositionRepresentation.A == PositionRepresentation.C {

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
// MARK: Adjacent3CollectionIndex - Validatable
// -------------------------------------------------------------------------- //

extension Adjacent3CollectionIndex : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      return self.storage.customizedValidation() {
        (position: PositionRepresentation) -> Bool
        in
        guard
          position.a < position.b,
          position.b < position.c else {
            return false
        }
        return true
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Adjacent3CollectionIndex - Equatable
// -------------------------------------------------------------------------- //

extension Adjacent3CollectionIndex : Equatable {
  
  @inlinable
  public static func ==(
    lhs: Adjacent3CollectionIndex<PositionRepresentation>,
    rhs: Adjacent3CollectionIndex<PositionRepresentation>) -> Bool {
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
// MARK: Adjacent3CollectionIndex - Comparable
// -------------------------------------------------------------------------- //

extension Adjacent3CollectionIndex : Comparable {
  
  @inlinable
  public static func <(
    lhs: Adjacent3CollectionIndex<PositionRepresentation>,
    rhs: Adjacent3CollectionIndex<PositionRepresentation>) -> Bool {
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
    lhs: Adjacent3CollectionIndex<PositionRepresentation>,
    rhs: Adjacent3CollectionIndex<PositionRepresentation>) -> Bool {
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
    lhs: Adjacent3CollectionIndex<PositionRepresentation>,
    rhs: Adjacent3CollectionIndex<PositionRepresentation>) -> Bool {
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
    lhs: Adjacent3CollectionIndex<PositionRepresentation>,
    rhs: Adjacent3CollectionIndex<PositionRepresentation>) -> Bool {
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
// MARK: Adjacent3CollectionIndex - Hashable
// -------------------------------------------------------------------------- //

extension Adjacent3CollectionIndex : Hashable where PositionRepresentation:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Adjacent3CollectionIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension Adjacent3CollectionIndex : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return self.storage.description
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Adjacent3CollectionIndex - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension Adjacent3CollectionIndex : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "Adjacent3CollectionIndex<\(String(reflecting: PositionRepresentation.self))>(storage: \(String(reflecting: self.storage)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Adjacent3CollectionIndex - Codable
// -------------------------------------------------------------------------- //

extension Adjacent3CollectionIndex : Codable where PositionRepresentation:Codable {
  
}

