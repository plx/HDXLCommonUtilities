//
//  FixedOptionalCollection9Index.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: FixedOptional4CollectionIndex - Definition
// -------------------------------------------------------------------------- //

public struct FixedOptional4CollectionIndex {
  
  @usableFromInline
  internal typealias Storage = FixedOptional4CollectionIndexStorage
  
  @usableFromInline
  internal var storage: Storage
  
  @inlinable
  internal init(storage: Storage) {
    self.storage = storage
  }
  
  @inlinable
  internal init(position: FixedOptional4CollectionPosition) {
    self.init(
      storage: Storage.position(position)
    )
  }
  
  @usableFromInline
  static let endIndex: FixedOptional4CollectionIndex = FixedOptional4CollectionIndex(
    storage: .endIndex
  )
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional4CollectionIndex - Equatable
// -------------------------------------------------------------------------- //

extension FixedOptional4CollectionIndex : Equatable {
  
  @inlinable
  public static func ==(
    lhs: FixedOptional4CollectionIndex,
    rhs: FixedOptional4CollectionIndex) -> Bool {
    return lhs.storage == rhs.storage
  }
  
  @inlinable
  public static func !=(
    lhs: FixedOptional4CollectionIndex,
    rhs: FixedOptional4CollectionIndex) -> Bool {
    return lhs.storage != rhs.storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional4CollectionIndex - Comparable
// -------------------------------------------------------------------------- //

extension FixedOptional4CollectionIndex : Comparable {
  
  @inlinable
  public static func <(
    lhs: FixedOptional4CollectionIndex,
    rhs: FixedOptional4CollectionIndex) -> Bool {
    return lhs.storage < rhs.storage
  }

  @inlinable
  public static func >(
    lhs: FixedOptional4CollectionIndex,
    rhs: FixedOptional4CollectionIndex) -> Bool {
    return lhs.storage > rhs.storage
  }

  @inlinable
  public static func <=(
    lhs: FixedOptional4CollectionIndex,
    rhs: FixedOptional4CollectionIndex) -> Bool {
    return lhs.storage <= rhs.storage
  }

  @inlinable
  public static func >=(
    lhs: FixedOptional4CollectionIndex,
    rhs: FixedOptional4CollectionIndex) -> Bool {
    return lhs.storage >= rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional4CollectionIndex - Hashable
// -------------------------------------------------------------------------- //

extension FixedOptional4CollectionIndex : Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional4CollectionIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional4CollectionIndex : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return self.storage.description
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional4CollectionIndex - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional4CollectionIndex : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "FixedOptional4CollectionIndex(storage: \(self.storage.debugDescription))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional4CollectionIndex - CaseIterable
// -------------------------------------------------------------------------- //

extension FixedOptional4CollectionIndex : CaseIterable {
  
  public typealias AllCases = [FixedOptional4CollectionIndex]
  
  public static let allCases: AllCases = [
    FixedOptional4CollectionIndex(storage: .position(.a)),
    FixedOptional4CollectionIndex(storage: .position(.b)),
    FixedOptional4CollectionIndex(storage: .position(.c)),
    FixedOptional4CollectionIndex(storage: .position(.d)),
    FixedOptional4CollectionIndex(storage: .endIndex)
  ]
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional4CollectionPosition - Definition
// -------------------------------------------------------------------------- //

@usableFromInline
internal enum FixedOptional4CollectionPosition : UInt8 {
  
  case a = 0
  case b = 1
  case c = 2
  case d = 3
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional4CollectionPosition - Comparable
// -------------------------------------------------------------------------- //

extension FixedOptional4CollectionPosition : Comparable {
  
  @inlinable
  internal static func <(
    lhs: FixedOptional4CollectionPosition,
    rhs: FixedOptional4CollectionPosition) -> Bool {
    return lhs.rawValue < rhs.rawValue
  }

  @inlinable
  internal static func >(
    lhs: FixedOptional4CollectionPosition,
    rhs: FixedOptional4CollectionPosition) -> Bool {
    return lhs.rawValue > rhs.rawValue
  }
  
  @inlinable
  internal static func <=(
    lhs: FixedOptional4CollectionPosition,
    rhs: FixedOptional4CollectionPosition) -> Bool {
    return lhs.rawValue <= rhs.rawValue
  }

  @inlinable
  internal static func >=(
    lhs: FixedOptional4CollectionPosition,
    rhs: FixedOptional4CollectionPosition) -> Bool {
    return lhs.rawValue >= rhs.rawValue
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional4CollectionPosition - Hashable
// -------------------------------------------------------------------------- //

extension FixedOptional4CollectionPosition : Hashable {
  
  @inlinable
  internal func hash(into hasher: inout Hasher) {
    self.rawValue.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional4CollectionPosition - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional4CollectionPosition : CustomStringConvertible {
  
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
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional4CollectionPosition - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional4CollectionPosition : CustomDebugStringConvertible {
  
  @inlinable
  internal var debugDescription: String {
    get {
      switch self {
      case .a:
        return "FixedOptional4CollectionPosition.a"
      case .b:
        return "FixedOptional4CollectionPosition.b"
      case .c:
        return "FixedOptional4CollectionPosition.c"
      case .d:
        return "FixedOptional4CollectionPosition.d"
      }
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional4CollectionPosition - CaseIterable
// -------------------------------------------------------------------------- //

extension FixedOptional4CollectionPosition : CaseIterable {
  
  @usableFromInline
  internal typealias AllCases = [FixedOptional4CollectionPosition]
  
  @usableFromInline
  internal static let allCases: AllCases = [
    .a,
    .b,
    .c,
    .d
  ]
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional4CollectionIndexStorage - Definition
// -------------------------------------------------------------------------- //

@usableFromInline
internal enum FixedOptional4CollectionIndexStorage {
  
  case position(FixedOptional4CollectionPosition)
  case endIndex
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional4CollectionIndexStorage - Equatable
// -------------------------------------------------------------------------- //

extension FixedOptional4CollectionIndexStorage : Equatable {
  
  @inlinable
  internal static func ==(
    lhs: FixedOptional4CollectionIndexStorage,
    rhs: FixedOptional4CollectionIndexStorage) -> Bool {
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
    lhs: FixedOptional4CollectionIndexStorage,
    rhs: FixedOptional4CollectionIndexStorage) -> Bool {
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
// MARK: FixedOptional4CollectionIndexStorage - Comparable
// -------------------------------------------------------------------------- //

extension FixedOptional4CollectionIndexStorage : Comparable {
  
  @inlinable
  internal static func <(
    lhs: FixedOptional4CollectionIndexStorage,
    rhs: FixedOptional4CollectionIndexStorage) -> Bool {
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
    lhs: FixedOptional4CollectionIndexStorage,
    rhs: FixedOptional4CollectionIndexStorage) -> Bool {
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
    lhs: FixedOptional4CollectionIndexStorage,
    rhs: FixedOptional4CollectionIndexStorage) -> Bool {
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
    lhs: FixedOptional4CollectionIndexStorage,
    rhs: FixedOptional4CollectionIndexStorage) -> Bool {
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
// MARK: FixedOptional4CollectionIndexStorage - Hashable
// -------------------------------------------------------------------------- //

extension FixedOptional4CollectionIndexStorage : Hashable {
  
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
// MARK: FixedOptional4CollectionIndexStorage - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional4CollectionIndexStorage : CustomStringConvertible {
  
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
// MARK: FixedOptional4CollectionIndexStorage - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional4CollectionIndexStorage : CustomDebugStringConvertible {
  
  @inlinable
  internal var debugDescription: String {
    get {
      switch self {
      case .position(let position):
        return "FixedOptional4CollectionIndexStorage.position(\(String(reflecting: position))"
      case .endIndex:
        return "FixedOptional4CollectionIndexStorage.endIndex"
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional4CollectionIndexStorage - CaseIterable
// -------------------------------------------------------------------------- //

extension FixedOptional4CollectionIndexStorage : CaseIterable {
  
  @usableFromInline
  internal typealias AllCases = [FixedOptional4CollectionIndexStorage]
  
  @usableFromInline
  internal static let allCases: AllCases = [
    .position(.a),
    .position(.b),
    .position(.c),
    .position(.d),
    .endIndex
  ]
  
}
