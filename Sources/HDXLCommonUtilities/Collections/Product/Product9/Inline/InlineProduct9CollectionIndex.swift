//
//  InlineProduct9CollectionIndex.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: InlineProduct9CollectionIndex - Definition
// -------------------------------------------------------------------------- //

public struct InlineProduct9CollectionIndex<
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
  internal typealias Storage = InlineProduct9CollectionIndexStorage<A,B,C,D,E,F,G,H,I>
  
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
  internal static var endIndex: InlineProduct9CollectionIndex<A,B,C,D,E,F,G,H,I> {
    get {
      return InlineProduct9CollectionIndex<A,B,C,D,E,F,G,H,I>(
        storage: .end
      )
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct9CollectionIndex - Equatable
// -------------------------------------------------------------------------- //

extension InlineProduct9CollectionIndex : Equatable {
  
  @inlinable
  public static func ==(
    lhs: InlineProduct9CollectionIndex<A,B,C,D,E,F,G,H,I>,
    rhs: InlineProduct9CollectionIndex<A,B,C,D,E,F,G,H,I>) -> Bool {
    return lhs.storage == rhs.storage
  }
  
  @inlinable
  public static func !=(
    lhs: InlineProduct9CollectionIndex<A,B,C,D,E,F,G,H,I>,
    rhs: InlineProduct9CollectionIndex<A,B,C,D,E,F,G,H,I>) -> Bool {
    return lhs.storage != rhs.storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct9CollectionIndex - Comparable
// -------------------------------------------------------------------------- //

extension InlineProduct9CollectionIndex : Comparable {
  
  @inlinable
  public static func <(
    lhs: InlineProduct9CollectionIndex<A,B,C,D,E,F,G,H,I>,
    rhs: InlineProduct9CollectionIndex<A,B,C,D,E,F,G,H,I>) -> Bool {
    return lhs.storage < rhs.storage
  }
  
  
  @inlinable
  public static func >(
    lhs: InlineProduct9CollectionIndex<A,B,C,D,E,F,G,H,I>,
    rhs: InlineProduct9CollectionIndex<A,B,C,D,E,F,G,H,I>) -> Bool {
    return lhs.storage > rhs.storage
  }
  
  @inlinable
  public static func <=(
    lhs: InlineProduct9CollectionIndex<A,B,C,D,E,F,G,H,I>,
    rhs: InlineProduct9CollectionIndex<A,B,C,D,E,F,G,H,I>) -> Bool {
    return lhs.storage <= rhs.storage
  }
  
  @inlinable
  public static func >=(
    lhs: InlineProduct9CollectionIndex<A,B,C,D,E,F,G,H,I>,
    rhs: InlineProduct9CollectionIndex<A,B,C,D,E,F,G,H,I>) -> Bool {
    return lhs.storage >= rhs.storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct9CollectionIndexStorage - Definition
// -------------------------------------------------------------------------- //

@usableFromInline
internal enum InlineProduct9CollectionIndexStorage<
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
// MARK: InlineProduct9CollectionIndexStorage - Equatable
// -------------------------------------------------------------------------- //

extension InlineProduct9CollectionIndexStorage : Equatable {
  
  @usableFromInline
  internal static func ==(
    lhs: InlineProduct9CollectionIndexStorage<A,B,C,D,E,F,G,H,I>,
    rhs: InlineProduct9CollectionIndexStorage<A,B,C,D,E,F,G,H,I>) -> Bool {
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
    lhs: InlineProduct9CollectionIndexStorage<A,B,C,D,E,F,G,H,I>,
    rhs: InlineProduct9CollectionIndexStorage<A,B,C,D,E,F,G,H,I>) -> Bool {
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
// MARK: InlineProduct9CollectionIndexStorage - Comparable
// -------------------------------------------------------------------------- //

extension InlineProduct9CollectionIndexStorage : Comparable {
  
  @usableFromInline
  internal static func <(
    lhs: InlineProduct9CollectionIndexStorage<A,B,C,D,E,F,G,H,I>,
    rhs: InlineProduct9CollectionIndexStorage<A,B,C,D,E,F,G,H,I>) -> Bool {
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
    lhs: InlineProduct9CollectionIndexStorage<A,B,C,D,E,F,G,H,I>,
    rhs: InlineProduct9CollectionIndexStorage<A,B,C,D,E,F,G,H,I>) -> Bool {
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
    lhs: InlineProduct9CollectionIndexStorage<A,B,C,D,E,F,G,H,I>,
    rhs: InlineProduct9CollectionIndexStorage<A,B,C,D,E,F,G,H,I>) -> Bool {
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
    lhs: InlineProduct9CollectionIndexStorage<A,B,C,D,E,F,G,H,I>,
    rhs: InlineProduct9CollectionIndexStorage<A,B,C,D,E,F,G,H,I>) -> Bool {
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
