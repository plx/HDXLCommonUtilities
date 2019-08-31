//
//  SinglePayloadEnumCodingKeys.swift
//

import Foundation

/// Shared `CodingKey` enumeration for all single-payload enums.
///
/// Generally smarter to have per-type coding keys to support future changes,
/// but for the moment this helps cut down on code size.
public enum SinglePayloadEnumCodingKeys : String, CodingKey, CaseIterable {
  
  case type = "type"
  case data = "data"
  
  @inlinable
  public var intValue: Int? {
    get {
      switch self {
      case .type:
        return 0
      case .data:
        return 1
      }
    }
  }
  
  @inlinable
  public init?(intValue: Int) {
    switch intValue {
    case 0:
      self = .type
    case 1:
      self = .data
    default:
      return nil
    }
  }
  
  public typealias AllCases = [SinglePayloadEnumCodingKeys]
  
  public static let allCases: AllCases = [
    .type,
    .data
  ]
  
  
}
