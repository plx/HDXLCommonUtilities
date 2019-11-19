//
//  Bool+Counts.swift
//

import Foundation

public extension Bool {
  
  @inlinable
  var oneIfTrue: Int {
    get {
      switch self {
      case true:
        return 1
      case false:
        return 0
      }
    }
  }

  @inlinable
  var oneIfFalse: Int {
    get {
      switch self {
      case true:
        return 0
      case false:
        return 1
      }
    }
  }

}
