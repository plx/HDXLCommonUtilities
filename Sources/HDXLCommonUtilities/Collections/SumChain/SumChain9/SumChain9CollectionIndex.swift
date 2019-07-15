//
//  SumChain9CollectionIndex.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: SumChain9CollectionIndex - Definition
// -------------------------------------------------------------------------- //

public struct SumChain9CollectionIndex<
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection,
  E:Collection,
  F:Collection,
  G:Collection,
  H:Collection,
  I:Collection> {
  
  @usableFromInline
  internal typealias Storage = SumChain9CollectionIndexStorage<A,B,C,D,E,F,G,H,I>

  @usableFromInline
  internal typealias Position = Storage.Position

  @usableFromInline
  internal var storage: Storage
  
  @usableFromInline
  internal init(storage: Storage) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(storage.isValid)
    defer { pedantic_assert(storage.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self.storage = storage
  }
  
  @usableFromInline
  internal init(position: Position) {
    self.init(
      storage: .position(position)
    )
  }
  
  @usableFromInline
  internal static var endIndex: SumChain9CollectionIndex<A,B,C,D,E,F,G,H,I> {
    get {
      return SumChain9CollectionIndex<A,B,C,D,E,F,G,H,I>(
        storage: .end
      )
    }
  }
}

// -------------------------------------------------------------------------- //
// MARK: SumChain9CollectionIndex - Componentwise Constructors
// -------------------------------------------------------------------------- //

internal extension SumChain9CollectionIndex {
  
  @usableFromInline
  init(a: A.Index) {
    self.init(position: .a(a))
  }

  @usableFromInline
  init(b: B.Index) {
    self.init(position: .b(b))
  }

  @usableFromInline
  init(c: C.Index) {
    self.init(position: .c(c))
  }

  @usableFromInline
  init(d: D.Index) {
    self.init(position: .d(d))
  }

  @usableFromInline
  init(e: E.Index) {
    self.init(position: .e(e))
  }

  @usableFromInline
  init(f: F.Index) {
    self.init(position: .f(f))
  }

  @usableFromInline
  init(g: G.Index) {
    self.init(position: .g(g))
  }

  @usableFromInline
  init(h: H.Index) {
    self.init(position: .h(h))
  }

  @usableFromInline
  init(i: I.Index) {
    self.init(position: .i(i))
  }

}

// -------------------------------------------------------------------------- //
// MARK: SumChain9CollectionIndex - Reflection Support
// -------------------------------------------------------------------------- //

internal extension SumChain9CollectionIndex {
  
  @usableFromInline
  static var shortTypeName: String {
    get {
      return "SumChain9CollectionIndex"
    }
  }
  
  @usableFromInline
  static var completeTypeName: String {
    get {
      return "\(self.shortTypeName)<\(self.typeParameterNames)>"
    }
  }
  
  @usableFromInline
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
        String(reflecting: H.self),
        String(reflecting: I.self)
        ].joined(separator: ", ")
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain9CollectionIndex - Validatable
// -------------------------------------------------------------------------- //

extension SumChain9CollectionIndex : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      return self.storage.isValid
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain9CollectionIndex - Equatable
// -------------------------------------------------------------------------- //

extension SumChain9CollectionIndex : Equatable {
  
  @inlinable
  public static func ==(
    lhs: SumChain9CollectionIndex<A,B,C,D,E,F,G,H,I>,
    rhs: SumChain9CollectionIndex<A,B,C,D,E,F,G,H,I>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage == rhs.storage
  }

  @inlinable
  public static func !=(
    lhs: SumChain9CollectionIndex<A,B,C,D,E,F,G,H,I>,
    rhs: SumChain9CollectionIndex<A,B,C,D,E,F,G,H,I>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage != rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: SumChain9CollectionIndex - Comparable
// -------------------------------------------------------------------------- //

extension SumChain9CollectionIndex : Comparable {
  
  @inlinable
  public static func <(
    lhs: SumChain9CollectionIndex<A,B,C,D,E,F,G,H,I>,
    rhs: SumChain9CollectionIndex<A,B,C,D,E,F,G,H,I>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage < rhs.storage
  }
  
  @inlinable
  public static func >(
    lhs: SumChain9CollectionIndex<A,B,C,D,E,F,G,H,I>,
    rhs: SumChain9CollectionIndex<A,B,C,D,E,F,G,H,I>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage > rhs.storage
  }
  
  @inlinable
  public static func <=(
    lhs: SumChain9CollectionIndex<A,B,C,D,E,F,G,H,I>,
    rhs: SumChain9CollectionIndex<A,B,C,D,E,F,G,H,I>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage <= rhs.storage
  }

  @inlinable
  public static func >=(
    lhs: SumChain9CollectionIndex<A,B,C,D,E,F,G,H,I>,
    rhs: SumChain9CollectionIndex<A,B,C,D,E,F,G,H,I>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage >= rhs.storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain9CollectionIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension SumChain9CollectionIndex : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return self.storage.description
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain9CollectionIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension SumChain9CollectionIndex : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(storage: \(String(reflecting: self.storage)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain9CollectionIndexStorage - Definition
// -------------------------------------------------------------------------- //

@usableFromInline
internal enum SumChain9CollectionIndexStorage<
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection,
  E:Collection,
  F:Collection,
  G:Collection,
  H:Collection,
  I:Collection> {
  
  @usableFromInline
  internal typealias Position = Sum9<A.Index,B.Index,C.Index,D.Index,E.Index,F.Index,G.Index,H.Index,I.Index>
  
  case position(Position)
  case end

}

// -------------------------------------------------------------------------- //
// MARK: SumChain9CollectionIndexStorage - Reflection Support
// -------------------------------------------------------------------------- //

internal extension SumChain9CollectionIndexStorage {
  
  @usableFromInline
  static var shortTypeName: String {
    get {
      return "SumChain9CollectionIndexStorage"
    }
  }
  
  @usableFromInline
  static var completeTypeName: String {
    get {
      return "\(self.shortTypeName)<\(self.typeParameterNames)>"
    }
  }
  
  @usableFromInline
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
        String(reflecting: H.self),
        String(reflecting: I.self)
        ].joined(separator: ", ")
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain9CollectionIndexStorage - Validatable
// -------------------------------------------------------------------------- //

extension SumChain9CollectionIndexStorage : Validatable {
  
  @usableFromInline
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
// MARK: SumChain9CollectionIndexStorage - Equatable
// -------------------------------------------------------------------------- //

extension SumChain9CollectionIndexStorage : Equatable {
  
  @usableFromInline
  internal static func ==(
    lhs: SumChain9CollectionIndexStorage<A,B,C,D,E,F,G,H,I>,
    rhs: SumChain9CollectionIndexStorage<A,B,C,D,E,F,G,H,I>) -> Bool {
    switch (lhs, rhs) {
    case (.position(let l), .position(let r)):
      return l == r
    case (.end, .end):
      return true
    default:
      return false
    }
  }

  @usableFromInline
  internal static func !=(
    lhs: SumChain9CollectionIndexStorage<A,B,C,D,E,F,G,H,I>,
    rhs: SumChain9CollectionIndexStorage<A,B,C,D,E,F,G,H,I>) -> Bool {
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
// MARK: SumChain9CollectionIndexStorage - Comparable
// -------------------------------------------------------------------------- //

extension SumChain9CollectionIndexStorage : Comparable {
  
  @usableFromInline
  internal static func <(
    lhs: SumChain9CollectionIndexStorage<A,B,C,D,E,F,G,H,I>,
    rhs: SumChain9CollectionIndexStorage<A,B,C,D,E,F,G,H,I>) -> Bool {
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

  @usableFromInline
  internal static func >(
    lhs: SumChain9CollectionIndexStorage<A,B,C,D,E,F,G,H,I>,
    rhs: SumChain9CollectionIndexStorage<A,B,C,D,E,F,G,H,I>) -> Bool {
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

  @usableFromInline
  internal static func <=(
    lhs: SumChain9CollectionIndexStorage<A,B,C,D,E,F,G,H,I>,
    rhs: SumChain9CollectionIndexStorage<A,B,C,D,E,F,G,H,I>) -> Bool {
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

  @usableFromInline
  internal static func >=(
    lhs: SumChain9CollectionIndexStorage<A,B,C,D,E,F,G,H,I>,
    rhs: SumChain9CollectionIndexStorage<A,B,C,D,E,F,G,H,I>) -> Bool {
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
// MARK: SumChain9CollectionIndexStorage - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension SumChain9CollectionIndexStorage : CustomStringConvertible {
  
  @usableFromInline
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
// MARK: SumChain9CollectionIndexStorage - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension SumChain9CollectionIndexStorage : CustomDebugStringConvertible {
  
  @usableFromInline
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
