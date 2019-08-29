//
//  SumChain2CollectionIndex.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: SumChain2CollectionIndex - Definition
// -------------------------------------------------------------------------- //

public struct SumChain2CollectionIndex<
  A:Collection,
  B:Collection> {
  
  @usableFromInline
  internal typealias Storage = SumChain2CollectionIndexStorage<A,B>

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
  internal static var endIndex: SumChain2CollectionIndex<A,B> {
    get {
      return SumChain2CollectionIndex<A,B>(
        storage: .end
      )
    }
  }
}

// -------------------------------------------------------------------------- //
// MARK: SumChain2CollectionIndex - Componentwise Constructors
// -------------------------------------------------------------------------- //

internal extension SumChain2CollectionIndex {
  
  @inlinable
  init(a: A.Index) {
    self.init(position: .a(a))
  }

  @inlinable
  init(b: B.Index) {
    self.init(position: .b(b))
  }

}

// -------------------------------------------------------------------------- //
// MARK: SumChain2CollectionIndex - Reflection Support
// -------------------------------------------------------------------------- //

internal extension SumChain2CollectionIndex {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "SumChain2CollectionIndex"
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
        String(reflecting: B.self)
        ].joined(separator: ", ")
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain2CollectionIndex - Validatable
// -------------------------------------------------------------------------- //

extension SumChain2CollectionIndex : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      return self.storage.isValid
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain2CollectionIndex - Equatable
// -------------------------------------------------------------------------- //

extension SumChain2CollectionIndex : Equatable {
  
  @inlinable
  public static func ==(
    lhs: SumChain2CollectionIndex<A,B>,
    rhs: SumChain2CollectionIndex<A,B>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage == rhs.storage
  }

  @inlinable
  public static func !=(
    lhs: SumChain2CollectionIndex<A,B>,
    rhs: SumChain2CollectionIndex<A,B>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage != rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: SumChain2CollectionIndex - Comparable
// -------------------------------------------------------------------------- //

extension SumChain2CollectionIndex : Comparable {
  
  @inlinable
  public static func <(
    lhs: SumChain2CollectionIndex<A,B>,
    rhs: SumChain2CollectionIndex<A,B>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage < rhs.storage
  }
  
  @inlinable
  public static func >(
    lhs: SumChain2CollectionIndex<A,B>,
    rhs: SumChain2CollectionIndex<A,B>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage > rhs.storage
  }
  
  @inlinable
  public static func <=(
    lhs: SumChain2CollectionIndex<A,B>,
    rhs: SumChain2CollectionIndex<A,B>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage <= rhs.storage
  }

  @inlinable
  public static func >=(
    lhs: SumChain2CollectionIndex<A,B>,
    rhs: SumChain2CollectionIndex<A,B>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage >= rhs.storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain2CollectionIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension SumChain2CollectionIndex : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return self.storage.description
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain2CollectionIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension SumChain2CollectionIndex : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(storage: \(String(reflecting: self.storage)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain2CollectionIndexStorage - Definition
// -------------------------------------------------------------------------- //

@usableFromInline
internal enum SumChain2CollectionIndexStorage<
  A:Collection,
  B:Collection> {
  
  @usableFromInline
  internal typealias Position = Sum2<A.Index,B.Index>
  
  case position(Position)
  case end

}

// -------------------------------------------------------------------------- //
// MARK: SumChain2CollectionIndexStorage - Reflection Support
// -------------------------------------------------------------------------- //

internal extension SumChain2CollectionIndexStorage {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "SumChain2CollectionIndexStorage"
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
        String(reflecting: B.self)
        ].joined(separator: ", ")
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain2CollectionIndexStorage - Validatable
// -------------------------------------------------------------------------- //

extension SumChain2CollectionIndexStorage : Validatable {
  
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
// MARK: SumChain2CollectionIndexStorage - Equatable
// -------------------------------------------------------------------------- //

extension SumChain2CollectionIndexStorage : Equatable {
  
  @inlinable
  internal static func ==(
    lhs: SumChain2CollectionIndexStorage<A,B>,
    rhs: SumChain2CollectionIndexStorage<A,B>) -> Bool {
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
    lhs: SumChain2CollectionIndexStorage<A,B>,
    rhs: SumChain2CollectionIndexStorage<A,B>) -> Bool {
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
// MARK: SumChain2CollectionIndexStorage - Comparable
// -------------------------------------------------------------------------- //

extension SumChain2CollectionIndexStorage : Comparable {
  
  @inlinable
  internal static func <(
    lhs: SumChain2CollectionIndexStorage<A,B>,
    rhs: SumChain2CollectionIndexStorage<A,B>) -> Bool {
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
    lhs: SumChain2CollectionIndexStorage<A,B>,
    rhs: SumChain2CollectionIndexStorage<A,B>) -> Bool {
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
    lhs: SumChain2CollectionIndexStorage<A,B>,
    rhs: SumChain2CollectionIndexStorage<A,B>) -> Bool {
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
    lhs: SumChain2CollectionIndexStorage<A,B>,
    rhs: SumChain2CollectionIndexStorage<A,B>) -> Bool {
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
// MARK: SumChain2CollectionIndexStorage - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension SumChain2CollectionIndexStorage : CustomStringConvertible {
  
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
// MARK: SumChain2CollectionIndexStorage - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension SumChain2CollectionIndexStorage : CustomDebugStringConvertible {
  
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
