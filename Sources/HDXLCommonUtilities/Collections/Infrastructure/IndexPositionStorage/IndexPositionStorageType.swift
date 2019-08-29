//
//  IndexPositionStorageType.swift
//

import Foundation

@usableFromInline
internal enum IndexPositionStorageType : UInt8 {
  
  case position
  case end
  
}

extension IndexPositionStorageType : Equatable {
  
  @inlinable
  internal static func ==(
    lhs: IndexPositionStorageType,
    rhs: IndexPositionStorageType) -> Bool {
    return lhs.rawValue == rhs.rawValue
  }

  @inlinable
  internal static func !=(
    lhs: IndexPositionStorageType,
    rhs: IndexPositionStorageType) -> Bool {
    return lhs.rawValue != rhs.rawValue
  }
  
}

extension IndexPositionStorageType : Comparable {
  
  @inlinable
  internal static func <(
    lhs: IndexPositionStorageType,
    rhs: IndexPositionStorageType) -> Bool {
    return lhs.rawValue < rhs.rawValue
  }

  @inlinable
  internal static func >(
    lhs: IndexPositionStorageType,
    rhs: IndexPositionStorageType) -> Bool {
    return lhs.rawValue > rhs.rawValue
  }

  @inlinable
  internal static func <=(
    lhs: IndexPositionStorageType,
    rhs: IndexPositionStorageType) -> Bool {
    return lhs.rawValue <= rhs.rawValue
  }

  @inlinable
  internal static func >=(
    lhs: IndexPositionStorageType,
    rhs: IndexPositionStorageType) -> Bool {
    return lhs.rawValue >= rhs.rawValue
  }
  
}

extension IndexPositionStorageType : Hashable {
  
  @inlinable
  internal func hash(into hasher: inout Hasher) {
    self.rawValue.hash(into: &hasher)
  }
  
}

extension IndexPositionStorageType : CustomStringConvertible {
  
  @inlinable
  internal var description: String {
    get {
      switch self {
      case .position:
        return ".position"
      case .end:
        return ".end"
      }
    }
  }
  
}

extension IndexPositionStorageType : CustomDebugStringConvertible {
  
  @inlinable
  internal var debugDescription: String {
    get {
      switch self {
      case .position:
        return "IndexPositionStorageType.position"
      case .end:
        return "IndexPositionStorageType.end"
      }
    }
  }
  
}

extension IndexPositionStorageType : CaseIterable {
  
  @usableFromInline
  internal typealias AllCases = [IndexPositionStorageType]
  
  @usableFromInline
  internal static let allCases: AllCases = [
    .position,
    .end
  ]

}

extension IndexPositionStorageType : Codable {
  
}
