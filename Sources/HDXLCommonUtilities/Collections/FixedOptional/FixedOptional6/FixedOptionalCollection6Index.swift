//
//  FixedOptionalCollection9Index.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: FixedOptional6CollectionIndex - Definition
// -------------------------------------------------------------------------- //

public struct FixedOptional6CollectionIndex {
  
  @usableFromInline
  internal typealias Storage = FixedOptional6CollectionIndexStorage
  
  @usableFromInline
  internal var storage: Storage
  
  @inlinable
  internal init(storage: Storage) {
    self.storage = storage
  }
  
  @inlinable
  internal init(position: FixedOptional6CollectionPosition) {
    self.init(
      storage: Storage.position(position)
    )
  }
  
  @usableFromInline
  static let endIndex: FixedOptional6CollectionIndex = FixedOptional6CollectionIndex(
    storage: .endIndex
  )
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional6CollectionIndex - Equatable
// -------------------------------------------------------------------------- //

extension FixedOptional6CollectionIndex : Equatable {
  
  @inlinable
  public static func ==(
    lhs: FixedOptional6CollectionIndex,
    rhs: FixedOptional6CollectionIndex) -> Bool {
    return lhs.storage == rhs.storage
  }
  
  @inlinable
  public static func !=(
    lhs: FixedOptional6CollectionIndex,
    rhs: FixedOptional6CollectionIndex) -> Bool {
    return lhs.storage != rhs.storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional6CollectionIndex - Comparable
// -------------------------------------------------------------------------- //

extension FixedOptional6CollectionIndex : Comparable {
  
  @inlinable
  public static func <(
    lhs: FixedOptional6CollectionIndex,
    rhs: FixedOptional6CollectionIndex) -> Bool {
    return lhs.storage < rhs.storage
  }

  @inlinable
  public static func >(
    lhs: FixedOptional6CollectionIndex,
    rhs: FixedOptional6CollectionIndex) -> Bool {
    return lhs.storage > rhs.storage
  }

  @inlinable
  public static func <=(
    lhs: FixedOptional6CollectionIndex,
    rhs: FixedOptional6CollectionIndex) -> Bool {
    return lhs.storage <= rhs.storage
  }

  @inlinable
  public static func >=(
    lhs: FixedOptional6CollectionIndex,
    rhs: FixedOptional6CollectionIndex) -> Bool {
    return lhs.storage >= rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional6CollectionIndex - Hashable
// -------------------------------------------------------------------------- //

extension FixedOptional6CollectionIndex : Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional6CollectionIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional6CollectionIndex : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return self.storage.description
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional6CollectionIndex - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional6CollectionIndex : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "FixedOptional6CollectionIndex(storage: \(self.storage.debugDescription))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional6CollectionIndex - CaseIterable
// -------------------------------------------------------------------------- //

extension FixedOptional6CollectionIndex : CaseIterable {
  
  public typealias AllCases = [FixedOptional6CollectionIndex]
  
  public static let allCases: AllCases = [
    FixedOptional6CollectionIndex(storage: .position(.a)),
    FixedOptional6CollectionIndex(storage: .position(.b)),
    FixedOptional6CollectionIndex(storage: .position(.c)),
    FixedOptional6CollectionIndex(storage: .position(.d)),
    FixedOptional6CollectionIndex(storage: .position(.e)),
    FixedOptional6CollectionIndex(storage: .position(.f)),
    FixedOptional6CollectionIndex(storage: .endIndex)
  ]
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional6CollectionPosition - Definition
// -------------------------------------------------------------------------- //

@usableFromInline
internal enum FixedOptional6CollectionPosition : UInt8 {
  
  case a = 0
  case b = 1
  case c = 2
  case d = 3
  case e = 4
  case f = 5
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional6CollectionPosition - Comparable
// -------------------------------------------------------------------------- //

extension FixedOptional6CollectionPosition : Comparable {
  
  @inlinable
  internal static func <(
    lhs: FixedOptional6CollectionPosition,
    rhs: FixedOptional6CollectionPosition) -> Bool {
    return lhs.rawValue < rhs.rawValue
  }

  @inlinable
  internal static func >(
    lhs: FixedOptional6CollectionPosition,
    rhs: FixedOptional6CollectionPosition) -> Bool {
    return lhs.rawValue > rhs.rawValue
  }
  
  @inlinable
  internal static func <=(
    lhs: FixedOptional6CollectionPosition,
    rhs: FixedOptional6CollectionPosition) -> Bool {
    return lhs.rawValue <= rhs.rawValue
  }

  @inlinable
  internal static func >=(
    lhs: FixedOptional6CollectionPosition,
    rhs: FixedOptional6CollectionPosition) -> Bool {
    return lhs.rawValue >= rhs.rawValue
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional6CollectionPosition - Hashable
// -------------------------------------------------------------------------- //

extension FixedOptional6CollectionPosition : Hashable {
  
  @inlinable
  internal func hash(into hasher: inout Hasher) {
    self.rawValue.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional6CollectionPosition - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional6CollectionPosition : CustomStringConvertible {
  
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
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional6CollectionPosition - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional6CollectionPosition : CustomDebugStringConvertible {
  
  @inlinable
  internal var debugDescription: String {
    get {
      switch self {
      case .a:
        return "FixedOptional6CollectionPosition.a"
      case .b:
        return "FixedOptional6CollectionPosition.b"
      case .c:
        return "FixedOptional6CollectionPosition.c"
      case .d:
        return "FixedOptional6CollectionPosition.d"
      case .e:
        return "FixedOptional6CollectionPosition.e"
      case .f:
        return "FixedOptional6CollectionPosition.f"
      }
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional6CollectionPosition - CaseIterable
// -------------------------------------------------------------------------- //

extension FixedOptional6CollectionPosition : CaseIterable {
  
  @usableFromInline
  internal typealias AllCases = [FixedOptional6CollectionPosition]
  
  @usableFromInline
  internal static let allCases: AllCases = [
    .a,
    .b,
    .c,
    .d,
    .e,
    .f
  ]
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional6CollectionIndexStorage - Definition
// -------------------------------------------------------------------------- //

@usableFromInline
internal enum FixedOptional6CollectionIndexStorage {
  
  case position(FixedOptional6CollectionPosition)
  case endIndex
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional6CollectionIndexStorage - Equatable
// -------------------------------------------------------------------------- //

extension FixedOptional6CollectionIndexStorage : Equatable {
  
  @inlinable
  internal static func ==(
    lhs: FixedOptional6CollectionIndexStorage,
    rhs: FixedOptional6CollectionIndexStorage) -> Bool {
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
    lhs: FixedOptional6CollectionIndexStorage,
    rhs: FixedOptional6CollectionIndexStorage) -> Bool {
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
// MARK: FixedOptional6CollectionIndexStorage - Comparable
// -------------------------------------------------------------------------- //

extension FixedOptional6CollectionIndexStorage : Comparable {
  
  @inlinable
  internal static func <(
    lhs: FixedOptional6CollectionIndexStorage,
    rhs: FixedOptional6CollectionIndexStorage) -> Bool {
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
    lhs: FixedOptional6CollectionIndexStorage,
    rhs: FixedOptional6CollectionIndexStorage) -> Bool {
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
    lhs: FixedOptional6CollectionIndexStorage,
    rhs: FixedOptional6CollectionIndexStorage) -> Bool {
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
    lhs: FixedOptional6CollectionIndexStorage,
    rhs: FixedOptional6CollectionIndexStorage) -> Bool {
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
// MARK: FixedOptional6CollectionIndexStorage - Hashable
// -------------------------------------------------------------------------- //

extension FixedOptional6CollectionIndexStorage : Hashable {
  
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
// MARK: FixedOptional6CollectionIndexStorage - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional6CollectionIndexStorage : CustomStringConvertible {
  
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
// MARK: FixedOptional6CollectionIndexStorage - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional6CollectionIndexStorage : CustomDebugStringConvertible {
  
  @inlinable
  internal var debugDescription: String {
    get {
      switch self {
      case .position(let position):
        return "FixedOptional6CollectionIndexStorage.position(\(String(reflecting: position))"
      case .endIndex:
        return "FixedOptional6CollectionIndexStorage.endIndex"
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional6CollectionIndexStorage - CaseIterable
// -------------------------------------------------------------------------- //

extension FixedOptional6CollectionIndexStorage : CaseIterable {
  
  @usableFromInline
  internal typealias AllCases = [FixedOptional6CollectionIndexStorage]
  
  @usableFromInline
  internal static let allCases: AllCases = [
    .position(.a),
    .position(.b),
    .position(.c),
    .position(.d),
    .position(.e),
    .position(.f),
    .endIndex
  ]
  
}
