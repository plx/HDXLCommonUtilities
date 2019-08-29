//
//  Product5CollectionIndex.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Product5CollectionIndex - Definition
// -------------------------------------------------------------------------- //

public struct Product5CollectionIndex<PositionRepresentation> : IndexPositionStorageWrapper
  where
  PositionRepresentation:AlgebraicProduct5,
  PositionRepresentation.A:Comparable,
  PositionRepresentation.B:Comparable,
  PositionRepresentation.C:Comparable,
  PositionRepresentation.D:Comparable,
  PositionRepresentation.E:Comparable {
  
  @usableFromInline
  internal typealias Storage = IndexPositionStorage<PositionRepresentation>
  
  @usableFromInline
  internal var storage: Storage
  
  @inlinable
  internal init(storage: Storage) {
    self.storage = storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product5CollectionIndex - Validatable
// -------------------------------------------------------------------------- //

extension Product5CollectionIndex : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      return self.storage.isValid
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product5CollectionIndex - Equatable
// -------------------------------------------------------------------------- //

extension Product5CollectionIndex : Equatable {
  
  @inlinable
  public static func ==(
    lhs: Product5CollectionIndex<PositionRepresentation>,
    rhs: Product5CollectionIndex<PositionRepresentation>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage.customizedEquivalence(to: rhs.storage) {
      (l,r) -> Bool
      in
      return l == r
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: Product5CollectionIndex - Comparable
// -------------------------------------------------------------------------- //

extension Product5CollectionIndex : Comparable {
  
  @inlinable
  public static func <(
    lhs: Product5CollectionIndex<PositionRepresentation>,
    rhs: Product5CollectionIndex<PositionRepresentation>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage.customizedComparison(to: rhs.storage) {
      (l,r) -> ComparisonResult
      in
      return l.lexicographicComparison(to: r)
    }.impliesLessThan
  }

  @inlinable
  public static func >(
    lhs: Product5CollectionIndex<PositionRepresentation>,
    rhs: Product5CollectionIndex<PositionRepresentation>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage.customizedComparison(to: rhs.storage) {
      (l,r) -> ComparisonResult
      in
      return l.lexicographicComparison(to: r)
    }.impliesGreaterThan
  }

  @inlinable
  public static func <=(
    lhs: Product5CollectionIndex<PositionRepresentation>,
    rhs: Product5CollectionIndex<PositionRepresentation>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage.customizedComparison(to: rhs.storage) {
      (l,r) -> ComparisonResult
      in
      return l.lexicographicComparison(to: r)
    }.impliesLessThanOrEqual
  }

  @inlinable
  public static func >=(
    lhs: Product5CollectionIndex<PositionRepresentation>,
    rhs: Product5CollectionIndex<PositionRepresentation>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage.customizedComparison(to: rhs.storage) {
      (l,r) -> ComparisonResult
      in
      return l.lexicographicComparison(to: r)
    }.impliesGreaterThanOrEqual
  }

}

// -------------------------------------------------------------------------- //
// MARK: Product5CollectionIndex - Hashable
// -------------------------------------------------------------------------- //

extension Product5CollectionIndex : Hashable where PositionRepresentation:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product5CollectionIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension Product5CollectionIndex : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return self.storage.description
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product5CollectionIndex - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension Product5CollectionIndex : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "Product5CollectionIndex<\(String(reflecting: PositionRepresentation.self))>(storage: \(String(reflecting: self.storage)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product5CollectionIndex - Codable
// -------------------------------------------------------------------------- //

extension Product5CollectionIndex : Codable where PositionRepresentation:Codable {
  
}

