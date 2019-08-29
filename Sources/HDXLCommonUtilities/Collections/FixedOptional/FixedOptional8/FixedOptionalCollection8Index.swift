//
//  FixedOptionalCollection9Index.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: FixedOptional8CollectionIndex - Definition
// -------------------------------------------------------------------------- //

public struct FixedOptional8CollectionIndex {
  
  @usableFromInline
  internal typealias Storage = FixedOptional8CollectionIndexStorage
  
  @usableFromInline
  internal var storage: Storage
  
  @inlinable
  internal init(storage: Storage) {
    self.storage = storage
  }
  
  @inlinable
  internal init(position: FixedOptional8CollectionPosition) {
    self.init(
      storage: Storage.position(position)
    )
  }
  
  @usableFromInline
  static let endIndex: FixedOptional8CollectionIndex = FixedOptional8CollectionIndex(
    storage: .endIndex
  )
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional8CollectionIndex - Equatable
// -------------------------------------------------------------------------- //

extension FixedOptional8CollectionIndex : Equatable {
  
  @inlinable
  public static func ==(
    lhs: FixedOptional8CollectionIndex,
    rhs: FixedOptional8CollectionIndex) -> Bool {
    return lhs.storage == rhs.storage
  }
  
  @inlinable
  public static func !=(
    lhs: FixedOptional8CollectionIndex,
    rhs: FixedOptional8CollectionIndex) -> Bool {
    return lhs.storage != rhs.storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional8CollectionIndex - Comparable
// -------------------------------------------------------------------------- //

extension FixedOptional8CollectionIndex : Comparable {
  
  @inlinable
  public static func <(
    lhs: FixedOptional8CollectionIndex,
    rhs: FixedOptional8CollectionIndex) -> Bool {
    return lhs.storage < rhs.storage
  }

  @inlinable
  public static func >(
    lhs: FixedOptional8CollectionIndex,
    rhs: FixedOptional8CollectionIndex) -> Bool {
    return lhs.storage > rhs.storage
  }

  @inlinable
  public static func <=(
    lhs: FixedOptional8CollectionIndex,
    rhs: FixedOptional8CollectionIndex) -> Bool {
    return lhs.storage <= rhs.storage
  }

  @inlinable
  public static func >=(
    lhs: FixedOptional8CollectionIndex,
    rhs: FixedOptional8CollectionIndex) -> Bool {
    return lhs.storage >= rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional8CollectionIndex - Hashable
// -------------------------------------------------------------------------- //

extension FixedOptional8CollectionIndex : Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional8CollectionIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional8CollectionIndex : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return self.storage.description
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional8CollectionIndex - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional8CollectionIndex : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "FixedOptional8CollectionIndex(storage: \(self.storage.debugDescription))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional8CollectionIndex - CaseIterable
// -------------------------------------------------------------------------- //

extension FixedOptional8CollectionIndex : CaseIterable {
  
  public typealias AllCases = [FixedOptional8CollectionIndex]
  
  public static let allCases: AllCases = [
    FixedOptional8CollectionIndex(storage: .position(.a)),
    FixedOptional8CollectionIndex(storage: .position(.b)),
    FixedOptional8CollectionIndex(storage: .position(.c)),
    FixedOptional8CollectionIndex(storage: .position(.d)),
    FixedOptional8CollectionIndex(storage: .position(.e)),
    FixedOptional8CollectionIndex(storage: .position(.f)),
    FixedOptional8CollectionIndex(storage: .position(.g)),
    FixedOptional8CollectionIndex(storage: .position(.h)),
    FixedOptional8CollectionIndex(storage: .endIndex)
  ]
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional8CollectionPosition - Definition
// -------------------------------------------------------------------------- //

@usableFromInline
internal enum FixedOptional8CollectionPosition : UInt8 {
  
  case a = 0
  case b = 1
  case c = 2
  case d = 3
  case e = 4
  case f = 5
  case g = 6
  case h = 7
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional8CollectionPosition - Comparable
// -------------------------------------------------------------------------- //

extension FixedOptional8CollectionPosition : Comparable {
  
  @inlinable
  internal static func <(
    lhs: FixedOptional8CollectionPosition,
    rhs: FixedOptional8CollectionPosition) -> Bool {
    return lhs.rawValue < rhs.rawValue
  }

  @inlinable
  internal static func >(
    lhs: FixedOptional8CollectionPosition,
    rhs: FixedOptional8CollectionPosition) -> Bool {
    return lhs.rawValue > rhs.rawValue
  }
  
  @inlinable
  internal static func <=(
    lhs: FixedOptional8CollectionPosition,
    rhs: FixedOptional8CollectionPosition) -> Bool {
    return lhs.rawValue <= rhs.rawValue
  }

  @inlinable
  internal static func >=(
    lhs: FixedOptional8CollectionPosition,
    rhs: FixedOptional8CollectionPosition) -> Bool {
    return lhs.rawValue >= rhs.rawValue
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional8CollectionPosition - Hashable
// -------------------------------------------------------------------------- //

extension FixedOptional8CollectionPosition : Hashable {
  
  @inlinable
  internal func hash(into hasher: inout Hasher) {
    self.rawValue.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional8CollectionPosition - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional8CollectionPosition : CustomStringConvertible {
  
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
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional8CollectionPosition - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional8CollectionPosition : CustomDebugStringConvertible {
  
  @inlinable
  internal var debugDescription: String {
    get {
      switch self {
      case .a:
        return "FixedOptional8CollectionPosition.a"
      case .b:
        return "FixedOptional8CollectionPosition.b"
      case .c:
        return "FixedOptional8CollectionPosition.c"
      case .d:
        return "FixedOptional8CollectionPosition.d"
      case .e:
        return "FixedOptional8CollectionPosition.e"
      case .f:
        return "FixedOptional8CollectionPosition.f"
      case .g:
        return "FixedOptional8CollectionPosition.g"
      case .h:
        return "FixedOptional8CollectionPosition.h"
      }
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional8CollectionPosition - CaseIterable
// -------------------------------------------------------------------------- //

extension FixedOptional8CollectionPosition : CaseIterable {
  
  @usableFromInline
  internal typealias AllCases = [FixedOptional8CollectionPosition]
  
  @usableFromInline
  internal static let allCases: AllCases = [
    .a,
    .b,
    .c,
    .d,
    .e,
    .f,
    .g,
    .h
  ]
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional8CollectionIndexStorage - Definition
// -------------------------------------------------------------------------- //

@usableFromInline
internal enum FixedOptional8CollectionIndexStorage {
  
  case position(FixedOptional8CollectionPosition)
  case endIndex
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional8CollectionIndexStorage - Equatable
// -------------------------------------------------------------------------- //

extension FixedOptional8CollectionIndexStorage : Equatable {
  
  @inlinable
  internal static func ==(
    lhs: FixedOptional8CollectionIndexStorage,
    rhs: FixedOptional8CollectionIndexStorage) -> Bool {
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
    lhs: FixedOptional8CollectionIndexStorage,
    rhs: FixedOptional8CollectionIndexStorage) -> Bool {
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
// MARK: FixedOptional8CollectionIndexStorage - Comparable
// -------------------------------------------------------------------------- //

extension FixedOptional8CollectionIndexStorage : Comparable {
  
  @inlinable
  internal static func <(
    lhs: FixedOptional8CollectionIndexStorage,
    rhs: FixedOptional8CollectionIndexStorage) -> Bool {
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
    lhs: FixedOptional8CollectionIndexStorage,
    rhs: FixedOptional8CollectionIndexStorage) -> Bool {
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
    lhs: FixedOptional8CollectionIndexStorage,
    rhs: FixedOptional8CollectionIndexStorage) -> Bool {
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
    lhs: FixedOptional8CollectionIndexStorage,
    rhs: FixedOptional8CollectionIndexStorage) -> Bool {
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
// MARK: FixedOptional8CollectionIndexStorage - Hashable
// -------------------------------------------------------------------------- //

extension FixedOptional8CollectionIndexStorage : Hashable {
  
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
// MARK: FixedOptional8CollectionIndexStorage - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional8CollectionIndexStorage : CustomStringConvertible {
  
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
// MARK: FixedOptional8CollectionIndexStorage - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension FixedOptional8CollectionIndexStorage : CustomDebugStringConvertible {
  
  @inlinable
  internal var debugDescription: String {
    get {
      switch self {
      case .position(let position):
        return "FixedOptional8CollectionIndexStorage.position(\(String(reflecting: position))"
      case .endIndex:
        return "FixedOptional8CollectionIndexStorage.endIndex"
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptional8CollectionIndexStorage - CaseIterable
// -------------------------------------------------------------------------- //

extension FixedOptional8CollectionIndexStorage : CaseIterable {
  
  @usableFromInline
  internal typealias AllCases = [FixedOptional8CollectionIndexStorage]
  
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
    .endIndex
  ]
  
}
