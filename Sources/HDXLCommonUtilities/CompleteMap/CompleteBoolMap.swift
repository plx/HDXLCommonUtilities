//
//  CompleteBoolMap.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: CompleteBoolMap - Definition
// -------------------------------------------------------------------------- //

/// A `CompleteMap` implementation specialized for use with `Bool`  keys.
public struct CompleteBoolMap<Value> {
  
  /// The value associated with `true`.
  public var trueValue: Value
  
  /// The value associated with `false`.
  public var falseValue: Value
  
  @inlinable
  public init(trueValue: Value, falseValue: Value) {
    self.trueValue = trueValue
    self.falseValue = falseValue
  }
  
  @inlinable
  public init(value: Value) {
    self.init(
      trueValue: value,
      falseValue: value
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: CompleteBoolMap - Validatable
// -------------------------------------------------------------------------- //

extension CompleteBoolMap : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      return true
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: CompleteBoolMap - Equatable
// -------------------------------------------------------------------------- //

extension CompleteBoolMap : Equatable where Value: Equatable {
  
  @inlinable
  public static func ==(
    lhs: CompleteBoolMap<Value>,
    rhs: CompleteBoolMap<Value>) -> Bool {
    guard
      lhs.trueValue == rhs.trueValue,
      lhs.falseValue == rhs.falseValue else {
        return false
    }
    return true
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: CompleteBoolMap - Hashable
// -------------------------------------------------------------------------- //

extension CompleteBoolMap : Hashable where Value : Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.trueValue.hash(into: &hasher)
    self.falseValue.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: CompleteBoolMap - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension CompleteBoolMap : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "(true: \(String(describing: self.trueValue)), false: \(String(describing: self.falseValue)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: CompleteBoolMap - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension CompleteBoolMap : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "CompleteBoolMap<\(String(reflecting: Value.self))>(trueValue: \(String(reflecting: self.trueValue)), falseValue: \(String(reflecting: self.falseValue)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: CompleteBoolMap - Codable
// -------------------------------------------------------------------------- //

extension CompleteBoolMap : Codable where Value:Codable {
  
  // synthesized is ok
  
}

// -------------------------------------------------------------------------- //
// MARK: CompleteBoolMap - CompleteMap
// -------------------------------------------------------------------------- //

extension CompleteBoolMap : CompleteMap {
  
  public typealias Key = Bool
  
  @inlinable
  public subscript(key: Key) -> Value {
    switch key {
    case true:
      return self.trueValue
    case false:
      return self.falseValue
    }
  }
  
}
