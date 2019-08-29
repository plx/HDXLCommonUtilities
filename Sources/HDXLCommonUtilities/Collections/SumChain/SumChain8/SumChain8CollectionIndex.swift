//
//  SumChain8CollectionIndex.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: SumChain8CollectionIndex - Definition
// -------------------------------------------------------------------------- //

public struct SumChain8CollectionIndex<
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection,
  E:Collection,
  F:Collection,
  G:Collection,
  H:Collection> {
  
  @usableFromInline
  internal typealias Storage = SumChain8CollectionIndexStorage<A,B,C,D,E,F,G,H>

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
  internal static var endIndex: SumChain8CollectionIndex<A,B,C,D,E,F,G,H> {
    get {
      return SumChain8CollectionIndex<A,B,C,D,E,F,G,H>(
        storage: .end
      )
    }
  }
}

// -------------------------------------------------------------------------- //
// MARK: SumChain8CollectionIndex - Componentwise Constructors
// -------------------------------------------------------------------------- //

internal extension SumChain8CollectionIndex {
  
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

  @inlinable
  init(h: H.Index) {
    self.init(position: .h(h))
  }

}

// -------------------------------------------------------------------------- //
// MARK: SumChain8CollectionIndex - Reflection Support
// -------------------------------------------------------------------------- //

internal extension SumChain8CollectionIndex {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "SumChain8CollectionIndex"
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
        String(reflecting: G.self),
        String(reflecting: H.self)
        ].joined(separator: ", ")
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain8CollectionIndex - Validatable
// -------------------------------------------------------------------------- //

extension SumChain8CollectionIndex : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      return self.storage.isValid
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain8CollectionIndex - Equatable
// -------------------------------------------------------------------------- //

extension SumChain8CollectionIndex : Equatable {
  
  @inlinable
  public static func ==(
    lhs: SumChain8CollectionIndex<A,B,C,D,E,F,G,H>,
    rhs: SumChain8CollectionIndex<A,B,C,D,E,F,G,H>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage == rhs.storage
  }

  @inlinable
  public static func !=(
    lhs: SumChain8CollectionIndex<A,B,C,D,E,F,G,H>,
    rhs: SumChain8CollectionIndex<A,B,C,D,E,F,G,H>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage != rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: SumChain8CollectionIndex - Comparable
// -------------------------------------------------------------------------- //

extension SumChain8CollectionIndex : Comparable {
  
  @inlinable
  public static func <(
    lhs: SumChain8CollectionIndex<A,B,C,D,E,F,G,H>,
    rhs: SumChain8CollectionIndex<A,B,C,D,E,F,G,H>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage < rhs.storage
  }
  
  @inlinable
  public static func >(
    lhs: SumChain8CollectionIndex<A,B,C,D,E,F,G,H>,
    rhs: SumChain8CollectionIndex<A,B,C,D,E,F,G,H>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage > rhs.storage
  }
  
  @inlinable
  public static func <=(
    lhs: SumChain8CollectionIndex<A,B,C,D,E,F,G,H>,
    rhs: SumChain8CollectionIndex<A,B,C,D,E,F,G,H>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage <= rhs.storage
  }

  @inlinable
  public static func >=(
    lhs: SumChain8CollectionIndex<A,B,C,D,E,F,G,H>,
    rhs: SumChain8CollectionIndex<A,B,C,D,E,F,G,H>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage >= rhs.storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain8CollectionIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension SumChain8CollectionIndex : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return self.storage.description
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain8CollectionIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension SumChain8CollectionIndex : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(storage: \(String(reflecting: self.storage)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain8CollectionIndexStorage - Definition
// -------------------------------------------------------------------------- //

@usableFromInline
internal enum SumChain8CollectionIndexStorage<
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection,
  E:Collection,
  F:Collection,
  G:Collection,
  H:Collection> {
  
  @usableFromInline
  internal typealias Position = Sum8<A.Index,B.Index,C.Index,D.Index,E.Index,F.Index,G.Index,H.Index>
  
  case position(Position)
  case end

}

// -------------------------------------------------------------------------- //
// MARK: SumChain8CollectionIndexStorage - Reflection Support
// -------------------------------------------------------------------------- //

internal extension SumChain8CollectionIndexStorage {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "SumChain8CollectionIndexStorage"
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
        String(reflecting: G.self),
        String(reflecting: H.self)
        ].joined(separator: ", ")
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain8CollectionIndexStorage - Validatable
// -------------------------------------------------------------------------- //

extension SumChain8CollectionIndexStorage : Validatable {
  
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
// MARK: SumChain8CollectionIndexStorage - Equatable
// -------------------------------------------------------------------------- //

extension SumChain8CollectionIndexStorage : Equatable {
  
  @inlinable
  internal static func ==(
    lhs: SumChain8CollectionIndexStorage<A,B,C,D,E,F,G,H>,
    rhs: SumChain8CollectionIndexStorage<A,B,C,D,E,F,G,H>) -> Bool {
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
    lhs: SumChain8CollectionIndexStorage<A,B,C,D,E,F,G,H>,
    rhs: SumChain8CollectionIndexStorage<A,B,C,D,E,F,G,H>) -> Bool {
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
// MARK: SumChain8CollectionIndexStorage - Comparable
// -------------------------------------------------------------------------- //

extension SumChain8CollectionIndexStorage : Comparable {
  
  @inlinable
  internal static func <(
    lhs: SumChain8CollectionIndexStorage<A,B,C,D,E,F,G,H>,
    rhs: SumChain8CollectionIndexStorage<A,B,C,D,E,F,G,H>) -> Bool {
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
    lhs: SumChain8CollectionIndexStorage<A,B,C,D,E,F,G,H>,
    rhs: SumChain8CollectionIndexStorage<A,B,C,D,E,F,G,H>) -> Bool {
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
    lhs: SumChain8CollectionIndexStorage<A,B,C,D,E,F,G,H>,
    rhs: SumChain8CollectionIndexStorage<A,B,C,D,E,F,G,H>) -> Bool {
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
    lhs: SumChain8CollectionIndexStorage<A,B,C,D,E,F,G,H>,
    rhs: SumChain8CollectionIndexStorage<A,B,C,D,E,F,G,H>) -> Bool {
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
// MARK: SumChain8CollectionIndexStorage - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension SumChain8CollectionIndexStorage : CustomStringConvertible {
  
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
// MARK: SumChain8CollectionIndexStorage - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension SumChain8CollectionIndexStorage : CustomDebugStringConvertible {
  
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
