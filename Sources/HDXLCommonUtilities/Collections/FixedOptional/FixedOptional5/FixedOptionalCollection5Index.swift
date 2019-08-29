//
//  FixedOptionalCollection9Index.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: FixedOptional5CollectionIndex - Definition
// -------------------------------------------------------------------------- //

public struct FixedOptional5CollectionIndex {
  
  @usableFromInline
  internal typealias Storage = FixedOptional5CollectionIndexStorage
  
  @usableFromInline
  internal var storage: Storage
  
  @inlinable
  internal init(storage: Storage) {
    self.storage = storage
  }
  
  @inlinable
  internal init(position: FixedOptional5CollectionPosition) {
    self.init(
      storage: Storage.position(position)
    )
  }
  
  @usableFromInline
  static let endIndex: FixedOptional5CollectionIndex = FixedOptional5CollectionIndex(
    storage: .endIndex
  )
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional5CollectionIndex - Equatable
// -------------------------------------------------------------------------- //

extension FixedOptional5CollectionIndex : Equatable {
  
  @inlinable
  public static func ==(
    lhs: FixedOptional5CollectionIndex,
    rhs: FixedOptional5CollectionIndex) -> Bool {
    return lhs.storage == rhs.storage
  }
  
  @inlinable
  public static func !=(
    lhs: FixedOptional5CollectionIndex,
    rhs: FixedOptional5CollectionIndex) -> Bool {
    return lhs.storage != rhs.storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional5CollectionIndex - Comparable
// -------------------------------------------------------------------------- //

extension FixedOptional5CollectionIndex : Comparable {
  
  @inlinable
  public static func <(
    lhs: FixedOptional5CollectionIndex,
    rhs: FixedOptional5CollectionIndex) -> Bool {
    return lhs.storage < rhs.storage
  }

  @inlinable
  public static func >(
    lhs: FixedOptional5CollectionIndex,
    rhs: FixedOptional5CollectionIndex) -> Bool {
    return lhs.storage > rhs.storage
  }

  @inlinable
  public static func <=(
    lhs: FixedOptional5CollectionIndex,
    rhs: FixedOptional5CollectionIndex) -> Bool {
    return lhs.storage <= rhs.storage
  }

  @inlinable
  public static func >=(
    lhs: FixedOptional5CollectionIndex,
    rhs: FixedOptional5CollectionIndex) -> Bool {
    return lhs.storage >= rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional5CollectionIndex - Hashable
// -------------------------------------------------------------------------- //

extension FixedOptional5CollectionIndex : Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional5CollectionIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional5CollectionIndex : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return self.storage.description
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional5CollectionIndex - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional5CollectionIndex : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "FixedOptional5CollectionIndex(storage: \(self.storage.debugDescription))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional5CollectionIndex - CaseIterable
// -------------------------------------------------------------------------- //

extension FixedOptional5CollectionIndex : CaseIterable {
  
  public typealias AllCases = [FixedOptional5CollectionIndex]
  
  public static let allCases: AllCases = [
    FixedOptional5CollectionIndex(storage: .position(.a)),
    FixedOptional5CollectionIndex(storage: .position(.b)),
    FixedOptional5CollectionIndex(storage: .position(.c)),
    FixedOptional5CollectionIndex(storage: .position(.d)),
    FixedOptional5CollectionIndex(storage: .position(.e)),
    FixedOptional5CollectionIndex(storage: .endIndex)
  ]
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional5CollectionPosition - Definition
// -------------------------------------------------------------------------- //

@usableFromInline
internal enum FixedOptional5CollectionPosition : UInt8 {
  
  case a = 0
  case b = 1
  case c = 2
  case d = 3
  case e = 4
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional5CollectionPosition - Comparable
// -------------------------------------------------------------------------- //

extension FixedOptional5CollectionPosition : Comparable {
  
  @inlinable
  internal static func <(
    lhs: FixedOptional5CollectionPosition,
    rhs: FixedOptional5CollectionPosition) -> Bool {
    return lhs.rawValue < rhs.rawValue
  }

  @inlinable
  internal static func >(
    lhs: FixedOptional5CollectionPosition,
    rhs: FixedOptional5CollectionPosition) -> Bool {
    return lhs.rawValue > rhs.rawValue
  }
  
  @inlinable
  internal static func <=(
    lhs: FixedOptional5CollectionPosition,
    rhs: FixedOptional5CollectionPosition) -> Bool {
    return lhs.rawValue <= rhs.rawValue
  }

  @inlinable
  internal static func >=(
    lhs: FixedOptional5CollectionPosition,
    rhs: FixedOptional5CollectionPosition) -> Bool {
    return lhs.rawValue >= rhs.rawValue
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional5CollectionPosition - Hashable
// -------------------------------------------------------------------------- //

extension FixedOptional5CollectionPosition : Hashable {
  
  @inlinable
  internal func hash(into hasher: inout Hasher) {
    self.rawValue.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional5CollectionPosition - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional5CollectionPosition : CustomStringConvertible {
  
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
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional5CollectionPosition - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional5CollectionPosition : CustomDebugStringConvertible {
  
  @inlinable
  internal var debugDescription: String {
    get {
      switch self {
      case .a:
        return "FixedOptional5CollectionPosition.a"
      case .b:
        return "FixedOptional5CollectionPosition.b"
      case .c:
        return "FixedOptional5CollectionPosition.c"
      case .d:
        return "FixedOptional5CollectionPosition.d"
      case .e:
        return "FixedOptional5CollectionPosition.e"
      }
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional5CollectionPosition - CaseIterable
// -------------------------------------------------------------------------- //

extension FixedOptional5CollectionPosition : CaseIterable {
  
  @usableFromInline
  internal typealias AllCases = [FixedOptional5CollectionPosition]
  
  @usableFromInline
  internal static let allCases: AllCases = [
    .a,
    .b,
    .c,
    .d,
    .e
  ]
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional5CollectionIndexStorage - Definition
// -------------------------------------------------------------------------- //

@usableFromInline
internal enum FixedOptional5CollectionIndexStorage {
  
  case position(FixedOptional5CollectionPosition)
  case endIndex
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional5CollectionIndexStorage - Equatable
// -------------------------------------------------------------------------- //

extension FixedOptional5CollectionIndexStorage : Equatable {
  
  @inlinable
  internal static func ==(
    lhs: FixedOptional5CollectionIndexStorage,
    rhs: FixedOptional5CollectionIndexStorage) -> Bool {
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
    lhs: FixedOptional5CollectionIndexStorage,
    rhs: FixedOptional5CollectionIndexStorage) -> Bool {
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
// MARK: FixedOptional5CollectionIndexStorage - Comparable
// -------------------------------------------------------------------------- //

extension FixedOptional5CollectionIndexStorage : Comparable {
  
  @inlinable
  internal static func <(
    lhs: FixedOptional5CollectionIndexStorage,
    rhs: FixedOptional5CollectionIndexStorage) -> Bool {
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
    lhs: FixedOptional5CollectionIndexStorage,
    rhs: FixedOptional5CollectionIndexStorage) -> Bool {
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
    lhs: FixedOptional5CollectionIndexStorage,
    rhs: FixedOptional5CollectionIndexStorage) -> Bool {
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
    lhs: FixedOptional5CollectionIndexStorage,
    rhs: FixedOptional5CollectionIndexStorage) -> Bool {
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
// MARK: FixedOptional5CollectionIndexStorage - Hashable
// -------------------------------------------------------------------------- //

extension FixedOptional5CollectionIndexStorage : Hashable {
  
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
// MARK: FixedOptional5CollectionIndexStorage - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional5CollectionIndexStorage : CustomStringConvertible {
  
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
// MARK: FixedOptional5CollectionIndexStorage - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional5CollectionIndexStorage : CustomDebugStringConvertible {
  
  @inlinable
  internal var debugDescription: String {
    get {
      switch self {
      case .position(let position):
        return "FixedOptional5CollectionIndexStorage.position(\(String(reflecting: position))"
      case .endIndex:
        return "FixedOptional5CollectionIndexStorage.endIndex"
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional5CollectionIndexStorage - CaseIterable
// -------------------------------------------------------------------------- //

extension FixedOptional5CollectionIndexStorage : CaseIterable {
  
  @usableFromInline
  internal typealias AllCases = [FixedOptional5CollectionIndexStorage]
  
  @usableFromInline
  internal static let allCases: AllCases = [
    .position(.a),
    .position(.b),
    .position(.c),
    .position(.d),
    .position(.e),
    .endIndex
  ]
  
}
