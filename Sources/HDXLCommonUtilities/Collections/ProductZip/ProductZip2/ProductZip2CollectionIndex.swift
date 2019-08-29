//
//  ProductZip2CollectionIndex.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: ProductZip2CollectionIndex - Definition
// -------------------------------------------------------------------------- //

public struct ProductZip2CollectionIndex<PositionRepresentation> : IndexPositionStorageWrapper
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
// MARK: ProductZip2CollectionIndex - Validatable
// -------------------------------------------------------------------------- //

extension ProductZip2CollectionIndex : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      return self.storage.isValid
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ProductZip2CollectionIndex - Equatable
// -------------------------------------------------------------------------- //

extension ProductZip2CollectionIndex : Equatable {
  
  @inlinable
  public static func ==(
    lhs: ProductZip2CollectionIndex<PositionRepresentation>,
    rhs: ProductZip2CollectionIndex<PositionRepresentation>) -> Bool {
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
// MARK: ProductZip2CollectionIndex - Comparable
// -------------------------------------------------------------------------- //

extension ProductZip2CollectionIndex : Comparable {
  
  @inlinable
  public static func <(
    lhs: ProductZip2CollectionIndex<PositionRepresentation>,
    rhs: ProductZip2CollectionIndex<PositionRepresentation>) -> Bool {
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
    lhs: ProductZip2CollectionIndex<PositionRepresentation>,
    rhs: ProductZip2CollectionIndex<PositionRepresentation>) -> Bool {
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
    lhs: ProductZip2CollectionIndex<PositionRepresentation>,
    rhs: ProductZip2CollectionIndex<PositionRepresentation>) -> Bool {
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
    lhs: ProductZip2CollectionIndex<PositionRepresentation>,
    rhs: ProductZip2CollectionIndex<PositionRepresentation>) -> Bool {
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
// MARK: ProductZip2CollectionIndex - Hashable
// -------------------------------------------------------------------------- //

extension ProductZip2CollectionIndex : Hashable where PositionRepresentation:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ProductZip2CollectionIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension ProductZip2CollectionIndex : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return self.storage.description
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ProductZip2CollectionIndex - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension ProductZip2CollectionIndex : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "ProductZip2CollectionIndex<\(String(reflecting: PositionRepresentation.self))>(storage: \(String(reflecting: self.storage)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ProductZip2CollectionIndex - Codable
// -------------------------------------------------------------------------- //

extension ProductZip2CollectionIndex : Codable where PositionRepresentation:Codable {
  
}

