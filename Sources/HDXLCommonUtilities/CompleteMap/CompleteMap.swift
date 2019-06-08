//
//  CompleteMap.swift
//

import Foundation

/// Protocol capturing the *concept* of a "complete dictionary".
/// 
/// Yes, this is *essentially* just a function at heart, but it communicates the *intent* to act like a lookup table.
///
/// For a motivating use-case, consider something like SwiftUI wherein you have a view that has an enumeration
/// of its possible states, and which image-and-color get shown are functions of that state: in `.foo` you show `.fooImage`,
/// in `.bar` you show `.barImage`, and so on. For simple enable/disabled flags an inline ternary works,
/// but as states get more complicated you can write helper methods like `image(forState:)`, but then unless
/// everything is hard-coded you wind up with a ton of properties to configure.
///
/// Alternatively, you can have something like `let stateImages: StateImageMap`—with `StateImageMap`
/// a typealias for the more-verbose true type name—and then just do `self.stateImages[self.state]`
/// where you need it.
///
///
///
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
