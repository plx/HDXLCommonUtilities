//
//  SumChain5CollectionIndex.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: SumChain5CollectionIndex - Definition
// -------------------------------------------------------------------------- //

public struct SumChain5CollectionIndex<
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection,
  E:Collection> {
  
  @usableFromInline
  internal typealias Storage = SumChain5CollectionIndexStorage<A,B,C,D,E>

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
  internal static var endIndex: SumChain5CollectionIndex<A,B,C,D,E> {
    get {
      return SumChain5CollectionIndex<A,B,C,D,E>(
        storage: .end
      )
    }
  }
}

// -------------------------------------------------------------------------- //
// MARK: SumChain5CollectionIndex - Componentwise Constructors
// -------------------------------------------------------------------------- //

internal extension SumChain5CollectionIndex {
  
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

  @inlinable
  init(d: D.Index) {
    self.init(position: .d(d))
  }

  @inlinable
  init(e: E.Index) {
    self.init(position: .e(e))
  }

}

// -------------------------------------------------------------------------- //
// MARK: SumChain5CollectionIndex - Reflection Support
// -------------------------------------------------------------------------- //

internal extension SumChain5CollectionIndex {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "SumChain5CollectionIndex"
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
        String(reflecting: C.self),
        String(reflecting: D.self),
        String(reflecting: E.self)
        ].joined(separator: ", ")
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain5CollectionIndex - Validatable
// -------------------------------------------------------------------------- //

extension SumChain5CollectionIndex : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      return self.storage.isValid
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain5CollectionIndex - Equatable
// -------------------------------------------------------------------------- //

extension SumChain5CollectionIndex : Equatable {
  
  @inlinable
  public static func ==(
    lhs: SumChain5CollectionIndex<A,B,C,D,E>,
    rhs: SumChain5CollectionIndex<A,B,C,D,E>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage == rhs.storage
  }

  @inlinable
  public static func !=(
    lhs: SumChain5CollectionIndex<A,B,C,D,E>,
    rhs: SumChain5CollectionIndex<A,B,C,D,E>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage != rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: SumChain5CollectionIndex - Comparable
// -------------------------------------------------------------------------- //

extension SumChain5CollectionIndex : Comparable {
  
  @inlinable
  public static func <(
    lhs: SumChain5CollectionIndex<A,B,C,D,E>,
    rhs: SumChain5CollectionIndex<A,B,C,D,E>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage < rhs.storage
  }
  
  @inlinable
  public static func >(
    lhs: SumChain5CollectionIndex<A,B,C,D,E>,
    rhs: SumChain5CollectionIndex<A,B,C,D,E>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage > rhs.storage
  }
  
  @inlinable
  public static func <=(
    lhs: SumChain5CollectionIndex<A,B,C,D,E>,
    rhs: SumChain5CollectionIndex<A,B,C,D,E>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage <= rhs.storage
  }

  @inlinable
  public static func >=(
    lhs: SumChain5CollectionIndex<A,B,C,D,E>,
    rhs: SumChain5CollectionIndex<A,B,C,D,E>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage >= rhs.storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain5CollectionIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension SumChain5CollectionIndex : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return self.storage.description
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain5CollectionIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension SumChain5CollectionIndex : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(storage: \(String(reflecting: self.storage)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain5CollectionIndexStorage - Definition
// -------------------------------------------------------------------------- //

@usableFromInline
internal enum SumChain5CollectionIndexStorage<
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection,
  E:Collection> {
  
  @usableFromInline
  internal typealias Position = Sum5<A.Index,B.Index,C.Index,D.Index,E.Index>
  
  case position(Position)
  case end

}

// -------------------------------------------------------------------------- //
// MARK: SumChain5CollectionIndexStorage - Reflection Support
// -------------------------------------------------------------------------- //

internal extension SumChain5CollectionIndexStorage {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "SumChain5CollectionIndexStorage"
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
        String(reflecting: C.self),
        String(reflecting: D.self),
        String(reflecting: E.self)
        ].joined(separator: ", ")
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain5CollectionIndexStorage - Validatable
// -------------------------------------------------------------------------- //

extension SumChain5CollectionIndexStorage : Validatable {
  
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
// MARK: SumChain5CollectionIndexStorage - Equatable
// -------------------------------------------------------------------------- //

extension SumChain5CollectionIndexStorage : Equatable {
  
  @inlinable
  internal static func ==(
    lhs: SumChain5CollectionIndexStorage<A,B,C,D,E>,
    rhs: SumChain5CollectionIndexStorage<A,B,C,D,E>) -> Bool {
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
    lhs: SumChain5CollectionIndexStorage<A,B,C,D,E>,
    rhs: SumChain5CollectionIndexStorage<A,B,C,D,E>) -> Bool {
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
// MARK: SumChain5CollectionIndexStorage - Comparable
// -------------------------------------------------------------------------- //

extension SumChain5CollectionIndexStorage : Comparable {
  
  @inlinable
  internal static func <(
    lhs: SumChain5CollectionIndexStorage<A,B,C,D,E>,
    rhs: SumChain5CollectionIndexStorage<A,B,C,D,E>) -> Bool {
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
    lhs: SumChain5CollectionIndexStorage<A,B,C,D,E>,
    rhs: SumChain5CollectionIndexStorage<A,B,C,D,E>) -> Bool {
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
    lhs: SumChain5CollectionIndexStorage<A,B,C,D,E>,
    rhs: SumChain5CollectionIndexStorage<A,B,C,D,E>) -> Bool {
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
    lhs: SumChain5CollectionIndexStorage<A,B,C,D,E>,
    rhs: SumChain5CollectionIndexStorage<A,B,C,D,E>) -> Bool {
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
// MARK: SumChain5CollectionIndexStorage - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension SumChain5CollectionIndexStorage : CustomStringConvertible {
  
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
// MARK: SumChain5CollectionIndexStorage - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension SumChain5CollectionIndexStorage : CustomDebugStringConvertible {
  
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
