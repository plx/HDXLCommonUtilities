//
//  ProductZip8CollectionIndex.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: ProductZip8CollectionIndex - Definition
// -------------------------------------------------------------------------- //

public struct ProductZip8CollectionIndex<PositionRepresentation> : IndexPositionStorageWrapper
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
// MARK: ProductZip8CollectionIndex - Validatable
// -------------------------------------------------------------------------- //

extension ProductZip8CollectionIndex : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      return self.storage.isValid
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ProductZip8CollectionIndex - Equatable
// -------------------------------------------------------------------------- //

extension ProductZip8CollectionIndex : Equatable {
  
  @inlinable
  public static func ==(
    lhs: ProductZip8CollectionIndex<PositionRepresentation>,
    rhs: ProductZip8CollectionIndex<PositionRepresentation>) -> Bool {
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
// MARK: ProductZip8CollectionIndex - Comparable
// -------------------------------------------------------------------------- //

extension ProductZip8CollectionIndex : Comparable {
  
  @inlinable
  public static func <(
    lhs: ProductZip8CollectionIndex<PositionRepresentation>,
    rhs: ProductZip8CollectionIndex<PositionRepresentation>) -> Bool {
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
    lhs: ProductZip8CollectionIndex<PositionRepresentation>,
    rhs: ProductZip8CollectionIndex<PositionRepresentation>) -> Bool {
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
    lhs: ProductZip8CollectionIndex<PositionRepresentation>,
    rhs: ProductZip8CollectionIndex<PositionRepresentation>) -> Bool {
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
    lhs: ProductZip8CollectionIndex<PositionRepresentation>,
    rhs: ProductZip8CollectionIndex<PositionRepresentation>) -> Bool {
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
// MARK: ProductZip8CollectionIndex - Hashable
// -------------------------------------------------------------------------- //

extension ProductZip8CollectionIndex : Hashable where PositionRepresentation:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ProductZip8CollectionIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension ProductZip8CollectionIndex : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return self.storage.description
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ProductZip8CollectionIndex - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension ProductZip8CollectionIndex : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "ProductZip8CollectionIndex<\(String(reflecting: PositionRepresentation.self))>(storage: \(String(reflecting: self.storage)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ProductZip8CollectionIndex - Codable
// -------------------------------------------------------------------------- //

extension ProductZip8CollectionIndex : Codable where PositionRepresentation:Codable {
  
}

