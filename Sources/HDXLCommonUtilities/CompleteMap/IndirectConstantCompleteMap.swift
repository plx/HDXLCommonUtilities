//
//  IndirectIndirectConstantCompleteMap.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: IndirectConstantCompleteMap - Definition
// -------------------------------------------------------------------------- //

/// Special-case complete map where all keys are associated with a single value-source.
public struct IndirectConstantCompleteMap<Key,Source:ValueSource> {
  
  public typealias Value = Source.Value
  
  /// The value-source associated with all keys
  public let source: Source
  
  /// The value to which keys are mapped.
  public var value: Value {
    get {
      return self.source.obtainValue()
    }
  }
  
  /// "Designated initializer" for `IndirectConstantCompleteMap`.
  ///
  /// - parameter source: The source associated with all keys.
  ///
  /// - returns: A constant map associating all keys to the value obtained-from `source`.
  ///
  /// - note: Using this with non-constant `Source`s is undefined; no effort made to ensure consistency.
  ///
  @inlinable
  public init(source: Source) {
    self.source = source
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: IndirectConstantCompleteMap - SimpleValueSource Convenience
// -------------------------------------------------------------------------- //

public extension IndirectConstantCompleteMap where Source:SimpleValueSource {
  
  /// "Convenience initializer" for sources constructible from a simple (auto)closure.
  ///
  /// - parameter value: Closure used to obtain the constant value.
  ///
  /// - returns: A map associating all keys with the source constructed-from `value`.
  ///
  /// - note: Using this with non-constant `Source`s is undefined; no effort made to ensure consistency.
  ///
  @inlinable
  init(value: @escaping @autoclosure () -> Value) {
    self.init(
      source: Source(
        value: value()
      )
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: IndirectConstantCompleteMap - Validatable
// -------------------------------------------------------------------------- //

extension IndirectConstantCompleteMap : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      guard
        isValidOrIndifferent(self.source) else {
          return false
      }
      return true
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: IndirectConstantCompleteMap - Equatable
// -------------------------------------------------------------------------- //

extension IndirectConstantCompleteMap : Equatable where Source: Equatable {
  
  @inlinable
  public static func ==(
    lhs: IndirectConstantCompleteMap<Key,Source>,
    rhs: IndirectConstantCompleteMap<Key,Source>) -> Bool {
    guard
      lhs.source == rhs.source else {
        return false
    }
    return true
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: IndirectConstantCompleteMap - Hashable
// -------------------------------------------------------------------------- //

extension IndirectConstantCompleteMap : Hashable where Source : Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.source.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: IndirectConstantCompleteMap - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension IndirectConstantCompleteMap : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "\(String(describing: self.source))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: IndirectConstantCompleteMap - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension IndirectConstantCompleteMap : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "IndirectConstantCompleteMap<\(String(reflecting: Key.self)), \(String(reflecting: Source.self))>(source: \(String(reflecting: self.source)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: IndirectConstantCompleteMap - Codable
// -------------------------------------------------------------------------- //

extension IndirectConstantCompleteMap : Codable where Source:Codable {
  
  // synthesized is ok
  
}

// -------------------------------------------------------------------------- //
// MARK: IndirectConstantCompleteMap - CompleteMap
// -------------------------------------------------------------------------- //

extension IndirectConstantCompleteMap : CompleteMap {
  
  @inlinable
  public subscript(key: Key) -> Value {
    get {
      return self.value
    }
  }
  
}
