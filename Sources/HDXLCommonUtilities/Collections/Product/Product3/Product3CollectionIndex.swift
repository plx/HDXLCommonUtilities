//
//  Product3CollectionIndex.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Product3CollectionIndex - Definition
// -------------------------------------------------------------------------- //

public struct Product3CollectionIndex<PositionRepresentation> : IndexPositionStorageWrapper
  where
  PositionRepresentation:AlgebraicProduct3,
  PositionRepresentation.A:Comparable,
  PositionRepresentation.B:Comparable,
  PositionRepresentation.C:Comparable {
  
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
// MARK: Product3CollectionIndex - Validatable
// -------------------------------------------------------------------------- //

extension Product3CollectionIndex : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      return self.storage.isValid
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product3CollectionIndex - Equatable
// -------------------------------------------------------------------------- //

extension Product3CollectionIndex : Equatable {
  
  @inlinable
  public static func ==(
    lhs: Product3CollectionIndex<PositionRepresentation>,
    rhs: Product3CollectionIndex<PositionRepresentation>) -> Bool {
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
// MARK: Product3CollectionIndex - Comparable
// -------------------------------------------------------------------------- //

extension Product3CollectionIndex : Comparable {
  
  @inlinable
  public static func <(
    lhs: Product3CollectionIndex<PositionRepresentation>,
    rhs: Product3CollectionIndex<PositionRepresentation>) -> Bool {
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
    lhs: Product3CollectionIndex<PositionRepresentation>,
    rhs: Product3CollectionIndex<PositionRepresentation>) -> Bool {
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
    lhs: Product3CollectionIndex<PositionRepresentation>,
    rhs: Product3CollectionIndex<PositionRepresentation>) -> Bool {
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
    lhs: Product3CollectionIndex<PositionRepresentation>,
    rhs: Product3CollectionIndex<PositionRepresentation>) -> Bool {
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
// MARK: Product3CollectionIndex - Hashable
// -------------------------------------------------------------------------- //

extension Product3CollectionIndex : Hashable where PositionRepresentation:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product3CollectionIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension Product3CollectionIndex : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return self.storage.description
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product3CollectionIndex - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension Product3CollectionIndex : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "Product3CollectionIndex<\(String(reflecting: PositionRepresentation.self))>(storage: \(String(reflecting: self.storage)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product3CollectionIndex - Codable
// -------------------------------------------------------------------------- //

extension Product3CollectionIndex : Codable where PositionRepresentation:Codable {
  
}

