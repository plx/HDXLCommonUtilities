//
//  Chain3CollectionIndex.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Chain3CollectionIndex - Definition
// -------------------------------------------------------------------------- //

public struct Chain3CollectionIndex<
  A:Collection,
  B:Collection,
  C:Collection> {
  
  @usableFromInline
  internal typealias Storage = Chain3CollectionIndexStorage<A,B,C>

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
  internal static var endIndex: Chain3CollectionIndex<A,B,C> {
    get {
      return Chain3CollectionIndex<A,B,C>(
        storage: .end
      )
    }
  }
}

// -------------------------------------------------------------------------- //
// MARK: Chain3CollectionIndex - Componentwise Constructors
// -------------------------------------------------------------------------- //

internal extension Chain3CollectionIndex {
  
  @usableFromInline
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
// MARK: Chain3CollectionIndex - Reflection Support
// -------------------------------------------------------------------------- //

internal extension Chain3CollectionIndex {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "Chain3CollectionIndex"
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
// MARK: Chain3CollectionIndex - Validatable
// -------------------------------------------------------------------------- //

extension Chain3CollectionIndex : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      return self.storage.isValid
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Chain3CollectionIndex - Equatable
// -------------------------------------------------------------------------- //

extension Chain3CollectionIndex : Equatable {
  
  @inlinable
  public static func ==(
    lhs: Chain3CollectionIndex<A,B,C>,
    rhs: Chain3CollectionIndex<A,B,C>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage == rhs.storage
  }

  @inlinable
  public static func !=(
    lhs: Chain3CollectionIndex<A,B,C>,
    rhs: Chain3CollectionIndex<A,B,C>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage != rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: Chain3CollectionIndex - Comparable
// -------------------------------------------------------------------------- //

extension Chain3CollectionIndex : Comparable {
  
  @inlinable
  public static func <(
    lhs: Chain3CollectionIndex<A,B,C>,
    rhs: Chain3CollectionIndex<A,B,C>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage < rhs.storage
  }
  
  @inlinable
  public static func >(
    lhs: Chain3CollectionIndex<A,B,C>,
    rhs: Chain3CollectionIndex<A,B,C>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage > rhs.storage
  }
  
  @inlinable
  public static func <=(
    lhs: Chain3CollectionIndex<A,B,C>,
    rhs: Chain3CollectionIndex<A,B,C>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage <= rhs.storage
  }

  @inlinable
  public static func >=(
    lhs: Chain3CollectionIndex<A,B,C>,
    rhs: Chain3CollectionIndex<A,B,C>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage >= rhs.storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Chain3CollectionIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension Chain3CollectionIndex : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return self.storage.description
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Chain3CollectionIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension Chain3CollectionIndex : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(storage: \(String(reflecting: self.storage)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Chain3CollectionIndexStorage - Definition
// -------------------------------------------------------------------------- //

@usableFromInline
internal enum Chain3CollectionIndexStorage<
  A:Collection,
  B:Collection,
  C:Collection> {
  
  @usableFromInline
  internal typealias Position = Sum3<A.Index,B.Index,C.Index>
  
  case position(Position)
  case end

}

// -------------------------------------------------------------------------- //
// MARK: Chain3CollectionIndexStorage - Reflection Support
// -------------------------------------------------------------------------- //

internal extension Chain3CollectionIndexStorage {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "Chain3CollectionIndexStorage"
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
// MARK: Chain3CollectionIndexStorage - Validatable
// -------------------------------------------------------------------------- //

extension Chain3CollectionIndexStorage : Validatable {
  
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
// MARK: Chain3CollectionIndexStorage - Equatable
// -------------------------------------------------------------------------- //

extension Chain3CollectionIndexStorage : Equatable {
  
  @inlinable
  internal static func ==(
    lhs: Chain3CollectionIndexStorage<A,B,C>,
    rhs: Chain3CollectionIndexStorage<A,B,C>) -> Bool {
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
    lhs: Chain3CollectionIndexStorage<A,B,C>,
    rhs: Chain3CollectionIndexStorage<A,B,C>) -> Bool {
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
// MARK: Chain3CollectionIndexStorage - Comparable
// -------------------------------------------------------------------------- //

extension Chain3CollectionIndexStorage : Comparable {
  
  @inlinable
  internal static func <(
    lhs: Chain3CollectionIndexStorage<A,B,C>,
    rhs: Chain3CollectionIndexStorage<A,B,C>) -> Bool {
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
    lhs: Chain3CollectionIndexStorage<A,B,C>,
    rhs: Chain3CollectionIndexStorage<A,B,C>) -> Bool {
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
    lhs: Chain3CollectionIndexStorage<A,B,C>,
    rhs: Chain3CollectionIndexStorage<A,B,C>) -> Bool {
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
    lhs: Chain3CollectionIndexStorage<A,B,C>,
    rhs: Chain3CollectionIndexStorage<A,B,C>) -> Bool {
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
// MARK: Chain3CollectionIndexStorage - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension Chain3CollectionIndexStorage : CustomStringConvertible {
  
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
// MARK: Chain3CollectionIndexStorage - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension Chain3CollectionIndexStorage : CustomDebugStringConvertible {
  
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
