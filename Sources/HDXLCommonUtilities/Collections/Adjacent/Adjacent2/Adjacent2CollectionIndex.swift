//
//  Adjacent2CollectionIndex.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Adjacent2CollectionIndex - Definition
// -------------------------------------------------------------------------- //

public struct Adjacent2CollectionIndex<PositionRepresentation:AlgebraicProduct2> : IndexPositionStorageWrapper
  where
  PositionRepresentation.A:Comparable,
  PositionRepresentation.A == PositionRepresentation.B {

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
// MARK: Adjacent2CollectionIndex - Validatable
// -------------------------------------------------------------------------- //

extension Adjacent2CollectionIndex : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      return self.storage.customizedValidation() {
        (position: PositionRepresentation) -> Bool
        in
        guard
          position.a < position.b else {
            return false
        }
        return true
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Adjacent2CollectionIndex - Equatable
// -------------------------------------------------------------------------- //

extension Adjacent2CollectionIndex : Equatable {
  
  @inlinable
  public static func ==(
    lhs: Adjacent2CollectionIndex<PositionRepresentation>,
    rhs: Adjacent2CollectionIndex<PositionRepresentation>) -> Bool {
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
// MARK: Adjacent2CollectionIndex - Comparable
// -------------------------------------------------------------------------- //

extension Adjacent2CollectionIndex : Comparable {
  
  @inlinable
  public static func <(
    lhs: Adjacent2CollectionIndex<PositionRepresentation>,
    rhs: Adjacent2CollectionIndex<PositionRepresentation>) -> Bool {
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
    lhs: Adjacent2CollectionIndex<PositionRepresentation>,
    rhs: Adjacent2CollectionIndex<PositionRepresentation>) -> Bool {
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
    lhs: Adjacent2CollectionIndex<PositionRepresentation>,
    rhs: Adjacent2CollectionIndex<PositionRepresentation>) -> Bool {
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
    lhs: Adjacent2CollectionIndex<PositionRepresentation>,
    rhs: Adjacent2CollectionIndex<PositionRepresentation>) -> Bool {
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
// MARK: Adjacent2CollectionIndex - Hashable
// -------------------------------------------------------------------------- //

extension Adjacent2CollectionIndex : Hashable where PositionRepresentation:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Adjacent2CollectionIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension Adjacent2CollectionIndex : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return self.storage.description
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Adjacent2CollectionIndex - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension Adjacent2CollectionIndex : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "Adjacent2CollectionIndex<\(String(reflecting: PositionRepresentation.self))>(storage: \(String(reflecting: self.storage)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Adjacent2CollectionIndex - Codable
// -------------------------------------------------------------------------- //

extension Adjacent2CollectionIndex : Codable where PositionRepresentation:Codable {
  
}

