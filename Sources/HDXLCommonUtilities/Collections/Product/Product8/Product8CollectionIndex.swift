//
//  Product8CollectionIndex.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Product8CollectionIndex - Definition
// -------------------------------------------------------------------------- //

public struct Product8CollectionIndex<PositionRepresentation> : IndexPositionStorageWrapper
  where
  PositionRepresentation:AlgebraicProduct8,
  PositionRepresentation.A:Comparable,
  PositionRepresentation.B:Comparable,
  PositionRepresentation.C:Comparable,
  PositionRepresentation.D:Comparable,
  PositionRepresentation.E:Comparable,
  PositionRepresentation.F:Comparable,
  PositionRepresentation.G:Comparable,
  PositionRepresentation.H:Comparable {
  
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
// MARK: Product8CollectionIndex - Validatable
// -------------------------------------------------------------------------- //

extension Product8CollectionIndex : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      return self.storage.isValid
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product8CollectionIndex - Equatable
// -------------------------------------------------------------------------- //

extension Product8CollectionIndex : Equatable {
  
  @inlinable
  public static func ==(
    lhs: Product8CollectionIndex<PositionRepresentation>,
    rhs: Product8CollectionIndex<PositionRepresentation>) -> Bool {
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
// MARK: Product8CollectionIndex - Comparable
// -------------------------------------------------------------------------- //

extension Product8CollectionIndex : Comparable {
  
  @inlinable
  public static func <(
    lhs: Product8CollectionIndex<PositionRepresentation>,
    rhs: Product8CollectionIndex<PositionRepresentation>) -> Bool {
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
    lhs: Product8CollectionIndex<PositionRepresentation>,
    rhs: Product8CollectionIndex<PositionRepresentation>) -> Bool {
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
    lhs: Product8CollectionIndex<PositionRepresentation>,
    rhs: Product8CollectionIndex<PositionRepresentation>) -> Bool {
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
    lhs: Product8CollectionIndex<PositionRepresentation>,
    rhs: Product8CollectionIndex<PositionRepresentation>) -> Bool {
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
// MARK: Product8CollectionIndex - Hashable
// -------------------------------------------------------------------------- //

extension Product8CollectionIndex : Hashable where PositionRepresentation:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product8CollectionIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension Product8CollectionIndex : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return self.storage.description
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product8CollectionIndex - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension Product8CollectionIndex : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "Product8CollectionIndex<\(String(reflecting: PositionRepresentation.self))>(storage: \(String(reflecting: self.storage)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product8CollectionIndex - Codable
// -------------------------------------------------------------------------- //

extension Product8CollectionIndex : Codable where PositionRepresentation:Codable {
  
}

