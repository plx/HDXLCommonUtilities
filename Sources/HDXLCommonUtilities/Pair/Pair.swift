//
//  Pair.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Pair - Definition
// -------------------------------------------------------------------------- //

/// This is a 2-tuple, but as a nominal type; acting as a nominal type allows it to conform to protocols.
public struct Pair<A,B> {

  /// The first slot.
  public var a: A
  
  /// The second slot.
  public var b: B
  
  /// The "designated initializer" for this struct.
  ///
  /// - parameter a: The value for the first slot.
  /// - parameter b: The value for the second slot.
  ///
  /// - returns: An initialized `Pair<A,B>` with the supplied values.
  ///
  @inlinable
  public init(_ a: A, _ b: B) {
    self.a = a
    self.b = b
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Pair - Validatable
// -------------------------------------------------------------------------- //

extension Pair : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      guard
        isValidOrIndifferent(self.a),
        isValidOrIndifferent(self.b) else {
          return false
      }
      return true
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Pair - Equatable
// -------------------------------------------------------------------------- //

extension Pair : Equatable where A:Equatable, B:Equatable {
  
  @inlinable
  public static func ==(
    lhs: Pair<A,B>,
    rhs: Pair<A,B>) -> Bool {
    guard
      lhs.a == rhs.a,
      lhs.b == rhs.b else {
        return false
    }
    return true
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Pair - Comparable
// -------------------------------------------------------------------------- //

extension Pair : Comparable where A:Comparable, B:Comparable {
  
  @inlinable
  public static func <(
    lhs: Pair<A,B>,
    rhs: Pair<A,B>) -> Bool {
    return ComparisonResult.coalescing(
      lhs.a <=> rhs.a,
      lhs.b <=> rhs.b
    ).impliesLessThan
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Pair - Hashable
// -------------------------------------------------------------------------- //

extension Pair : Hashable where A:Hashable, B:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.a.hash(into: &hasher)
    self.b.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Pair - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension Pair : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "(\(String(describing: self.a)), \(String(describing: self.b)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Pair - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension Pair : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "Pair<\(String(reflecting: A.self)),\(String(reflecting: B.self))>(\(String(reflecting: self.a)), \(String(reflecting: self.b)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Pair - Codable
// -------------------------------------------------------------------------- //

extension Pair : Codable where A:Codable, B:Codable {
 
  // synthesized ok
  
}


// -------------------------------------------------------------------------- //
// MARK: Pair - Key-Value Punning
// -------------------------------------------------------------------------- //

public extension Pair {
  
  /// Aliasing `Key` and `A` to help emulate a dedicated key-value pair type.
  typealias Key = A
  
  /// Aliasing `Value` and `B` to help emulate a dedicated key-value pair type.
  typealias Value = B
  
  /// `key` accessor for use when emulating a key-value pair.
  @inlinable
  var key: Key {
    get {
      return self.a
    }
    set {
      self.a = newValue
    }
  }

  /// `value` accessor for use when emulating a key-value pair.
  @inlinable
  var value: Value {
    get {
      return self.b
    }
    set {
      self.b = newValue
    }
  }
  
  /// "Convenience" initializer for use when emulating a key-value pair.
  @inlinable
  init(key: Key, value: Value) {
    self.init(
      key,
      value
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Pair - Tuple Interoperation
// -------------------------------------------------------------------------- //

public extension Pair {

  /// Acceses content as a raw tuple.
  @inlinable
  var tupleRepresentation: (A,B) {
    get {
      return (self.a,self.b)
    }
  }
  
  /// "Convenience" initializer to construct from a tuple.
  @inlinable
  init(from tuple: (A,B)) {
    self.init(
      tuple.0,
      tuple.1
    )
  }

}

