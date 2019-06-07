//
//  CompleteMap.swift
//

import Foundation

/// Protocol capturing the concept of a "complete dictionary".
/// Yes, this is *essentially* just a function at heart, but it communicates the *intent* to act like a lookup table.
public protocol CompleteMap {

  /// The type of key under which we contain values.
  associatedtype Key
  
  /// The type of value to-which we map keys.
  associatedtype Value
  
  /// Retrieve the value for `key`.
  ///
  /// - parameter key: The key of interest.
  ///
  /// - returns: The value associated with key.
  ///
  /// - note: Default implementation supplied that calls-through to the underlying subscript.
  func value(forKey key: Key) -> Value
  
  /// Retrieve the value for `key`.
  ///
  /// - parameter key: The key of interest.
  ///
  /// - returns: The value associated with key.
  ///
  /// - note: Implementation is mandatory.
  /// 
  subscript(key: Key) -> Value { get }
  
}

public extension CompleteMap {
  
  /// Named lookup that directly calls-through to the underlying subscript.
  @inlinable
  func value(forKey key: Key) -> Value {
    return self[key]
  }
  
}
