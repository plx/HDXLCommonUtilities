//
//  COWProduct9CollectionIndex.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: COWProduct9CollectionIndex - Definition
// -------------------------------------------------------------------------- //

public struct COWProduct9CollectionIndex<
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
  internal typealias Storage = COWProduct9CollectionIndexStorage<A,B,C,D,E,F,G,H,I>
  
  @usableFromInline
  internal typealias Position = Storage.Position
  
  @usableFromInline
  internal var storage: Storage
  
  @usableFromInline
  internal init(storage: Storage) {
    self.storage = storage
  }
  
  @usableFromInline
  internal init(position: Position) {
    self.init(
      storage: .position(position)
    )
  }
  
  @usableFromInline
  internal init(
    _ a: A.Index,
    _ b: B.Index,
    _ c: C.Index,
    _ d: D.Index,
    _ e: E.Index,
    _ f: F.Index,
    _ g: G.Index,
    _ h: H.Index,
    _ i: I.Index) {
    self.init(
      position: Position(
        a,
        b,
        c,
        d,
        e,
        f,
        g,
        h,
        i
      )
    )
  }
  
  @usableFromInline
  internal static var endIndex: COWProduct9CollectionIndex<A,B,C,D,E,F,G,H,I> {
    get {
      return COWProduct9CollectionIndex<A,B,C,D,E,F,G,H,I>(
        storage: .end
      )
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct9CollectionIndex - Equatable
// -------------------------------------------------------------------------- //

extension COWProduct9CollectionIndex : Equatable {
  
  @inlinable
  public static func ==(
    lhs: COWProduct9CollectionIndex<A,B,C,D,E,F,G,H,I>,
    rhs: COWProduct9CollectionIndex<A,B,C,D,E,F,G,H,I>) -> Bool {
    return lhs.storage == rhs.storage
  }
  
  @inlinable
  public static func !=(
    lhs: COWProduct9CollectionIndex<A,B,C,D,E,F,G,H,I>,
    rhs: COWProduct9CollectionIndex<A,B,C,D,E,F,G,H,I>) -> Bool {
    return lhs.storage != rhs.storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct9CollectionIndex - Comparable
// -------------------------------------------------------------------------- //

extension COWProduct9CollectionIndex : Comparable {
  
  @inlinable
  public static func <(
    lhs: COWProduct9CollectionIndex<A,B,C,D,E,F,G,H,I>,
    rhs: COWProduct9CollectionIndex<A,B,C,D,E,F,G,H,I>) -> Bool {
    return lhs.storage < rhs.storage
  }
  
  
  @inlinable
  public static func >(
    lhs: COWProduct9CollectionIndex<A,B,C,D,E,F,G,H,I>,
    rhs: COWProduct9CollectionIndex<A,B,C,D,E,F,G,H,I>) -> Bool {
    return lhs.storage > rhs.storage
  }
  
  @inlinable
  public static func <=(
    lhs: COWProduct9CollectionIndex<A,B,C,D,E,F,G,H,I>,
    rhs: COWProduct9CollectionIndex<A,B,C,D,E,F,G,H,I>) -> Bool {
    return lhs.storage <= rhs.storage
  }
  
  @inlinable
  public static func >=(
    lhs: COWProduct9CollectionIndex<A,B,C,D,E,F,G,H,I>,
    rhs: COWProduct9CollectionIndex<A,B,C,D,E,F,G,H,I>) -> Bool {
    return lhs.storage >= rhs.storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct9CollectionIndexStorage - Definition
// -------------------------------------------------------------------------- //

@usableFromInline
internal enum COWProduct9CollectionIndexStorage<
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
  typealias Position = COWProduct9<
    A.Index,
    B.Index,
    C.Index,
    D.Index,
    E.Index,
    F.Index,
    G.Index,
    H.Index,
    I.Index>
  
  case position(Position)
  case end
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct9CollectionIndexStorage - Equatable
// -------------------------------------------------------------------------- //

extension COWProduct9CollectionIndexStorage : Equatable {
  
  @usableFromInline
  internal static func ==(
    lhs: COWProduct9CollectionIndexStorage<A,B,C,D,E,F,G,H,I>,
    rhs: COWProduct9CollectionIndexStorage<A,B,C,D,E,F,G,H,I>) -> Bool {
    switch (lhs,rhs) {
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
    lhs: COWProduct9CollectionIndexStorage<A,B,C,D,E,F,G,H,I>,
    rhs: COWProduct9CollectionIndexStorage<A,B,C,D,E,F,G,H,I>) -> Bool {
    switch (lhs,rhs) {
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
// MARK: COWProduct9CollectionIndexStorage - Comparable
// -------------------------------------------------------------------------- //

extension COWProduct9CollectionIndexStorage : Comparable {
  
  @usableFromInline
  internal static func <(
    lhs: COWProduct9CollectionIndexStorage<A,B,C,D,E,F,G,H,I>,
    rhs: COWProduct9CollectionIndexStorage<A,B,C,D,E,F,G,H,I>) -> Bool {
    switch (lhs,rhs) {
    case (.position(let l), .position(let r)):
      return l < r
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
    lhs: COWProduct9CollectionIndexStorage<A,B,C,D,E,F,G,H,I>,
    rhs: COWProduct9CollectionIndexStorage<A,B,C,D,E,F,G,H,I>) -> Bool {
    switch (lhs,rhs) {
    case (.position(let l), .position(let r)):
      return l > r
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
    lhs: COWProduct9CollectionIndexStorage<A,B,C,D,E,F,G,H,I>,
    rhs: COWProduct9CollectionIndexStorage<A,B,C,D,E,F,G,H,I>) -> Bool {
    switch (lhs,rhs) {
    case (.position(let l), .position(let r)):
      return l <= r
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
    lhs: COWProduct9CollectionIndexStorage<A,B,C,D,E,F,G,H,I>,
    rhs: COWProduct9CollectionIndexStorage<A,B,C,D,E,F,G,H,I>) -> Bool {
    switch (lhs,rhs) {
    case (.position(let l), .position(let r)):
      return l >= r
    case (.position(_), .end):
      return false
    case (.end, .position(_)):
      return true
    case (.end, .end):
      return true
    }
  }
  
}
