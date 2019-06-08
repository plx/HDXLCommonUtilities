//
//  ConstantCompleteMap.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: ConstantCompleteMap - Definition
// -------------------------------------------------------------------------- //

/// Special-case complete map where all keys are mapped to a single value.
public struct ConstantCompleteMap<Key,Value> {
  
  /// The value to which keys are mapped.
  public let value: Value
  
  /// "Designated initializer" for `ConstantCompleteMap`.
  ///
  /// - parameter value: The value to-which all keys are mapped.
  ///
  /// - returns: A constant map associating all keys to `value`.
  /// 
  @inlinable
  public init(value: Value) {
    self.value = value
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ConstantCompleteMap - Validatable
// -------------------------------------------------------------------------- //

extension ConstantCompleteMap : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      guard
        isValidOrIndifferent(self.value) else {
          return false
      }
      return true
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ConstantCompleteMap - Equatable
// -------------------------------------------------------------------------- //

extension ConstantCompleteMap : Equatable where Value: Equatable {
  
  @inlinable
  public static func ==(
    lhs: ConstantCompleteMap<Key,Value>,
    rhs: ConstantCompleteMap<Key,Value>) -> Bool {
    guard
      lhs.value == rhs.value else {
        return false
    }
    return true
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ConstantCompleteMap - Hashable
// -------------------------------------------------------------------------- //

extension ConstantCompleteMap : Hashable where Value : Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.value.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ConstantCompleteMap - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension ConstantCompleteMap : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "\(String(describing: self.value))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ConstantCompleteMap - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension ConstantCompleteMap : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "ConstantCompleteMap<\(String(reflecting: Key.self)), \(String(reflecting: Value.self))>(value: \(String(reflecting: self.value)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ConstantCompleteMap - Codable
// -------------------------------------------------------------------------- //

extension ConstantCompleteMap : Codable where Value:Codable {
  
  // synthesized is ok
  
}

// -------------------------------------------------------------------------- //
// MARK: ConstantCompleteMap - CompleteMap
// -------------------------------------------------------------------------- //

extension ConstantCompleteMap : CompleteMap {
  
  @inlinable
  public subscript(key: Key) -> Value {
    get {
      return self.value
    }
  }
  
}
