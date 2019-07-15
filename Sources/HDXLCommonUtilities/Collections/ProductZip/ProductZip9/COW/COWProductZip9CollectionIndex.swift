//
//  COWProductZip9CollectionIndex.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: COWProductZip9CollectionIndex - Definition
// -------------------------------------------------------------------------- //

/// Index for the 9-way "product zip" collection.
public struct COWProductZip9CollectionIndex<
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
  internal typealias Storage = COWProductZip9CollectionIndexStorage<A,B,C,D,E,F,G,H,I>

  @usableFromInline
  internal typealias Position = Storage.Position

  @usableFromInline
  internal var linearPosition: Int

  @usableFromInline
  internal var storage: Storage
  
  @usableFromInline
  init(
    linearPosition: Int,
    storage: Storage) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(storage.isValid)
    pedantic_assert(linearPosition >= 0)
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self.storage = storage
    self.linearPosition = linearPosition
  }

  @usableFromInline
  init(
    linearPosition: Int,
    position: Position) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(position.isValid)
    pedantic_assert(linearPosition >= 0)
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self.init(
      linearPosition: linearPosition,
      storage: .position(position)
    )
  }

  @usableFromInline
  init(forEndIndexWithCount count: Int) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(count >= 0)
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self.init(
      linearPosition: count,
      storage: .end
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProductZip9CollectionIndex - Reflection Support
// -------------------------------------------------------------------------- //

internal extension COWProductZip9CollectionIndex {
  
  @usableFromInline
  static var shortTypeName: String {
    get {
      return "COWProductZip9CollectionIndex"
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
// MARK: COWProductZip9CollectionIndex - Validatable
// -------------------------------------------------------------------------- //

extension COWProductZip9CollectionIndex : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      guard
        self.storage.isValid,
        self.linearPosition >= 0 else {
          return false
      }
      return true
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProductZip9CollectionIndex - Equatable
// -------------------------------------------------------------------------- //

extension COWProductZip9CollectionIndex : Equatable {
  
  @inlinable
  public static func ==(
    lhs: COWProductZip9CollectionIndex<A,B,C,D,E,F,G,H,I>,
    rhs: COWProductZip9CollectionIndex<A,B,C,D,E,F,G,H,I>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    guard
      lhs.linearPosition == rhs.linearPosition,
      lhs.storage == rhs.storage else {
        return false
    }
    return true
  }

  @inlinable
  public static func !=(
    lhs: COWProductZip9CollectionIndex<A,B,C,D,E,F,G,H,I>,
    rhs: COWProductZip9CollectionIndex<A,B,C,D,E,F,G,H,I>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    guard
      lhs.linearPosition == rhs.linearPosition,
      lhs.storage == rhs.storage else {
        return true
    }
    return false
  }

}

// -------------------------------------------------------------------------- //
// MARK: COWProductZip9CollectionIndex - Comparable
// -------------------------------------------------------------------------- //

extension COWProductZip9CollectionIndex : Comparable {
  
  @inlinable
  public static func <(
    lhs: COWProductZip9CollectionIndex<A,B,C,D,E,F,G,H,I>,
    rhs: COWProductZip9CollectionIndex<A,B,C,D,E,F,G,H,I>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.linearPosition < rhs.linearPosition
  }

  @inlinable
  public static func >(
    lhs: COWProductZip9CollectionIndex<A,B,C,D,E,F,G,H,I>,
    rhs: COWProductZip9CollectionIndex<A,B,C,D,E,F,G,H,I>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.linearPosition > rhs.linearPosition
  }

  @inlinable
  public static func <=(
    lhs: COWProductZip9CollectionIndex<A,B,C,D,E,F,G,H,I>,
    rhs: COWProductZip9CollectionIndex<A,B,C,D,E,F,G,H,I>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.linearPosition <= rhs.linearPosition
  }

  @inlinable
  public static func >=(
    lhs: COWProductZip9CollectionIndex<A,B,C,D,E,F,G,H,I>,
    rhs: COWProductZip9CollectionIndex<A,B,C,D,E,F,G,H,I>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.linearPosition >= rhs.linearPosition
  }

}

// -------------------------------------------------------------------------- //
// MARK: COWProductZip9CollectionIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension COWProductZip9CollectionIndex : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "linearPosition: \(self.linearPosition), storage: \(self.storage.description)"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProductZip9CollectionIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension COWProductZip9CollectionIndex : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(linearPosition: \(self.linearPosition), storage: \(self.storage.debugDescription))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProductZip9CollectionIndexStorage - Definition
// -------------------------------------------------------------------------- //

@usableFromInline
internal enum COWProductZip9CollectionIndexStorage<
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
  internal typealias Position = COWProduct9<
    A.Index,
    B.Index,
    C.Index,
    D.Index,
    E.Index,
    F.Index,
    G.Index,
    H.Index,
    I.Index
  >
  
  case position(Position)
  case end
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProductZip9CollectionIndexStorage - Reflection Support
// -------------------------------------------------------------------------- //

internal extension COWProductZip9CollectionIndexStorage {
  
  @usableFromInline
  static var shortTypeName: String {
    get {
      return "COWProductZip9CollectionIndexStorage"
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
// MARK: COWProductZip9CollectionIndexStorage - Validatable
// -------------------------------------------------------------------------- //

extension COWProductZip9CollectionIndexStorage : Validatable {
  
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
// MARK: COWProductZip9CollectionIndexStorage - Equatable
// -------------------------------------------------------------------------- //

extension COWProductZip9CollectionIndexStorage : Equatable {
  
  @usableFromInline
  internal static func ==(
    lhs: COWProductZip9CollectionIndexStorage<A,B,C,D,E,F,G,H,I>,
    rhs: COWProductZip9CollectionIndexStorage<A,B,C,D,E,F,G,H,I>) -> Bool {
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
    lhs: COWProductZip9CollectionIndexStorage<A,B,C,D,E,F,G,H,I>,
    rhs: COWProductZip9CollectionIndexStorage<A,B,C,D,E,F,G,H,I>) -> Bool {
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
// MARK: COWProductZip9CollectionIndexStorage - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension COWProductZip9CollectionIndexStorage : CustomStringConvertible {
  
  @inlinable
  public var description: String {
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
// MARK: COWProductZip9CollectionIndexStorage - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension COWProductZip9CollectionIndexStorage : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
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
