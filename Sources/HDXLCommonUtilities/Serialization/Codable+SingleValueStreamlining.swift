//
//  Codable+SingleValueStreamlining.swift
//  
//
//  Created by prb on 8/17/20.
//

import Foundation

public extension Encoder {
  
  @inlinable
  func encodeSingleValueContainer<T:Codable>(containing value: T) throws {
    var container = self.singleValueContainer()
    try container.encode(value)
  }
  
}

public extension Decoder {
  
  @inlinable
  func decodeSingleValueContainer<T:Codable>(containing type: T.Type) throws -> T {
    let container = try self.singleValueContainer()
    return try container.decode(type)
  }
  
}
