//
//  SumChain4CollectionIndex.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: SumChain4CollectionIndex - Definition
// -------------------------------------------------------------------------- //

public struct SumChain4CollectionIndex<
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection> {
  
  @usableFromInline
  internal typealias Storage = SumChain4CollectionIndexStorage<A,B,C,D>

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
  internal static var endIndex: SumChain4CollectionIndex<A,B,C,D> {
    get {
      return SumChain4CollectionIndex<A,B,C,D>(
        storage: .end
      )
    }
  }
}

// -------------------------------------------------------------------------- //
// MARK: SumChain4CollectionIndex - Componentwise Constructors
// -------------------------------------------------------------------------- //

internal extension SumChain4CollectionIndex {
  
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

}

// -------------------------------------------------------------------------- //
// MARK: SumChain4CollectionIndex - Reflection Support
// -------------------------------------------------------------------------- //

internal extension SumChain4CollectionIndex {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "SumChain4CollectionIndex"
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
        String(reflecting: D.self)
        ].joined(separator: ", ")
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain4CollectionIndex - Validatable
// -------------------------------------------------------------------------- //

extension SumChain4CollectionIndex : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      return self.storage.isValid
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain4CollectionIndex - Equatable
// -------------------------------------------------------------------------- //

extension SumChain4CollectionIndex : Equatable {
  
  @inlinable
  public static func ==(
    lhs: SumChain4CollectionIndex<A,B,C,D>,
    rhs: SumChain4CollectionIndex<A,B,C,D>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage == rhs.storage
  }

  @inlinable
  public static func !=(
    lhs: SumChain4CollectionIndex<A,B,C,D>,
    rhs: SumChain4CollectionIndex<A,B,C,D>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage != rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: SumChain4CollectionIndex - Comparable
// -------------------------------------------------------------------------- //

extension SumChain4CollectionIndex : Comparable {
  
  @inlinable
  public static func <(
    lhs: SumChain4CollectionIndex<A,B,C,D>,
    rhs: SumChain4CollectionIndex<A,B,C,D>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage < rhs.storage
  }
  
  @inlinable
  public static func >(
    lhs: SumChain4CollectionIndex<A,B,C,D>,
    rhs: SumChain4CollectionIndex<A,B,C,D>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage > rhs.storage
  }
  
  @inlinable
  public static func <=(
    lhs: SumChain4CollectionIndex<A,B,C,D>,
    rhs: SumChain4CollectionIndex<A,B,C,D>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage <= rhs.storage
  }

  @inlinable
  public static func >=(
    lhs: SumChain4CollectionIndex<A,B,C,D>,
    rhs: SumChain4CollectionIndex<A,B,C,D>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage >= rhs.storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain4CollectionIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension SumChain4CollectionIndex : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return self.storage.description
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain4CollectionIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension SumChain4CollectionIndex : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(storage: \(String(reflecting: self.storage)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain4CollectionIndexStorage - Definition
// -------------------------------------------------------------------------- //

@usableFromInline
internal enum SumChain4CollectionIndexStorage<
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection> {
  
  @usableFromInline
  internal typealias Position = Sum4<A.Index,B.Index,C.Index,D.Index>
  
  case position(Position)
  case end

}

// -------------------------------------------------------------------------- //
// MARK: SumChain4CollectionIndexStorage - Reflection Support
// -------------------------------------------------------------------------- //

internal extension SumChain4CollectionIndexStorage {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "SumChain4CollectionIndexStorage"
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
        String(reflecting: D.self)
        ].joined(separator: ", ")
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain4CollectionIndexStorage - Validatable
// -------------------------------------------------------------------------- //

extension SumChain4CollectionIndexStorage : Validatable {
  
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
// MARK: SumChain4CollectionIndexStorage - Equatable
// -------------------------------------------------------------------------- //

extension SumChain4CollectionIndexStorage : Equatable {
  
  @inlinable
  internal static func ==(
    lhs: SumChain4CollectionIndexStorage<A,B,C,D>,
    rhs: SumChain4CollectionIndexStorage<A,B,C,D>) -> Bool {
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
    lhs: SumChain4CollectionIndexStorage<A,B,C,D>,
    rhs: SumChain4CollectionIndexStorage<A,B,C,D>) -> Bool {
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
// MARK: SumChain4CollectionIndexStorage - Comparable
// -------------------------------------------------------------------------- //

extension SumChain4CollectionIndexStorage : Comparable {
  
  @inlinable
  internal static func <(
    lhs: SumChain4CollectionIndexStorage<A,B,C,D>,
    rhs: SumChain4CollectionIndexStorage<A,B,C,D>) -> Bool {
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
    lhs: SumChain4CollectionIndexStorage<A,B,C,D>,
    rhs: SumChain4CollectionIndexStorage<A,B,C,D>) -> Bool {
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
    lhs: SumChain4CollectionIndexStorage<A,B,C,D>,
    rhs: SumChain4CollectionIndexStorage<A,B,C,D>) -> Bool {
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
    lhs: SumChain4CollectionIndexStorage<A,B,C,D>,
    rhs: SumChain4CollectionIndexStorage<A,B,C,D>) -> Bool {
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
// MARK: SumChain4CollectionIndexStorage - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension SumChain4CollectionIndexStorage : CustomStringConvertible {
  
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
// MARK: SumChain4CollectionIndexStorage - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension SumChain4CollectionIndexStorage : CustomDebugStringConvertible {
  
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
