//
//  SumChain3CollectionIndex.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: SumChain3CollectionIndex - Definition
// -------------------------------------------------------------------------- //

public struct SumChain3CollectionIndex<
  A:Collection,
  B:Collection,
  C:Collection> {
  
  @usableFromInline
  internal typealias Storage = SumChain3CollectionIndexStorage<A,B,C>

  @usableFromInline
  internal typealias Position = Storage.Position

  @usableFromInline
  internal var storage: Storage
  
  @inlinable
  internal init(storage: Storage) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(storage.isValid)
    defer { pedantic_assert(storage.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self.storage = storage
  }
  
  @inlinable
  internal init(position: Position) {
    self.init(
      storage: .position(position)
    )
  }
  
  @inlinable
  internal static var endIndex: SumChain3CollectionIndex<A,B,C> {
    get {
      return SumChain3CollectionIndex<A,B,C>(
        storage: .end
      )
    }
  }
}

// -------------------------------------------------------------------------- //
// MARK: SumChain3CollectionIndex - Componentwise Constructors
// -------------------------------------------------------------------------- //

internal extension SumChain3CollectionIndex {
  
  @inlinable
  init(a: A.Index) {
    self.init(position: .a(a))
  }

  @inlinable
  init(b: B.Index) {
    self.init(position: .b(b))
  }

  @inlinable
  init(c: C.Index) {
    self.init(position: .c(c))
  }

}

// -------------------------------------------------------------------------- //
// MARK: SumChain3CollectionIndex - Reflection Support
// -------------------------------------------------------------------------- //

internal extension SumChain3CollectionIndex {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "SumChain3CollectionIndex"
    }
  }
  
  @inlinable
  static var completeTypeName: String {
    get {
      return "\(self.shortTypeName)<\(self.typeParameterNames)>"
    }
  }
  
  @inlinable
  static var typeParameterNames: String {
    get {
      return [
        String(reflecting: A.self),
        String(reflecting: B.self),
        String(reflecting: C.self)
        ].joined(separator: ", ")
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain3CollectionIndex - Validatable
// -------------------------------------------------------------------------- //

extension SumChain3CollectionIndex : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      return self.storage.isValid
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain3CollectionIndex - Equatable
// -------------------------------------------------------------------------- //

extension SumChain3CollectionIndex : Equatable {
  
  @inlinable
  public static func ==(
    lhs: SumChain3CollectionIndex<A,B,C>,
    rhs: SumChain3CollectionIndex<A,B,C>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage == rhs.storage
  }

  @inlinable
  public static func !=(
    lhs: SumChain3CollectionIndex<A,B,C>,
    rhs: SumChain3CollectionIndex<A,B,C>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage != rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: SumChain3CollectionIndex - Comparable
// -------------------------------------------------------------------------- //

extension SumChain3CollectionIndex : Comparable {
  
  @inlinable
  public static func <(
    lhs: SumChain3CollectionIndex<A,B,C>,
    rhs: SumChain3CollectionIndex<A,B,C>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage < rhs.storage
  }
  
  @inlinable
  public static func >(
    lhs: SumChain3CollectionIndex<A,B,C>,
    rhs: SumChain3CollectionIndex<A,B,C>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage > rhs.storage
  }
  
  @inlinable
  public static func <=(
    lhs: SumChain3CollectionIndex<A,B,C>,
    rhs: SumChain3CollectionIndex<A,B,C>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage <= rhs.storage
  }

  @inlinable
  public static func >=(
    lhs: SumChain3CollectionIndex<A,B,C>,
    rhs: SumChain3CollectionIndex<A,B,C>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage >= rhs.storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain3CollectionIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension SumChain3CollectionIndex : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return self.storage.description
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain3CollectionIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension SumChain3CollectionIndex : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(storage: \(String(reflecting: self.storage)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain3CollectionIndexStorage - Definition
// -------------------------------------------------------------------------- //

@usableFromInline
internal enum SumChain3CollectionIndexStorage<
  A:Collection,
  B:Collection,
  C:Collection> {
  
  @usableFromInline
  internal typealias Position = Sum3<A.Index,B.Index,C.Index>
  
  case position(Position)
  case end

}

// -------------------------------------------------------------------------- //
// MARK: SumChain3CollectionIndexStorage - Reflection Support
// -------------------------------------------------------------------------- //

internal extension SumChain3CollectionIndexStorage {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "SumChain3CollectionIndexStorage"
    }
  }
  
  @inlinable
  static var completeTypeName: String {
    get {
      return "\(self.shortTypeName)<\(self.typeParameterNames)>"
    }
  }
  
  @inlinable
  static var typeParameterNames: String {
    get {
      return [
        String(reflecting: A.self),
        String(reflecting: B.self),
        String(reflecting: C.self)
        ].joined(separator: ", ")
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain3CollectionIndexStorage - Validatable
// -------------------------------------------------------------------------- //

extension SumChain3CollectionIndexStorage : Validatable {
  
  @inlinable
  internal var isValid: Bool {
    get {
      switch self {
      case .position(let position):
        return position.isValid
      case .end:
        return true
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain3CollectionIndexStorage - Equatable
// -------------------------------------------------------------------------- //

extension SumChain3CollectionIndexStorage : Equatable {
  
  @inlinable
  internal static func ==(
    lhs: SumChain3CollectionIndexStorage<A,B,C>,
    rhs: SumChain3CollectionIndexStorage<A,B,C>) -> Bool {
    switch (lhs, rhs) {
    case (.position(let l), .position(let r)):
      return l == r
    case (.end, .end):
      return true
    default:
      return false
    }
  }

  @inlinable
  internal static func !=(
    lhs: SumChain3CollectionIndexStorage<A,B,C>,
    rhs: SumChain3CollectionIndexStorage<A,B,C>) -> Bool {
    switch (lhs, rhs) {
    case (.position(let l), .position(let r)):
      return l != r
    case (.end, .end):
      return false
    default:
      return true
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: SumChain3CollectionIndexStorage - Comparable
// -------------------------------------------------------------------------- //

extension SumChain3CollectionIndexStorage : Comparable {
  
  @inlinable
  internal static func <(
    lhs: SumChain3CollectionIndexStorage<A,B,C>,
    rhs: SumChain3CollectionIndexStorage<A,B,C>) -> Bool {
    switch (lhs, rhs) {
    case (.position(let l), .position(let r)):
      return l.isPseudoLessThan(r)
    case (.position(_), .end):
      return true
    case (.end, .position(_)):
      return false
    case (.end, .end):
      return false
    }
  }

  @inlinable
  internal static func >(
    lhs: SumChain3CollectionIndexStorage<A,B,C>,
    rhs: SumChain3CollectionIndexStorage<A,B,C>) -> Bool {
    switch (lhs, rhs) {
    case (.position(let l), .position(let r)):
      return l.isPseudoGreaterThan(r)
    case (.position(_), .end):
      return false
    case (.end, .position(_)):
      return true
    case (.end, .end):
      return false
    }
  }

  @inlinable
  internal static func <=(
    lhs: SumChain3CollectionIndexStorage<A,B,C>,
    rhs: SumChain3CollectionIndexStorage<A,B,C>) -> Bool {
    switch (lhs, rhs) {
    case (.position(let l), .position(let r)):
      return l.isPseudoLessThanOrEqual(r)
    case (.position(_), .end):
      return true
    case (.end, .position(_)):
      return false
    case (.end, .end):
      return true
    }
  }

  @inlinable
  internal static func >=(
    lhs: SumChain3CollectionIndexStorage<A,B,C>,
    rhs: SumChain3CollectionIndexStorage<A,B,C>) -> Bool {
    switch (lhs, rhs) {
    case (.position(let l), .position(let r)):
      return l.isPseudoGreaterThanOrEqual(r)
    case (.position(_), .end):
      return false
    case (.end, .position(_)):
      return true
    case (.end, .end):
      return true
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: SumChain3CollectionIndexStorage - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension SumChain3CollectionIndexStorage : CustomStringConvertible {
  
  @inlinable
  internal var description: String {
    get {
      switch self {
      case .position(let position):
        return ".position(\(String(describing: position)))"
      case .end:
        return ".end"
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain3CollectionIndexStorage - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension SumChain3CollectionIndexStorage : CustomDebugStringConvertible {
  
  @inlinable
  internal var debugDescription: String {
    get {
      switch self {
      case .position(let position):
        return "\(type(of: self).completeTypeName).position(\(String(reflecting: position)))"
      case .end:
        return "\(type(of: self).completeTypeName).end"
      }
    }
  }
  
}
