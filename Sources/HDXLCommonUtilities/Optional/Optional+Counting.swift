//
//  Optional+Counting.swift
//

import Foundation

public extension Optional {
  
  @inlinable
  var oneIfNotNil: Int {
    get {
      switch self {
      case .none:
        return 0
      case .some(_):
        return 1
      }
    }
  }
  
}
