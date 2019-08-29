//
//  Product2CollectionIndex.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Product2CollectionIndex - Definition
// -------------------------------------------------------------------------- //

public struct Product2CollectionIndex<PositionRepresentation> : IndexPositionStorageWrapper
  where
  PositionRepresentation:AlgebraicProduct2,
  PositionRepresentation.A:Comparable,
  PositionRepresentation.B:Comparable {
  
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
// MARK: Product2CollectionIndex - Validatable
// -------------------------------------------------------------------------- //

extension Product2CollectionIndex : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      return self.storage.isValid
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product2CollectionIndex - Equatable
// -------------------------------------------------------------------------- //

extension Product2CollectionIndex : Equatable {
  
  @inlinable
  public static func ==(
    lhs: Product2CollectionIndex<PositionRepresentation>,
    rhs: Product2CollectionIndex<PositionRepresentation>) -> Bool {
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
// MARK: Product2CollectionIndex - Comparable
// -------------------------------------------------------------------------- //

extension Product2CollectionIndex : Comparable {
  
  @inlinable
  public static func <(
    lhs: Product2CollectionIndex<PositionRepresentation>,
    rhs: Product2CollectionIndex<PositionRepresentation>) -> Bool {
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
    lhs: Product2CollectionIndex<PositionRepresentation>,
    rhs: Product2CollectionIndex<PositionRepresentation>) -> Bool {
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
    lhs: Product2CollectionIndex<PositionRepresentation>,
    rhs: Product2CollectionIndex<PositionRepresentation>) -> Bool {
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
    lhs: Product2CollectionIndex<PositionRepresentation>,
    rhs: Product2CollectionIndex<PositionRepresentation>) -> Bool {
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
// MARK: Product2CollectionIndex - Hashable
// -------------------------------------------------------------------------- //

extension Product2CollectionIndex : Hashable where PositionRepresentation:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product2CollectionIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension Product2CollectionIndex : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return self.storage.description
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product2CollectionIndex - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension Product2CollectionIndex : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "Product2CollectionIndex<\(String(reflecting: PositionRepresentation.self))>(storage: \(String(reflecting: self.storage)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product2CollectionIndex - Codable
// -------------------------------------------------------------------------- //

extension Product2CollectionIndex : Codable where PositionRepresentation:Codable {
  
}

