//
//  Hasher+HashValue.swift
//

import Foundation

public extension Hasher {
  
  @inlinable
  static func obtainHashValue(using mutation: (inout Hasher) -> Void) -> Int {
    var hasher = Hasher()
    mutation(&hasher)
    return hasher.finalize()
  }

}

