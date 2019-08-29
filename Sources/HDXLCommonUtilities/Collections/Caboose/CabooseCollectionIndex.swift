//
//  CabooseCollectionIndex.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: CabooseCollectionIndex - Definition
// -------------------------------------------------------------------------- //

public struct CabooseCollectionIndex<Index:Comparable> {
  
  @usableFromInline
  internal typealias Storage = CabooseCollectionIndexStorage<Index>
  
  @usableFromInline
  internal var storage: Storage
  
  @inlinable
  internal init(storage: Storage) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(storage.isValid)
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self.storage = storage
  }
  
  @inlinable
  internal init(index: Index) {
    self.init(
      storage: .primary(index)
    )
  }
  
  @inlinable
  internal static var cabooseIndex: CabooseCollectionIndex<Index> {
    get {
      return CabooseCollectionIndex<Index>(
        storage: .caboose
      )
    }
  }

  @inlinable
  internal static var endIndex: CabooseCollectionIndex<Index> {
    get {
      return CabooseCollectionIndex<Index>(
        storage: .end
      )
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: CabooseCollectionIndex - Validatable
// -------------------------------------------------------------------------- //

extension CabooseCollectionIndex : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      return self.storage.isValid
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: CabooseCollectionIndex - Equatable
// -------------------------------------------------------------------------- //

extension CabooseCollectionIndex : Equatable {
  
  @inlinable
  public static func ==(
    lhs: CabooseCollectionIndex<Index>,
    rhs: CabooseCollectionIndex<Index>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage == rhs.storage
  }

  @inlinable
  public static func !=(
    lhs: CabooseCollectionIndex<Index>,
    rhs: CabooseCollectionIndex<Index>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage != rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: CabooseCollectionIndex - Comparable
// -------------------------------------------------------------------------- //

extension CabooseCollectionIndex : Comparable {
  
  @inlinable
  public static func <(
    lhs: CabooseCollectionIndex<Index>,
    rhs: CabooseCollectionIndex<Index>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage < rhs.storage
  }

  @inlinable
  public static func >(
    lhs: CabooseCollectionIndex<Index>,
    rhs: CabooseCollectionIndex<Index>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage > rhs.storage
  }

  @inlinable
  public static func <=(
    lhs: CabooseCollectionIndex<Index>,
    rhs: CabooseCollectionIndex<Index>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage <= rhs.storage
  }

  @inlinable
  public static func >=(
    lhs: CabooseCollectionIndex<Index>,
    rhs: CabooseCollectionIndex<Index>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage >= rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: CabooseCollectionIndex - Hashable
// -------------------------------------------------------------------------- //

extension CabooseCollectionIndex : Hashable where Index:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: CabooseCollectionIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension CabooseCollectionIndex : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return self.storage.description
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: CabooseCollectionIndex - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension CabooseCollectionIndex : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "CabooseCollectionIndex<\(String(reflecting: Index.self))>(storage: \(self.storage.debugDescription)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: CabooseCollectionIndex - Codable
// -------------------------------------------------------------------------- //

extension CabooseCollectionIndex : Codable where Index:Codable {
    
  // synthesized ok
  
}

// -------------------------------------------------------------------------- //
// MARK: CabooseCollectionIndexStorage - Definition
// -------------------------------------------------------------------------- //

@usableFromInline
internal enum CabooseCollectionIndexStorage<Index:Comparable> {
  
  case primary(Index)
  case caboose
  case end
  
}

// -------------------------------------------------------------------------- //
// MARK: CabooseCollectionIndexStorage - Support
// -------------------------------------------------------------------------- //

internal extension CabooseCollectionIndexStorage {
  
  @inlinable
  var cabooseCollectionIndexStorageType: CabooseCollectionIndexStorageType {
    get {
      switch self {
      case .primary(_):
        return .primary
      case .caboose:
        return .caboose
      case .end:
        return .end
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: CabooseCollectionIndexStorage - Validatable
// -------------------------------------------------------------------------- //

extension CabooseCollectionIndexStorage : Validatable {
  
  @inlinable
  internal var isValid: Bool {
    get {
      switch self {
      case .primary(let index):
        return isValidOrIndifferent(index)
      case .caboose:
        return true
      case .end:
        return true
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: CabooseCollectionIndexStorage - Equatable
// -------------------------------------------------------------------------- //

extension CabooseCollectionIndexStorage : Equatable {
  
  @inlinable
  static func ==(
    lhs: CabooseCollectionIndexStorage<Index>,
    rhs: CabooseCollectionIndexStorage<Index>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    switch (lhs, rhs) {
    case (.primary(let l), .primary(let r)):
      return l == r
    case (.caboose, .caboose):
      return true
    case (.end, .end):
      return true
    default:
      return false
    }
  }

  @inlinable
  static func !=(
    lhs: CabooseCollectionIndexStorage<Index>,
    rhs: CabooseCollectionIndexStorage<Index>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    switch (lhs, rhs) {
    case (.primary(let l), .primary(let r)):
      return l != r
    case (.caboose, .caboose):
      return false
    case (.end, .end):
      return false
    default:
      return true
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: CabooseCollectionIndexStorage - Comparable
// -------------------------------------------------------------------------- //

extension CabooseCollectionIndexStorage : Comparable {
 
  @inlinable
  static func <(
    lhs: CabooseCollectionIndexStorage<Index>,
    rhs: CabooseCollectionIndexStorage<Index>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    switch (lhs, rhs) {
    case (.primary(let l), .primary(let r)):
      return l < r
    case (.primary(_), .caboose):
      return true
    case (.primary(_), .end):
      return true
    case (.caboose, .primary(_)):
      return false
    case (.caboose, .caboose):
      return false
    case (.caboose, .end):
      return true
    case (.end, .primary(_)):
      return false
    case (.end, .caboose):
      return false
    case (.end, .end):
      return false
    }
  }

  @inlinable
  static func >(
    lhs: CabooseCollectionIndexStorage<Index>,
    rhs: CabooseCollectionIndexStorage<Index>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    switch (lhs, rhs) {
    case (.primary(let l), .primary(let r)):
      return l > r
    case (.primary(_), .caboose):
      return false
    case (.primary(_), .end):
      return false
    case (.caboose, .primary(_)):
      return true
    case (.caboose, .caboose):
      return false
    case (.caboose, .end):
      return false
    case (.end, .primary(_)):
      return true
    case (.end, .caboose):
      return true
    case (.end, .end):
      return false
    }
  }

  @inlinable
  static func <=(
    lhs: CabooseCollectionIndexStorage<Index>,
    rhs: CabooseCollectionIndexStorage<Index>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    switch (lhs, rhs) {
    case (.primary(let l), .primary(let r)):
      return l <= r
    case (.primary(_), .caboose):
      return true
    case (.primary(_), .end):
      return true
    case (.caboose, .primary(_)):
      return false
    case (.caboose, .caboose):
      return true
    case (.caboose, .end):
      return true
    case (.end, .primary(_)):
      return false
    case (.end, .caboose):
      return false
    case (.end, .end):
      return true
    }
  }

  @inlinable
  static func >=(
    lhs: CabooseCollectionIndexStorage<Index>,
    rhs: CabooseCollectionIndexStorage<Index>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    switch (lhs, rhs) {
    case (.primary(let l), .primary(let r)):
      return l >= r
    case (.primary(_), .caboose):
      return false
    case (.primary(_), .end):
      return false
    case (.caboose, .primary(_)):
      return true
    case (.caboose, .caboose):
      return true
    case (.caboose, .end):
      return false
    case (.end, .primary(_)):
      return true
    case (.end, .caboose):
      return true
    case (.end, .end):
      return true
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: CabooseCollectionIndexStorage - Hashable
// -------------------------------------------------------------------------- //

extension CabooseCollectionIndexStorage : Hashable where Index:Hashable {
  
  @inlinable
  internal func hash(into hasher: inout Hasher) {
    self.cabooseCollectionIndexStorageType.hash(into: &hasher)
    switch self {
    case .primary(let index):
      index.hash(into: &hasher)
    case .caboose:
      ();
    case .end:
      ();
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: CabooseCollectionIndexStorage - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension CabooseCollectionIndexStorage : CustomStringConvertible {
  
  @inlinable
  internal var description: String {
    get {
      switch self {
      case .primary(let index):
        return ".primary(\(String(describing: index)))"
      case .caboose:
        return ".caboose"
      case .end:
        return ".end"
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: CabooseCollectionIndexStorage - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension CabooseCollectionIndexStorage : CustomDebugStringConvertible {
  
  @inlinable
  internal var debugDescription: String {
    get {
      switch self {
      case .primary(let index):
        return "CabooseCollectionIndexStorage<\(String(reflecting: Index.self))>.primary(\(String(reflecting: index)))"
      case .caboose:
        return "CabooseCollectionIndexStorage<\(String(reflecting: Index.self))>.caboose"
      case .end:
        return "CabooseCollectionIndexStorage<\(String(reflecting: Index.self))>.end"
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: CabooseCollectionIndexStorage - Codable
// -------------------------------------------------------------------------- //

extension CabooseCollectionIndexStorage : Codable where Index:Codable {
  
  @usableFromInline
  internal typealias CodingKeys = IndexPositionStorageCodingKeys
  
  @inlinable
  internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(
      keyedBy: CodingKeys.self
    )
    try container.encode(
      self.cabooseCollectionIndexStorageType,
      forKey: .type
    )
    switch self {
    case .primary(let index):
      try container.encode(
        index,
        forKey: .position
      )
    case .caboose:
      ();
    case .end:
      ();
    }
  }
  
  @inlinable
  internal init(from decoder: Decoder) throws {
    let container = try decoder.container(
      keyedBy: CodingKeys.self
    )
    let type = try container.decode(
      CabooseCollectionIndexStorage.self,
      forKey: .type
    )
    switch type {
    case .primary:
      self = .primary(
        try container.decode(
          Index.self,
          forKey: .position
        )
      )
    case .caboose:
      self = .caboose
    case .end:
      self = .end
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: CabooseCollectionIndexStorageType - Definition
// -------------------------------------------------------------------------- //

@usableFromInline
internal enum CabooseCollectionIndexStorageType : Int {
  
  case primary
  case caboose
  case end
  
}

// -------------------------------------------------------------------------- //
// MARK: CabooseCollectionIndexStorageType - Equatable
// -------------------------------------------------------------------------- //

extension CabooseCollectionIndexStorageType : Equatable {
  
  @inlinable
  internal static func ==(
    lhs: CabooseCollectionIndexStorageType,
    rhs: CabooseCollectionIndexStorageType) -> Bool {
    return lhs.rawValue == rhs.rawValue
  }

  @inlinable
  internal static func !=(
    lhs: CabooseCollectionIndexStorageType,
    rhs: CabooseCollectionIndexStorageType) -> Bool {
    return lhs.rawValue != rhs.rawValue
  }

}

// -------------------------------------------------------------------------- //
// MARK: CabooseCollectionIndexStorageType - Hashable
// -------------------------------------------------------------------------- //

extension CabooseCollectionIndexStorageType : Hashable {
  
  @inlinable
  internal func hash(into hasher: inout Hasher) {
    self.rawValue.hash(into: &hasher)
  }

}

// -------------------------------------------------------------------------- //
// MARK: CabooseCollectionIndexStorageType - Codable
// -------------------------------------------------------------------------- //

extension CabooseCollectionIndexStorageType : Codable {
  
  // synthesized ok
  
}
