//
//  FixedOptionalCollection9Index.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: FixedOptional7CollectionIndex - Definition
// -------------------------------------------------------------------------- //

public struct FixedOptional7CollectionIndex {
  
  @usableFromInline
  internal typealias Storage = FixedOptional7CollectionIndexStorage
  
  @usableFromInline
  internal var storage: Storage
  
  @inlinable
  internal init(storage: Storage) {
    self.storage = storage
  }
  
  @inlinable
  internal init(position: FixedOptional7CollectionPosition) {
    self.init(
      storage: Storage.position(position)
    )
  }
  
  @usableFromInline
  static let endIndex: FixedOptional7CollectionIndex = FixedOptional7CollectionIndex(
    storage: .endIndex
  )
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional7CollectionIndex - Equatable
// -------------------------------------------------------------------------- //

extension FixedOptional7CollectionIndex : Equatable {
  
  @inlinable
  public static func ==(
    lhs: FixedOptional7CollectionIndex,
    rhs: FixedOptional7CollectionIndex) -> Bool {
    return lhs.storage == rhs.storage
  }
  
  @inlinable
  public static func !=(
    lhs: FixedOptional7CollectionIndex,
    rhs: FixedOptional7CollectionIndex) -> Bool {
    return lhs.storage != rhs.storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional7CollectionIndex - Comparable
// -------------------------------------------------------------------------- //

extension FixedOptional7CollectionIndex : Comparable {
  
  @inlinable
  public static func <(
    lhs: FixedOptional7CollectionIndex,
    rhs: FixedOptional7CollectionIndex) -> Bool {
    return lhs.storage < rhs.storage
  }

  @inlinable
  public static func >(
    lhs: FixedOptional7CollectionIndex,
    rhs: FixedOptional7CollectionIndex) -> Bool {
    return lhs.storage > rhs.storage
  }

  @inlinable
  public static func <=(
    lhs: FixedOptional7CollectionIndex,
    rhs: FixedOptional7CollectionIndex) -> Bool {
    return lhs.storage <= rhs.storage
  }

  @inlinable
  public static func >=(
    lhs: FixedOptional7CollectionIndex,
    rhs: FixedOptional7CollectionIndex) -> Bool {
    return lhs.storage >= rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional7CollectionIndex - Hashable
// -------------------------------------------------------------------------- //

extension FixedOptional7CollectionIndex : Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional7CollectionIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional7CollectionIndex : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return self.storage.description
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional7CollectionIndex - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional7CollectionIndex : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "FixedOptional7CollectionIndex(storage: \(self.storage.debugDescription))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional7CollectionIndex - CaseIterable
// -------------------------------------------------------------------------- //

extension FixedOptional7CollectionIndex : CaseIterable {
  
  public typealias AllCases = [FixedOptional7CollectionIndex]
  
  public static let allCases: AllCases = [
    FixedOptional7CollectionIndex(storage: .position(.a)),
    FixedOptional7CollectionIndex(storage: .position(.b)),
    FixedOptional7CollectionIndex(storage: .position(.c)),
    FixedOptional7CollectionIndex(storage: .position(.d)),
    FixedOptional7CollectionIndex(storage: .position(.e)),
    FixedOptional7CollectionIndex(storage: .position(.f)),
    FixedOptional7CollectionIndex(storage: .position(.g)),
    FixedOptional7CollectionIndex(storage: .endIndex)
  ]
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional7CollectionPosition - Definition
// -------------------------------------------------------------------------- //

@usableFromInline
internal enum FixedOptional7CollectionPosition : UInt8 {
  
  case a = 0
  case b = 1
  case c = 2
  case d = 3
  case e = 4
  case f = 5
  case g = 6
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional7CollectionPosition - Comparable
// -------------------------------------------------------------------------- //

extension FixedOptional7CollectionPosition : Comparable {
  
  @inlinable
  internal static func <(
    lhs: FixedOptional7CollectionPosition,
    rhs: FixedOptional7CollectionPosition) -> Bool {
    return lhs.rawValue < rhs.rawValue
  }

  @inlinable
  internal static func >(
    lhs: FixedOptional7CollectionPosition,
    rhs: FixedOptional7CollectionPosition) -> Bool {
    return lhs.rawValue > rhs.rawValue
  }
  
  @inlinable
  internal static func <=(
    lhs: FixedOptional7CollectionPosition,
    rhs: FixedOptional7CollectionPosition) -> Bool {
    return lhs.rawValue <= rhs.rawValue
  }

  @inlinable
  internal static func >=(
    lhs: FixedOptional7CollectionPosition,
    rhs: FixedOptional7CollectionPosition) -> Bool {
    return lhs.rawValue >= rhs.rawValue
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional7CollectionPosition - Hashable
// -------------------------------------------------------------------------- //

extension FixedOptional7CollectionPosition : Hashable {
  
  @inlinable
  internal func hash(into hasher: inout Hasher) {
    self.rawValue.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional7CollectionPosition - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional7CollectionPosition : CustomStringConvertible {
  
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
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional7CollectionPosition - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional7CollectionPosition : CustomDebugStringConvertible {
  
  @inlinable
  internal var debugDescription: String {
    get {
      switch self {
      case .a:
        return "FixedOptional7CollectionPosition.a"
      case .b:
        return "FixedOptional7CollectionPosition.b"
      case .c:
        return "FixedOptional7CollectionPosition.c"
      case .d:
        return "FixedOptional7CollectionPosition.d"
      case .e:
        return "FixedOptional7CollectionPosition.e"
      case .f:
        return "FixedOptional7CollectionPosition.f"
      case .g:
        return "FixedOptional7CollectionPosition.g"
      }
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional7CollectionPosition - CaseIterable
// -------------------------------------------------------------------------- //

extension FixedOptional7CollectionPosition : CaseIterable {
  
  @usableFromInline
  internal typealias AllCases = [FixedOptional7CollectionPosition]
  
  @usableFromInline
  internal static let allCases: AllCases = [
    .a,
    .b,
    .c,
    .d,
    .e,
    .f,
    .g
  ]
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional7CollectionIndexStorage - Definition
// -------------------------------------------------------------------------- //

@usableFromInline
internal enum FixedOptional7CollectionIndexStorage {
  
  case position(FixedOptional7CollectionPosition)
  case endIndex
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional7CollectionIndexStorage - Equatable
// -------------------------------------------------------------------------- //

extension FixedOptional7CollectionIndexStorage : Equatable {
  
  @inlinable
  internal static func ==(
    lhs: FixedOptional7CollectionIndexStorage,
    rhs: FixedOptional7CollectionIndexStorage) -> Bool {
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
    lhs: FixedOptional7CollectionIndexStorage,
    rhs: FixedOptional7CollectionIndexStorage) -> Bool {
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
// MARK: FixedOptional7CollectionIndexStorage - Comparable
// -------------------------------------------------------------------------- //

extension FixedOptional7CollectionIndexStorage : Comparable {
  
  @inlinable
  internal static func <(
    lhs: FixedOptional7CollectionIndexStorage,
    rhs: FixedOptional7CollectionIndexStorage) -> Bool {
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
    lhs: FixedOptional7CollectionIndexStorage,
    rhs: FixedOptional7CollectionIndexStorage) -> Bool {
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
    lhs: FixedOptional7CollectionIndexStorage,
    rhs: FixedOptional7CollectionIndexStorage) -> Bool {
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
    lhs: FixedOptional7CollectionIndexStorage,
    rhs: FixedOptional7CollectionIndexStorage) -> Bool {
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
// MARK: FixedOptional7CollectionIndexStorage - Hashable
// -------------------------------------------------------------------------- //

extension FixedOptional7CollectionIndexStorage : Hashable {
  
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
// MARK: FixedOptional7CollectionIndexStorage - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional7CollectionIndexStorage : CustomStringConvertible {
  
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
// MARK: FixedOptional7CollectionIndexStorage - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional7CollectionIndexStorage : CustomDebugStringConvertible {
  
  @inlinable
  internal var debugDescription: String {
    get {
      switch self {
      case .position(let position):
        return "FixedOptional7CollectionIndexStorage.position(\(String(reflecting: position))"
      case .endIndex:
        return "FixedOptional7CollectionIndexStorage.endIndex"
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional7CollectionIndexStorage - CaseIterable
// -------------------------------------------------------------------------- //

extension FixedOptional7CollectionIndexStorage : CaseIterable {
  
  @usableFromInline
  internal typealias AllCases = [FixedOptional7CollectionIndexStorage]
  
  @usableFromInline
  internal static let allCases: AllCases = [
    .position(.a),
    .position(.b),
    .position(.c),
    .position(.d),
    .position(.e),
    .position(.f),
    .position(.g),
    .endIndex
  ]
  
}
