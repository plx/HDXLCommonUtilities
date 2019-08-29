//
//  FixedOptionalCollection9Index.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: FixedOptional9CollectionIndex - Definition
// -------------------------------------------------------------------------- //

public struct FixedOptional9CollectionIndex {
  
  @usableFromInline
  internal typealias Storage = FixedOptional9CollectionIndexStorage
  
  @usableFromInline
  internal var storage: Storage
  
  @inlinable
  internal init(storage: Storage) {
    self.storage = storage
  }
  
  @inlinable
  internal init(position: FixedOptional9CollectionPosition) {
    self.init(
      storage: Storage.position(position)
    )
  }
  
  @usableFromInline
  static let endIndex: FixedOptional9CollectionIndex = FixedOptional9CollectionIndex(
    storage: .endIndex
  )
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional9CollectionIndex - Equatable
// -------------------------------------------------------------------------- //

extension FixedOptional9CollectionIndex : Equatable {
  
  @inlinable
  public static func ==(
    lhs: FixedOptional9CollectionIndex,
    rhs: FixedOptional9CollectionIndex) -> Bool {
    return lhs.storage == rhs.storage
  }
  
  @inlinable
  public static func !=(
    lhs: FixedOptional9CollectionIndex,
    rhs: FixedOptional9CollectionIndex) -> Bool {
    return lhs.storage != rhs.storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional9CollectionIndex - Comparable
// -------------------------------------------------------------------------- //

extension FixedOptional9CollectionIndex : Comparable {
  
  @inlinable
  public static func <(
    lhs: FixedOptional9CollectionIndex,
    rhs: FixedOptional9CollectionIndex) -> Bool {
    return lhs.storage < rhs.storage
  }

  @inlinable
  public static func >(
    lhs: FixedOptional9CollectionIndex,
    rhs: FixedOptional9CollectionIndex) -> Bool {
    return lhs.storage > rhs.storage
  }

  @inlinable
  public static func <=(
    lhs: FixedOptional9CollectionIndex,
    rhs: FixedOptional9CollectionIndex) -> Bool {
    return lhs.storage <= rhs.storage
  }

  @inlinable
  public static func >=(
    lhs: FixedOptional9CollectionIndex,
    rhs: FixedOptional9CollectionIndex) -> Bool {
    return lhs.storage >= rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional9CollectionIndex - Hashable
// -------------------------------------------------------------------------- //

extension FixedOptional9CollectionIndex : Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional9CollectionIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional9CollectionIndex : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return self.storage.description
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional9CollectionIndex - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional9CollectionIndex : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "FixedOptional9CollectionIndex(storage: \(self.storage.debugDescription))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional9CollectionIndex - CaseIterable
// -------------------------------------------------------------------------- //

extension FixedOptional9CollectionIndex : CaseIterable {
  
  public typealias AllCases = [FixedOptional9CollectionIndex]
  
  public static let allCases: AllCases = [
    FixedOptional9CollectionIndex(storage: .position(.a)),
    FixedOptional9CollectionIndex(storage: .position(.b)),
    FixedOptional9CollectionIndex(storage: .position(.c)),
    FixedOptional9CollectionIndex(storage: .position(.d)),
    FixedOptional9CollectionIndex(storage: .position(.e)),
    FixedOptional9CollectionIndex(storage: .position(.f)),
    FixedOptional9CollectionIndex(storage: .position(.g)),
    FixedOptional9CollectionIndex(storage: .position(.h)),
    FixedOptional9CollectionIndex(storage: .position(.i)),
    FixedOptional9CollectionIndex(storage: .endIndex)
  ]
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional9CollectionPosition - Definition
// -------------------------------------------------------------------------- //

@usableFromInline
internal enum FixedOptional9CollectionPosition : UInt8 {
  
  case a = 0
  case b = 1
  case c = 2
  case d = 3
  case e = 4
  case f = 5
  case g = 6
  case h = 7
  case i = 8
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional9CollectionPosition - Comparable
// -------------------------------------------------------------------------- //

extension FixedOptional9CollectionPosition : Comparable {
  
  @inlinable
  internal static func <(
    lhs: FixedOptional9CollectionPosition,
    rhs: FixedOptional9CollectionPosition) -> Bool {
    return lhs.rawValue < rhs.rawValue
  }

  @inlinable
  internal static func >(
    lhs: FixedOptional9CollectionPosition,
    rhs: FixedOptional9CollectionPosition) -> Bool {
    return lhs.rawValue > rhs.rawValue
  }
  
  @inlinable
  internal static func <=(
    lhs: FixedOptional9CollectionPosition,
    rhs: FixedOptional9CollectionPosition) -> Bool {
    return lhs.rawValue <= rhs.rawValue
  }

  @inlinable
  internal static func >=(
    lhs: FixedOptional9CollectionPosition,
    rhs: FixedOptional9CollectionPosition) -> Bool {
    return lhs.rawValue >= rhs.rawValue
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional9CollectionPosition - Hashable
// -------------------------------------------------------------------------- //

extension FixedOptional9CollectionPosition : Hashable {
  
  @inlinable
  internal func hash(into hasher: inout Hasher) {
    self.rawValue.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional9CollectionPosition - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional9CollectionPosition : CustomStringConvertible {
  
  @inlinable
  internal var description: String {
    get {
      switch self {
      case .a:
        return ".a"
      case .b:
        return ".b"
      case .c:
        return ".c"
      case .d:
        return ".d"
      case .e:
        return ".e"
      case .f:
        return ".f"
      case .g:
        return ".g"
      case .h:
        return ".h"
      case .i:
        return ".i"
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional9CollectionPosition - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional9CollectionPosition : CustomDebugStringConvertible {
  
  @inlinable
  internal var debugDescription: String {
    get {
      switch self {
      case .a:
        return "FixedOptional9CollectionPosition.a"
      case .b:
        return "FixedOptional9CollectionPosition.b"
      case .c:
        return "FixedOptional9CollectionPosition.c"
      case .d:
        return "FixedOptional9CollectionPosition.d"
      case .e:
        return "FixedOptional9CollectionPosition.e"
      case .f:
        return "FixedOptional9CollectionPosition.f"
      case .g:
        return "FixedOptional9CollectionPosition.g"
      case .h:
        return "FixedOptional9CollectionPosition.h"
      case .i:
        return "FixedOptional9CollectionPosition.i"
      }
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional9CollectionPosition - CaseIterable
// -------------------------------------------------------------------------- //

extension FixedOptional9CollectionPosition : CaseIterable {
  
  @usableFromInline
  internal typealias AllCases = [FixedOptional9CollectionPosition]
  
  @usableFromInline
  internal static let allCases: AllCases = [
    .a,
    .b,
    .c,
    .d,
    .e,
    .f,
    .g,
    .h,
    .i
  ]
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional9CollectionIndexStorage - Definition
// -------------------------------------------------------------------------- //

@usableFromInline
internal enum FixedOptional9CollectionIndexStorage {
  
  case position(FixedOptional9CollectionPosition)
  case endIndex
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional9CollectionIndexStorage - Equatable
// -------------------------------------------------------------------------- //

extension FixedOptional9CollectionIndexStorage : Equatable {
  
  @inlinable
  internal static func ==(
    lhs: FixedOptional9CollectionIndexStorage,
    rhs: FixedOptional9CollectionIndexStorage) -> Bool {
    switch (lhs, rhs) {
    case (.position(let l), .position(let r)):
      return l == r
    case (.position(_), .endIndex):
      return false
    case (.endIndex, position(_)):
      return false
    case (.endIndex, .endIndex):
      return true
    }
  }
  
  @inlinable
  internal static func !=(
    lhs: FixedOptional9CollectionIndexStorage,
    rhs: FixedOptional9CollectionIndexStorage) -> Bool {
    switch (lhs, rhs) {
    case (.position(let l), .position(let r)):
      return l != r
    case (.position(_), .endIndex):
      return true
    case (.endIndex, position(_)):
      return true
    case (.endIndex, .endIndex):
      return false
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional9CollectionIndexStorage - Comparable
// -------------------------------------------------------------------------- //

extension FixedOptional9CollectionIndexStorage : Comparable {
  
  @inlinable
  internal static func <(
    lhs: FixedOptional9CollectionIndexStorage,
    rhs: FixedOptional9CollectionIndexStorage) -> Bool {
    switch (lhs, rhs) {
    case (.position(let l), .position(let r)):
      return l < r
    case (.position(_), .endIndex):
      return true
    case (.endIndex, position(_)):
      return false
    case (.endIndex, .endIndex):
      return false
    }
  }

  @inlinable
  internal static func >(
    lhs: FixedOptional9CollectionIndexStorage,
    rhs: FixedOptional9CollectionIndexStorage) -> Bool {
    switch (lhs, rhs) {
    case (.position(let l), .position(let r)):
      return l > r
    case (.position(_), .endIndex):
      return false
    case (.endIndex, position(_)):
      return true
    case (.endIndex, .endIndex):
      return false
    }
  }

  @inlinable
  internal static func <=(
    lhs: FixedOptional9CollectionIndexStorage,
    rhs: FixedOptional9CollectionIndexStorage) -> Bool {
    switch (lhs, rhs) {
    case (.position(let l), .position(let r)):
      return l <= r
    case (.position(_), .endIndex):
      return true
    case (.endIndex, position(_)):
      return false
    case (.endIndex, .endIndex):
      return true
    }
  }

  @inlinable
  internal static func >=(
    lhs: FixedOptional9CollectionIndexStorage,
    rhs: FixedOptional9CollectionIndexStorage) -> Bool {
    switch (lhs, rhs) {
    case (.position(let l), .position(let r)):
      return l >= r
    case (.position(_), .endIndex):
      return false
    case (.endIndex, position(_)):
      return true
    case (.endIndex, .endIndex):
      return true
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional9CollectionIndexStorage - Hashable
// -------------------------------------------------------------------------- //

extension FixedOptional9CollectionIndexStorage : Hashable {
  
  // synthesized ok? don't want to deal with the endIndex/position stuff for once
  @inlinable
  internal func hash(into hasher: inout Hasher) {
    switch self {
    case .position(let position):
      Int(0).hash(into: &hasher)
      position.hash(into: &hasher)
    case .endIndex:
      Int(1).hash(into: &hasher)
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional9CollectionIndexStorage - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional9CollectionIndexStorage : CustomStringConvertible {
  
  @inlinable
  internal var description: String {
    get {
      switch self {
      case .position(let position):
        return ".position(\(String(describing: position))"
      case .endIndex:
        return ".endIndex"
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional9CollectionIndexStorage - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional9CollectionIndexStorage : CustomDebugStringConvertible {
  
  @inlinable
  internal var debugDescription: String {
    get {
      switch self {
      case .position(let position):
        return "FixedOptional9CollectionIndexStorage.position(\(String(reflecting: position))"
      case .endIndex:
        return "FixedOptional9CollectionIndexStorage.endIndex"
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional9CollectionIndexStorage - CaseIterable
// -------------------------------------------------------------------------- //

extension FixedOptional9CollectionIndexStorage : CaseIterable {
  
  @usableFromInline
  internal typealias AllCases = [FixedOptional9CollectionIndexStorage]
  
  @usableFromInline
  internal static let allCases: AllCases = [
    .position(.a),
    .position(.b),
    .position(.c),
    .position(.d),
    .position(.e),
    .position(.f),
    .position(.g),
    .position(.h),
    .position(.i),
    .endIndex
  ]
  
}
