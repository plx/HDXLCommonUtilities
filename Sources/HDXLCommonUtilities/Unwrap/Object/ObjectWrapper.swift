//
//  ObjectWrapper.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: ObjectWrapper - Definition
// -------------------------------------------------------------------------- //

/// Struct giving objects `Equatable`, `Comparable`, and `Hashable` conformances based solely
/// on the `ObjectIdentifier`. Exists to support `ObjectSet` and `ObjectDictionary`, but
/// kept public in case it finds other uses.
public struct ObjectWrapper<WrappedObject:AnyObject> {
  
  /// The wrapped object.
  public let wrappedObject: WrappedObject
  
  /// Access the `ObjectIdentifier` of the wrapped object.
  @inlinable
  public var objectIdentifier: ObjectIdentifier {
    get {
      return ObjectIdentifier(self.wrappedObject)
    }
  }
  
  /// The "designated initializer" for `ObjectWrapper`.
  ///
  /// - parameter wrappedObject: A `WrappedObject`
  ///
  /// - returns: An `ObjectWrapper`  wrapping `wrappedObject`.
  ///
  @inlinable
  public init(wrappedObject: WrappedObject) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(isValidOrIndifferent(wrappedObject))
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self.wrappedObject = wrappedObject
  }

  /// "Convenience initializer" for `ObjectWrapper`.
  ///
  /// - parameter wrappedObject: A possibly-nil `WrappedObject`
  ///
  /// - returns: An `ObjectWrapper`  wrapping `wrappedObject` when non-`nil`, and `nil` otherwise.
  ///
  @inlinable
  public init?(wrappedObject: WrappedObject?) {
    guard let concreteWrappedObject = wrappedObject else {
      return nil
    }
    self.init(
      wrappedObject: concreteWrappedObject
    )
  }

}

// -------------------------------------------------------------------------- //
// MARK: ObjectWrapper - Validatable
// -------------------------------------------------------------------------- //

extension ObjectWrapper : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      return isValidOrIndifferent(self.wrappedObject)
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectWrapper - Equatable
// -------------------------------------------------------------------------- //

extension ObjectWrapper : Equatable {
  
  @inlinable
  public static func ==(
    lhs: ObjectWrapper<WrappedObject>,
    rhs: ObjectWrapper<WrappedObject>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.objectIdentifier == rhs.objectIdentifier
  }

}

// -------------------------------------------------------------------------- //
// MARK: ObjectWrapper - Comparable
// -------------------------------------------------------------------------- //

extension ObjectWrapper : Comparable {
  
  @inlinable
  public static func <(
    lhs: ObjectWrapper<WrappedObject>,
    rhs: ObjectWrapper<WrappedObject>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.objectIdentifier < rhs.objectIdentifier
  }

  @inlinable
  public static func >(
    lhs: ObjectWrapper<WrappedObject>,
    rhs: ObjectWrapper<WrappedObject>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.objectIdentifier > rhs.objectIdentifier
  }

  @inlinable
  public static func <=(
    lhs: ObjectWrapper<WrappedObject>,
    rhs: ObjectWrapper<WrappedObject>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.objectIdentifier <= rhs.objectIdentifier
  }
  
  @inlinable
  public static func >=(
    lhs: ObjectWrapper<WrappedObject>,
    rhs: ObjectWrapper<WrappedObject>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.objectIdentifier >= rhs.objectIdentifier
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectWrapper - Hashable
// -------------------------------------------------------------------------- //

extension ObjectWrapper : Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.objectIdentifier.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectWrapper - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension ObjectWrapper : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "\(String(describing: self.objectIdentifier)) (\(String(describing: self.wrappedObject)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectWrapper - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension ObjectWrapper : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "ObjectWrapper<\(String(reflecting: WrappedObject.self))>(wrappedObject: \(String(reflecting: self.wrappedObject)), objectIdentifier: \(String(reflecting: self.objectIdentifier)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectWrapper - Codable
// -------------------------------------------------------------------------- //

extension ObjectWrapper : Codable where WrappedObject : Codable {

  // synthesized ok
  
}
