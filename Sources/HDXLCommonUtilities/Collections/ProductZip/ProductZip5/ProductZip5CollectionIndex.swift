//
//  ProductZip5CollectionIndex.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: ProductZip5CollectionIndex - Definition
// -------------------------------------------------------------------------- //

public struct ProductZip5CollectionIndex<PositionRepresentation> : IndexPositionStorageWrapper
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
// MARK: ProductZip5CollectionIndex - Validatable
// -------------------------------------------------------------------------- //

extension ProductZip5CollectionIndex : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      return self.storage.isValid
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ProductZip5CollectionIndex - Equatable
// -------------------------------------------------------------------------- //

extension ProductZip5CollectionIndex : Equatable {
  
  @inlinable
  public static func ==(
    lhs: ProductZip5CollectionIndex<PositionRepresentation>,
    rhs: ProductZip5CollectionIndex<PositionRepresentation>) -> Bool {
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
// MARK: ProductZip5CollectionIndex - Comparable
// -------------------------------------------------------------------------- //

extension ProductZip5CollectionIndex : Comparable {
  
  @inlinable
  public static func <(
    lhs: ProductZip5CollectionIndex<PositionRepresentation>,
    rhs: ProductZip5CollectionIndex<PositionRepresentation>) -> Bool {
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
    lhs: ProductZip5CollectionIndex<PositionRepresentation>,
    rhs: ProductZip5CollectionIndex<PositionRepresentation>) -> Bool {
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
    lhs: ProductZip5CollectionIndex<PositionRepresentation>,
    rhs: ProductZip5CollectionIndex<PositionRepresentation>) -> Bool {
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
    lhs: ProductZip5CollectionIndex<PositionRepresentation>,
    rhs: ProductZip5CollectionIndex<PositionRepresentation>) -> Bool {
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
// MARK: ProductZip5CollectionIndex - Hashable
// -------------------------------------------------------------------------- //

extension ProductZip5CollectionIndex : Hashable where PositionRepresentation:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ProductZip5CollectionIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension ProductZip5CollectionIndex : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return self.storage.description
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ProductZip5CollectionIndex - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension ProductZip5CollectionIndex : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "ProductZip5CollectionIndex<\(String(reflecting: PositionRepresentation.self))>(storage: \(String(reflecting: self.storage)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ProductZip5CollectionIndex - Codable
// -------------------------------------------------------------------------- //

extension ProductZip5CollectionIndex : Codable where PositionRepresentation:Codable {
  
}

