//
//  ValueSource.swift
//  

import Foundation

/// Protocol for deferred acquisition of values: lazy values, non-constant values, and so on.
public protocol ValueSource {

  /// The type of value vended by the receiver.
  associatedtype Value
  
  /// Call this to obtain the value.
  func obtainValue() -> Value
  
}
