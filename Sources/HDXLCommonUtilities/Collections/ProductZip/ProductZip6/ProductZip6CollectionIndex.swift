//
//  ProductZip6CollectionIndex.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: ProductZip6CollectionIndex - Definition
// -------------------------------------------------------------------------- //

public struct ProductZip6CollectionIndex<PositionRepresentation> : IndexPositionStorageWrapper
  where
  PositionRepresentation:AlgebraicProduct6,
  PositionRepresentation.A:Comparable,
  PositionRepresentation.B:Comparable,
  PositionRepresentation.C:Comparable,
  PositionRepresentation.D:Comparable,
  PositionRepresentation.E:Comparable,
  PositionRepresentation.F:Comparable {
  
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
// MARK: ProductZip6CollectionIndex - Validatable
// -------------------------------------------------------------------------- //

extension ProductZip6CollectionIndex : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      return self.storage.isValid
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ProductZip6CollectionIndex - Equatable
// -------------------------------------------------------------------------- //

extension ProductZip6CollectionIndex : Equatable {
  
  @inlinable
  public static func ==(
    lhs: ProductZip6CollectionIndex<PositionRepresentation>,
    rhs: ProductZip6CollectionIndex<PositionRepresentation>) -> Bool {
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
// MARK: ProductZip6CollectionIndex - Comparable
// -------------------------------------------------------------------------- //

extension ProductZip6CollectionIndex : Comparable {
  
  @inlinable
  public static func <(
    lhs: ProductZip6CollectionIndex<PositionRepresentation>,
    rhs: ProductZip6CollectionIndex<PositionRepresentation>) -> Bool {
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
    lhs: ProductZip6CollectionIndex<PositionRepresentation>,
    rhs: ProductZip6CollectionIndex<PositionRepresentation>) -> Bool {
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
    lhs: ProductZip6CollectionIndex<PositionRepresentation>,
    rhs: ProductZip6CollectionIndex<PositionRepresentation>) -> Bool {
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
    lhs: ProductZip6CollectionIndex<PositionRepresentation>,
    rhs: ProductZip6CollectionIndex<PositionRepresentation>) -> Bool {
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
// MARK: ProductZip6CollectionIndex - Hashable
// -------------------------------------------------------------------------- //

extension ProductZip6CollectionIndex : Hashable where PositionRepresentation:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ProductZip6CollectionIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension ProductZip6CollectionIndex : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return self.storage.description
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ProductZip6CollectionIndex - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension ProductZip6CollectionIndex : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "ProductZip6CollectionIndex<\(String(reflecting: PositionRepresentation.self))>(storage: \(String(reflecting: self.storage)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ProductZip6CollectionIndex - Codable
// -------------------------------------------------------------------------- //

extension ProductZip6CollectionIndex : Codable where PositionRepresentation:Codable {
  
}

