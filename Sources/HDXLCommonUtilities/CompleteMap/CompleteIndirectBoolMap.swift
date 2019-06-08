//
//  CompleteIndirectBoolMap.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: CompleteIndirectBoolMap - Definition
// -------------------------------------------------------------------------- //

/// A special-purpose `CompleteMap` implementation associating `Bool` with indirectly-obtained values.
public struct CompleteIndirectBoolMap<Source:ValueSource> {
  
  public typealias Value = Source.Value
  
  /// The value-source associated with `true`
  @usableFromInline
  internal var trueValueSource: Source

  /// The value-source associated with `false`
  @usableFromInline
  internal var falseValueSource: Source

  /// The value associated with `true`.
  @inlinable
  public var trueValue: Value {
    get {
      return self.trueValueSource.obtainValue()
    }
  }
  
  /// The value associated with `false`.
  @inlinable
  public var falseValue: Value {
    get {
      return self.falseValueSource.obtainValue()
    }
  }
  
  /// "Designated initializer" for `CompleteIndirectBoolMap`.
  ///
  /// - parameter trueValueSource: The source for the value(s) associated with `true`.
  /// - parameter falseValueSource: The source for the value(s) associated with `false`.
  ///
  /// - returns: A map associating `true` and `false` with the supplied values.
  ///
  /// - note: If you use this with *non-constant* value sources the behavior is undefined (and no attempt is made to keep repeated calls consistent).
  ///
  @inlinable
  public init(trueValueSource: Source, falseValueSource: Source) {
    self.trueValueSource = trueValueSource
    self.falseValueSource = falseValueSource
  }
  
  /// "Convenience initializer" for `CompleteIndirectBoolMap` wherein a common value is associated with both `true` and `false`.
  ///
  /// - parameter valueSource: The source for the common associated value.
  ///
  /// - returns: A map associating `true` and `false` with the supplied value.
  ///
  /// - note: If you use this with *non-constant* value sources the behavior is undefined (and no attempt is made to keep repeated calls consistent).
  ///
  @inlinable
  public init(valueSource: Source) {
    self.init(
      trueValueSource: valueSource,
      falseValueSource: valueSource
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: CompleteIndirectBoolMap - SimpleValueSource Conveniences
// -------------------------------------------------------------------------- //

public extension CompleteIndirectBoolMap where Source:SimpleValueSource {
  
  /// "Convenience initializer" for the case when the value sources can be constructed via simple (auto)closures.
  ///
  /// - parameter trueValue: The source of the value for `true`.
  /// - parameter falseValue: The source of the value for `false`.
  ///
  /// - returns: A map associating `true` and `false` with sources constructed-from the supplied closures.
  ///
  /// - note: If you use this with *non-constant* value sources the behavior is undefined (and no attempt is made to keep repeated calls consistent).
  ///
  @inlinable
  init(
    trueValue: @escaping @autoclosure () -> Value,
    falseValue: @escaping @autoclosure () -> Value) {
    self.init(
      trueValueSource: Source(
        value: trueValue()
      ),
      falseValueSource: Source(
        value: falseValue()
      )
    )
  }

  /// "Convenience initializer" for the shared-value-source case when the value source can be constructed via a simple (auto)closure.
  ///
  /// - parameter value: The source of the shared underlying value.
  ///
  /// - returns: A map associating `true` and `false` with a source constructed-from the supplied closure.
  ///
  /// - note: If you use this with *non-constant* value sources the behavior is undefined (and no attempt is made to keep repeated calls consistent).
  ///
  @inlinable
  init(value: @escaping @autoclosure () -> Value) {
    self.init(
      valueSource: Source(
        value: value()
      )
    )
  }

}

// -------------------------------------------------------------------------- //
// MARK: CompleteIndirectBoolMap - Validatable
// -------------------------------------------------------------------------- //

extension CompleteIndirectBoolMap : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      guard
        isValidOrIndifferent(self.trueValueSource),
        isValidOrIndifferent(self.falseValueSource) else {
          return false
      }
      return true
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: CompleteIndirectBoolMap - Equatable
// -------------------------------------------------------------------------- //

extension CompleteIndirectBoolMap : Equatable where Source: Equatable {
  
  @inlinable
  public static func ==(
    lhs: CompleteIndirectBoolMap<Source>,
    rhs: CompleteIndirectBoolMap<Source>) -> Bool {
    guard
      lhs.trueValueSource == rhs.trueValueSource,
      lhs.falseValueSource == rhs.falseValueSource else {
        return false
    }
    return true
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: CompleteIndirectBoolMap - Hashable
// -------------------------------------------------------------------------- //

extension CompleteIndirectBoolMap : Hashable where Source : Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.trueValueSource.hash(into: &hasher)
    self.falseValueSource.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: CompleteIndirectBoolMap - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension CompleteIndirectBoolMap : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "(true: \(String(describing: self.trueValueSource)), false: \(String(describing: self.falseValueSource)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: CompleteIndirectBoolMap - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension CompleteIndirectBoolMap : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "CompleteIndirectBoolMap<\(String(reflecting: Source.self))>(trueValue: \(String(reflecting: self.trueValueSource)), falseValue: \(String(reflecting: self.falseValueSource)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: CompleteBoolMap - Codable
// -------------------------------------------------------------------------- //

extension CompleteIndirectBoolMap : Codable where Source:Codable {
  
  // synthesized is ok
  
}

// -------------------------------------------------------------------------- //
// MARK: CompleteBoolMap - CompleteMap
// -------------------------------------------------------------------------- //

extension CompleteIndirectBoolMap : CompleteMap {
  
  public typealias Key = Bool
  
  @inlinable
  public subscript(key: Key) -> Value {
    get {
      switch key {
      case true:
        return self.trueValue
      case false:
        return self.falseValue
      }
    }
  }
  
}
