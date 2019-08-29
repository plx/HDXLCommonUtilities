//
//  FixedOptionalCollection9Index.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: FixedOptional3CollectionIndex - Definition
// -------------------------------------------------------------------------- //

public struct FixedOptional3CollectionIndex {
  
  @usableFromInline
  internal typealias Storage = FixedOptional3CollectionIndexStorage
  
  @usableFromInline
  internal var storage: Storage
  
  @inlinable
  internal init(storage: Storage) {
    self.storage = storage
  }
  
  @inlinable
  internal init(position: FixedOptional3CollectionPosition) {
    self.init(
      storage: Storage.position(position)
    )
  }
  
  @usableFromInline
  static let endIndex: FixedOptional3CollectionIndex = FixedOptional3CollectionIndex(
    storage: .endIndex
  )
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional3CollectionIndex - Equatable
// -------------------------------------------------------------------------- //

extension FixedOptional3CollectionIndex : Equatable {
  
  @inlinable
  public static func ==(
    lhs: FixedOptional3CollectionIndex,
    rhs: FixedOptional3CollectionIndex) -> Bool {
    return lhs.storage == rhs.storage
  }
  
  @inlinable
  public static func !=(
    lhs: FixedOptional3CollectionIndex,
    rhs: FixedOptional3CollectionIndex) -> Bool {
    return lhs.storage != rhs.storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional3CollectionIndex - Comparable
// -------------------------------------------------------------------------- //

extension FixedOptional3CollectionIndex : Comparable {
  
  @inlinable
  public static func <(
    lhs: FixedOptional3CollectionIndex,
    rhs: FixedOptional3CollectionIndex) -> Bool {
    return lhs.storage < rhs.storage
  }

  @inlinable
  public static func >(
    lhs: FixedOptional3CollectionIndex,
    rhs: FixedOptional3CollectionIndex) -> Bool {
    return lhs.storage > rhs.storage
  }

  @inlinable
  public static func <=(
    lhs: FixedOptional3CollectionIndex,
    rhs: FixedOptional3CollectionIndex) -> Bool {
    return lhs.storage <= rhs.storage
  }

  @inlinable
  public static func >=(
    lhs: FixedOptional3CollectionIndex,
    rhs: FixedOptional3CollectionIndex) -> Bool {
    return lhs.storage >= rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional3CollectionIndex - Hashable
// -------------------------------------------------------------------------- //

extension FixedOptional3CollectionIndex : Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional3CollectionIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional3CollectionIndex : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return self.storage.description
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional3CollectionIndex - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional3CollectionIndex : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "FixedOptional3CollectionIndex(storage: \(self.storage.debugDescription))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional3CollectionIndex - CaseIterable
// -------------------------------------------------------------------------- //

extension FixedOptional3CollectionIndex : CaseIterable {
  
  public typealias AllCases = [FixedOptional3CollectionIndex]
  
  public static let allCases: AllCases = [
    FixedOptional3CollectionIndex(storage: .position(.a)),
    FixedOptional3CollectionIndex(storage: .position(.b)),
    FixedOptional3CollectionIndex(storage: .position(.c)),
    FixedOptional3CollectionIndex(storage: .endIndex)
  ]
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional3CollectionPosition - Definition
// -------------------------------------------------------------------------- //

@usableFromInline
internal enum FixedOptional3CollectionPosition : UInt8 {
  
  case a = 0
  case b = 1
  case c = 2
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional3CollectionPosition - Comparable
// -------------------------------------------------------------------------- //

extension FixedOptional3CollectionPosition : Comparable {
  
  @inlinable
  internal static func <(
    lhs: FixedOptional3CollectionPosition,
    rhs: FixedOptional3CollectionPosition) -> Bool {
    return lhs.rawValue < rhs.rawValue
  }

  @inlinable
  internal static func >(
    lhs: FixedOptional3CollectionPosition,
    rhs: FixedOptional3CollectionPosition) -> Bool {
    return lhs.rawValue > rhs.rawValue
  }
  
  @inlinable
  internal static func <=(
    lhs: FixedOptional3CollectionPosition,
    rhs: FixedOptional3CollectionPosition) -> Bool {
    return lhs.rawValue <= rhs.rawValue
  }

  @inlinable
  internal static func >=(
    lhs: FixedOptional3CollectionPosition,
    rhs: FixedOptional3CollectionPosition) -> Bool {
    return lhs.rawValue >= rhs.rawValue
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional3CollectionPosition - Hashable
// -------------------------------------------------------------------------- //

extension FixedOptional3CollectionPosition : Hashable {
  
  @inlinable
  internal func hash(into hasher: inout Hasher) {
    self.rawValue.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional3CollectionPosition - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional3CollectionPosition : CustomStringConvertible {
  
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
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional3CollectionPosition - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional3CollectionPosition : CustomDebugStringConvertible {
  
  @inlinable
  internal var debugDescription: String {
    get {
      switch self {
      case .a:
        return "FixedOptional3CollectionPosition.a"
      case .b:
        return "FixedOptional3CollectionPosition.b"
      case .c:
        return "FixedOptional3CollectionPosition.c"
      }
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional3CollectionPosition - CaseIterable
// -------------------------------------------------------------------------- //

extension FixedOptional3CollectionPosition : CaseIterable {
  
  @usableFromInline
  internal typealias AllCases = [FixedOptional3CollectionPosition]
  
  @usableFromInline
  internal static let allCases: AllCases = [
    .a,
    .b,
    .c
  ]
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional3CollectionIndexStorage - Definition
// -------------------------------------------------------------------------- //

@usableFromInline
internal enum FixedOptional3CollectionIndexStorage {
  
  case position(FixedOptional3CollectionPosition)
  case endIndex
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional3CollectionIndexStorage - Equatable
// -------------------------------------------------------------------------- //

extension FixedOptional3CollectionIndexStorage : Equatable {
  
  @inlinable
  internal static func ==(
    lhs: FixedOptional3CollectionIndexStorage,
    rhs: FixedOptional3CollectionIndexStorage) -> Bool {
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
    lhs: FixedOptional3CollectionIndexStorage,
    rhs: FixedOptional3CollectionIndexStorage) -> Bool {
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
// MARK: FixedOptional3CollectionIndexStorage - Comparable
// -------------------------------------------------------------------------- //

extension FixedOptional3CollectionIndexStorage : Comparable {
  
  @inlinable
  internal static func <(
    lhs: FixedOptional3CollectionIndexStorage,
    rhs: FixedOptional3CollectionIndexStorage) -> Bool {
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
    lhs: FixedOptional3CollectionIndexStorage,
    rhs: FixedOptional3CollectionIndexStorage) -> Bool {
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
    lhs: FixedOptional3CollectionIndexStorage,
    rhs: FixedOptional3CollectionIndexStorage) -> Bool {
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
    lhs: FixedOptional3CollectionIndexStorage,
    rhs: FixedOptional3CollectionIndexStorage) -> Bool {
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
// MARK: FixedOptional3CollectionIndexStorage - Hashable
// -------------------------------------------------------------------------- //

extension FixedOptional3CollectionIndexStorage : Hashable {
  
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
// MARK: FixedOptional3CollectionIndexStorage - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional3CollectionIndexStorage : CustomStringConvertible {
  
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
// MARK: FixedOptional3CollectionIndexStorage - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional3CollectionIndexStorage : CustomDebugStringConvertible {
  
  @inlinable
  internal var debugDescription: String {
    get {
      switch self {
      case .position(let position):
        return "FixedOptional3CollectionIndexStorage.position(\(String(reflecting: position))"
      case .endIndex:
        return "FixedOptional3CollectionIndexStorage.endIndex"
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional3CollectionIndexStorage - CaseIterable
// -------------------------------------------------------------------------- //

extension FixedOptional3CollectionIndexStorage : CaseIterable {
  
  @usableFromInline
  internal typealias AllCases = [FixedOptional3CollectionIndexStorage]
  
  @usableFromInline
  internal static let allCases: AllCases = [
    .position(.a),
    .position(.b),
    .position(.c),
    .endIndex
  ]
  
}
