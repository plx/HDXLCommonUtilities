//
//  ProductZip4CollectionIndex.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: ProductZip4CollectionIndex - Definition
// -------------------------------------------------------------------------- //

public struct ProductZip4CollectionIndex<PositionRepresentation> : IndexPositionStorageWrapper
  where
  PositionRepresentation:AlgebraicProduct4,
  PositionRepresentation.A:Comparable,
  PositionRepresentation.B:Comparable,
  PositionRepresentation.C:Comparable,
  PositionRepresentation.D:Comparable {
  
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
// MARK: ProductZip4CollectionIndex - Validatable
// -------------------------------------------------------------------------- //

extension ProductZip4CollectionIndex : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      return self.storage.isValid
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ProductZip4CollectionIndex - Equatable
// -------------------------------------------------------------------------- //

extension ProductZip4CollectionIndex : Equatable {
  
  @inlinable
  public static func ==(
    lhs: ProductZip4CollectionIndex<PositionRepresentation>,
    rhs: ProductZip4CollectionIndex<PositionRepresentation>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage.customizedEquivalence(to: rhs.storage) {
      (l,r) -> Bool
      in
      return l.a == r.a
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ProductZip4CollectionIndex - Comparable
// -------------------------------------------------------------------------- //

extension ProductZip4CollectionIndex : Comparable {
  
  @inlinable
  public static func <(
    lhs: ProductZip4CollectionIndex<PositionRepresentation>,
    rhs: ProductZip4CollectionIndex<PositionRepresentation>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage.customizedComparison(to: rhs.storage) {
      (l,r) -> ComparisonResult
      in
      return l.a <=> r.a
    }.impliesLessThan
  }

  @inlinable
  public static func >(
    lhs: ProductZip4CollectionIndex<PositionRepresentation>,
    rhs: ProductZip4CollectionIndex<PositionRepresentation>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage.customizedComparison(to: rhs.storage) {
      (l,r) -> ComparisonResult
      in
      return l.a <=> r.a
    }.impliesGreaterThan
  }

  @inlinable
  public static func <=(
    lhs: ProductZip4CollectionIndex<PositionRepresentation>,
    rhs: ProductZip4CollectionIndex<PositionRepresentation>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage.customizedComparison(to: rhs.storage) {
      (l,r) -> ComparisonResult
      in
      return l.a <=> r.a
    }.impliesLessThanOrEqual
  }

  @inlinable
  public static func >=(
    lhs: ProductZip4CollectionIndex<PositionRepresentation>,
    rhs: ProductZip4CollectionIndex<PositionRepresentation>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage.customizedComparison(to: rhs.storage) {
      (l,r) -> ComparisonResult
      in
      return l.a <=> r.a
    }.impliesGreaterThanOrEqual
  }

}

// -------------------------------------------------------------------------- //
// MARK: ProductZip4CollectionIndex - Hashable
// -------------------------------------------------------------------------- //

extension ProductZip4CollectionIndex : Hashable where PositionRepresentation:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ProductZip4CollectionIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension ProductZip4CollectionIndex : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return self.storage.description
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ProductZip4CollectionIndex - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension ProductZip4CollectionIndex : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "ProductZip4CollectionIndex<\(String(reflecting: PositionRepresentation.self))>(storage: \(String(reflecting: self.storage)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ProductZip4CollectionIndex - Codable
// -------------------------------------------------------------------------- //

extension ProductZip4CollectionIndex : Codable where PositionRepresentation:Codable {
  
}

