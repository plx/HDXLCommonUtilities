//
//  Product7CollectionIndex.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Product7CollectionIndex - Definition
// -------------------------------------------------------------------------- //

public struct Product7CollectionIndex<PositionRepresentation> : IndexPositionStorageWrapper
  where
  PositionRepresentation:AlgebraicProduct7,
  PositionRepresentation.A:Comparable,
  PositionRepresentation.B:Comparable,
  PositionRepresentation.C:Comparable,
  PositionRepresentation.D:Comparable,
  PositionRepresentation.E:Comparable,
  PositionRepresentation.F:Comparable,
  PositionRepresentation.G:Comparable {
  
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
// MARK: Product7CollectionIndex - Validatable
// -------------------------------------------------------------------------- //

extension Product7CollectionIndex : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      return self.storage.isValid
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product7CollectionIndex - Equatable
// -------------------------------------------------------------------------- //

extension Product7CollectionIndex : Equatable {
  
  @inlinable
  public static func ==(
    lhs: Product7CollectionIndex<PositionRepresentation>,
    rhs: Product7CollectionIndex<PositionRepresentation>) -> Bool {
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
// MARK: Product7CollectionIndex - Comparable
// -------------------------------------------------------------------------- //

extension Product7CollectionIndex : Comparable {
  
  @inlinable
  public static func <(
    lhs: Product7CollectionIndex<PositionRepresentation>,
    rhs: Product7CollectionIndex<PositionRepresentation>) -> Bool {
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
    lhs: Product7CollectionIndex<PositionRepresentation>,
    rhs: Product7CollectionIndex<PositionRepresentation>) -> Bool {
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
    lhs: Product7CollectionIndex<PositionRepresentation>,
    rhs: Product7CollectionIndex<PositionRepresentation>) -> Bool {
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
    lhs: Product7CollectionIndex<PositionRepresentation>,
    rhs: Product7CollectionIndex<PositionRepresentation>) -> Bool {
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
// MARK: Product7CollectionIndex - Hashable
// -------------------------------------------------------------------------- //

extension Product7CollectionIndex : Hashable where PositionRepresentation:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product7CollectionIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension Product7CollectionIndex : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return self.storage.description
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product7CollectionIndex - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension Product7CollectionIndex : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "Product7CollectionIndex<\(String(reflecting: PositionRepresentation.self))>(storage: \(String(reflecting: self.storage)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product7CollectionIndex - Codable
// -------------------------------------------------------------------------- //

extension Product7CollectionIndex : Codable where PositionRepresentation:Codable {
  
}

