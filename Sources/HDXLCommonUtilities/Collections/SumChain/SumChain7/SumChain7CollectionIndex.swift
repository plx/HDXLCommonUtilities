//
//  SumChain7CollectionIndex.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: SumChain7CollectionIndex - Definition
// -------------------------------------------------------------------------- //

public struct SumChain7CollectionIndex<
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection,
  E:Collection,
  F:Collection,
  G:Collection> {
  
  @usableFromInline
  internal typealias Storage = SumChain7CollectionIndexStorage<A,B,C,D,E,F,G>

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
  internal static var endIndex: SumChain7CollectionIndex<A,B,C,D,E,F,G> {
    get {
      return SumChain7CollectionIndex<A,B,C,D,E,F,G>(
        storage: .end
      )
    }
  }
}

// -------------------------------------------------------------------------- //
// MARK: SumChain7CollectionIndex - Componentwise Constructors
// -------------------------------------------------------------------------- //

internal extension SumChain7CollectionIndex {
  
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

  @inlinable
  init(f: F.Index) {
    self.init(position: .f(f))
  }

  @inlinable
  init(g: G.Index) {
    self.init(position: .g(g))
  }

}

// -------------------------------------------------------------------------- //
// MARK: SumChain7CollectionIndex - Reflection Support
// -------------------------------------------------------------------------- //

internal extension SumChain7CollectionIndex {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "SumChain7CollectionIndex"
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
        String(reflecting: E.self),
        String(reflecting: F.self),
        String(reflecting: G.self)
        ].joined(separator: ", ")
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain7CollectionIndex - Validatable
// -------------------------------------------------------------------------- //

extension SumChain7CollectionIndex : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      return self.storage.isValid
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain7CollectionIndex - Equatable
// -------------------------------------------------------------------------- //

extension SumChain7CollectionIndex : Equatable {
  
  @inlinable
  public static func ==(
    lhs: SumChain7CollectionIndex<A,B,C,D,E,F,G>,
    rhs: SumChain7CollectionIndex<A,B,C,D,E,F,G>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage == rhs.storage
  }

  @inlinable
  public static func !=(
    lhs: SumChain7CollectionIndex<A,B,C,D,E,F,G>,
    rhs: SumChain7CollectionIndex<A,B,C,D,E,F,G>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage != rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: SumChain7CollectionIndex - Comparable
// -------------------------------------------------------------------------- //

extension SumChain7CollectionIndex : Comparable {
  
  @inlinable
  public static func <(
    lhs: SumChain7CollectionIndex<A,B,C,D,E,F,G>,
    rhs: SumChain7CollectionIndex<A,B,C,D,E,F,G>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage < rhs.storage
  }
  
  @inlinable
  public static func >(
    lhs: SumChain7CollectionIndex<A,B,C,D,E,F,G>,
    rhs: SumChain7CollectionIndex<A,B,C,D,E,F,G>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage > rhs.storage
  }
  
  @inlinable
  public static func <=(
    lhs: SumChain7CollectionIndex<A,B,C,D,E,F,G>,
    rhs: SumChain7CollectionIndex<A,B,C,D,E,F,G>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage <= rhs.storage
  }

  @inlinable
  public static func >=(
    lhs: SumChain7CollectionIndex<A,B,C,D,E,F,G>,
    rhs: SumChain7CollectionIndex<A,B,C,D,E,F,G>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage >= rhs.storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain7CollectionIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension SumChain7CollectionIndex : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return self.storage.description
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain7CollectionIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension SumChain7CollectionIndex : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(storage: \(String(reflecting: self.storage)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain7CollectionIndexStorage - Definition
// -------------------------------------------------------------------------- //

@usableFromInline
internal enum SumChain7CollectionIndexStorage<
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection,
  E:Collection,
  F:Collection,
  G:Collection> {
  
  @usableFromInline
  internal typealias Position = Sum7<A.Index,B.Index,C.Index,D.Index,E.Index,F.Index,G.Index>
  
  case position(Position)
  case end

}

// -------------------------------------------------------------------------- //
// MARK: SumChain7CollectionIndexStorage - Reflection Support
// -------------------------------------------------------------------------- //

internal extension SumChain7CollectionIndexStorage {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "SumChain7CollectionIndexStorage"
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
        String(reflecting: E.self),
        String(reflecting: F.self),
        String(reflecting: G.self)
        ].joined(separator: ", ")
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain7CollectionIndexStorage - Validatable
// -------------------------------------------------------------------------- //

extension SumChain7CollectionIndexStorage : Validatable {
  
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
// MARK: SumChain7CollectionIndexStorage - Equatable
// -------------------------------------------------------------------------- //

extension SumChain7CollectionIndexStorage : Equatable {
  
  @inlinable
  internal static func ==(
    lhs: SumChain7CollectionIndexStorage<A,B,C,D,E,F,G>,
    rhs: SumChain7CollectionIndexStorage<A,B,C,D,E,F,G>) -> Bool {
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
    lhs: SumChain7CollectionIndexStorage<A,B,C,D,E,F,G>,
    rhs: SumChain7CollectionIndexStorage<A,B,C,D,E,F,G>) -> Bool {
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
// MARK: SumChain7CollectionIndexStorage - Comparable
// -------------------------------------------------------------------------- //

extension SumChain7CollectionIndexStorage : Comparable {
  
  @inlinable
  internal static func <(
    lhs: SumChain7CollectionIndexStorage<A,B,C,D,E,F,G>,
    rhs: SumChain7CollectionIndexStorage<A,B,C,D,E,F,G>) -> Bool {
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
    lhs: SumChain7CollectionIndexStorage<A,B,C,D,E,F,G>,
    rhs: SumChain7CollectionIndexStorage<A,B,C,D,E,F,G>) -> Bool {
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
    lhs: SumChain7CollectionIndexStorage<A,B,C,D,E,F,G>,
    rhs: SumChain7CollectionIndexStorage<A,B,C,D,E,F,G>) -> Bool {
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
    lhs: SumChain7CollectionIndexStorage<A,B,C,D,E,F,G>,
    rhs: SumChain7CollectionIndexStorage<A,B,C,D,E,F,G>) -> Bool {
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
// MARK: SumChain7CollectionIndexStorage - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension SumChain7CollectionIndexStorage : CustomStringConvertible {
  
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
// MARK: SumChain7CollectionIndexStorage - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension SumChain7CollectionIndexStorage : CustomDebugStringConvertible {
  
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
