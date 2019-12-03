//
//  IndexPositionStorageCodingKeys.swift
//

import Foundation

@usableFromInline
internal enum IndexPositionStorageCodingKeys : String, CodingKey {
  
  case type = "type"
  case position = "position"
  
  @inlinable
  internal var intValue: Int? {
    get {
      switch self {
      case .type:
        return 0
      case .position:
        return 1
      }
    }
  }
  
  @inlinable
  internal init?(intValue: Int) {
    switch intValue {
    case 0:
      self = .type
    case 1:
      self = .position
    default:
      return nil
    }
  }
  
}
