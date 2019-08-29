//
//  FixedOptionalCollection9Index.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: FixedOptional2CollectionIndex - Definition
// -------------------------------------------------------------------------- //

public struct FixedOptional2CollectionIndex {
  
  @usableFromInline
  internal typealias Storage = FixedOptional2CollectionIndexStorage
  
  @usableFromInline
  internal var storage: Storage
  
  @inlinable
  internal init(storage: Storage) {
    self.storage = storage
  }
  
  @inlinable
  internal init(position: FixedOptional2CollectionPosition) {
    self.init(
      storage: Storage.position(position)
    )
  }
  
  @usableFromInline
  static let endIndex: FixedOptional2CollectionIndex = FixedOptional2CollectionIndex(
    storage: .endIndex
  )
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional2CollectionIndex - Equatable
// -------------------------------------------------------------------------- //

extension FixedOptional2CollectionIndex : Equatable {
  
  @inlinable
  public static func ==(
    lhs: FixedOptional2CollectionIndex,
    rhs: FixedOptional2CollectionIndex) -> Bool {
    return lhs.storage == rhs.storage
  }
  
  @inlinable
  public static func !=(
    lhs: FixedOptional2CollectionIndex,
    rhs: FixedOptional2CollectionIndex) -> Bool {
    return lhs.storage != rhs.storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional2CollectionIndex - Comparable
// -------------------------------------------------------------------------- //

extension FixedOptional2CollectionIndex : Comparable {
  
  @inlinable
  public static func <(
    lhs: FixedOptional2CollectionIndex,
    rhs: FixedOptional2CollectionIndex) -> Bool {
    return lhs.storage < rhs.storage
  }

  @inlinable
  public static func >(
    lhs: FixedOptional2CollectionIndex,
    rhs: FixedOptional2CollectionIndex) -> Bool {
    return lhs.storage > rhs.storage
  }

  @inlinable
  public static func <=(
    lhs: FixedOptional2CollectionIndex,
    rhs: FixedOptional2CollectionIndex) -> Bool {
    return lhs.storage <= rhs.storage
  }

  @inlinable
  public static func >=(
    lhs: FixedOptional2CollectionIndex,
    rhs: FixedOptional2CollectionIndex) -> Bool {
    return lhs.storage >= rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional2CollectionIndex - Hashable
// -------------------------------------------------------------------------- //

extension FixedOptional2CollectionIndex : Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional2CollectionIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional2CollectionIndex : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return self.storage.description
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional2CollectionIndex - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional2CollectionIndex : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "FixedOptional2CollectionIndex(storage: \(self.storage.debugDescription))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional2CollectionIndex - CaseIterable
// -------------------------------------------------------------------------- //

extension FixedOptional2CollectionIndex : CaseIterable {
  
  public typealias AllCases = [FixedOptional2CollectionIndex]
  
  public static let allCases: AllCases = [
    FixedOptional2CollectionIndex(storage: .position(.a)),
    FixedOptional2CollectionIndex(storage: .position(.b)),
    FixedOptional2CollectionIndex(storage: .endIndex)
  ]
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional2CollectionPosition - Definition
// -------------------------------------------------------------------------- //

@usableFromInline
internal enum FixedOptional2CollectionPosition : UInt8 {
  
  case a = 0
  case b = 1
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional2CollectionPosition - Comparable
// -------------------------------------------------------------------------- //

extension FixedOptional2CollectionPosition : Comparable {
  
  @inlinable
  internal static func <(
    lhs: FixedOptional2CollectionPosition,
    rhs: FixedOptional2CollectionPosition) -> Bool {
    return lhs.rawValue < rhs.rawValue
  }

  @inlinable
  internal static func >(
    lhs: FixedOptional2CollectionPosition,
    rhs: FixedOptional2CollectionPosition) -> Bool {
    return lhs.rawValue > rhs.rawValue
  }
  
  @inlinable
  internal static func <=(
    lhs: FixedOptional2CollectionPosition,
    rhs: FixedOptional2CollectionPosition) -> Bool {
    return lhs.rawValue <= rhs.rawValue
  }

  @inlinable
  internal static func >=(
    lhs: FixedOptional2CollectionPosition,
    rhs: FixedOptional2CollectionPosition) -> Bool {
    return lhs.rawValue >= rhs.rawValue
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional2CollectionPosition - Hashable
// -------------------------------------------------------------------------- //

extension FixedOptional2CollectionPosition : Hashable {
  
  @inlinable
  internal func hash(into hasher: inout Hasher) {
    self.rawValue.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional2CollectionPosition - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional2CollectionPosition : CustomStringConvertible {
  
  @inlinable
  internal var description: String {
    get {
      switch self {
      case .a:
        return ".a"
      case .b:
        return ".b"
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional2CollectionPosition - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional2CollectionPosition : CustomDebugStringConvertible {
  
  @inlinable
  internal var debugDescription: String {
    get {
      switch self {
      case .a:
        return "FixedOptional2CollectionPosition.a"
      case .b:
        return "FixedOptional2CollectionPosition.b"
      }
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional2CollectionPosition - CaseIterable
// -------------------------------------------------------------------------- //

extension FixedOptional2CollectionPosition : CaseIterable {
  
  @usableFromInline
  internal typealias AllCases = [FixedOptional2CollectionPosition]
  
  @usableFromInline
  internal static let allCases: AllCases = [
    .a,
    .b
  ]
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional2CollectionIndexStorage - Definition
// -------------------------------------------------------------------------- //

@usableFromInline
internal enum FixedOptional2CollectionIndexStorage {
  
  case position(FixedOptional2CollectionPosition)
  case endIndex
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional2CollectionIndexStorage - Equatable
// -------------------------------------------------------------------------- //

extension FixedOptional2CollectionIndexStorage : Equatable {
  
  @inlinable
  internal static func ==(
    lhs: FixedOptional2CollectionIndexStorage,
    rhs: FixedOptional2CollectionIndexStorage) -> Bool {
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
    lhs: FixedOptional2CollectionIndexStorage,
    rhs: FixedOptional2CollectionIndexStorage) -> Bool {
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
// MARK: FixedOptional2CollectionIndexStorage - Comparable
// -------------------------------------------------------------------------- //

extension FixedOptional2CollectionIndexStorage : Comparable {
  
  @inlinable
  internal static func <(
    lhs: FixedOptional2CollectionIndexStorage,
    rhs: FixedOptional2CollectionIndexStorage) -> Bool {
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
    lhs: FixedOptional2CollectionIndexStorage,
    rhs: FixedOptional2CollectionIndexStorage) -> Bool {
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
    lhs: FixedOptional2CollectionIndexStorage,
    rhs: FixedOptional2CollectionIndexStorage) -> Bool {
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
    lhs: FixedOptional2CollectionIndexStorage,
    rhs: FixedOptional2CollectionIndexStorage) -> Bool {
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
// MARK: FixedOptional2CollectionIndexStorage - Hashable
// -------------------------------------------------------------------------- //

extension FixedOptional2CollectionIndexStorage : Hashable {
  
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
// MARK: FixedOptional2CollectionIndexStorage - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional2CollectionIndexStorage : CustomStringConvertible {
  
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
// MARK: FixedOptional2CollectionIndexStorage - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional2CollectionIndexStorage : CustomDebugStringConvertible {
  
  @inlinable
  internal var debugDescription: String {
    get {
      switch self {
      case .position(let position):
        return "FixedOptional2CollectionIndexStorage.position(\(String(reflecting: position))"
      case .endIndex:
        return "FixedOptional2CollectionIndexStorage.endIndex"
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional2CollectionIndexStorage - CaseIterable
// -------------------------------------------------------------------------- //

extension FixedOptional2CollectionIndexStorage : CaseIterable {
  
  @usableFromInline
  internal typealias AllCases = [FixedOptional2CollectionIndexStorage]
  
  @usableFromInline
  internal static let allCases: AllCases = [
    .position(.a),
    .position(.b),
    .endIndex
  ]
  
}
