//
//  InlineFixedOptional2Collection.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: InlineFixedOptional2Collection - Definition
// -------------------------------------------------------------------------- //

public struct InlineFixedOptional2Collection<Element> {
  
  public var a: Element?
  public var b: Element?
  
  @inlinable
  public init(
    _ a: Element?,
    _ b: Element?) {
    self.a = a
    self.b = b
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: InlineFixed9Collection - Reflection Support
// ------------------------------------------------------------------------ //

internal extension InlineFixedOptional2Collection {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "InlineFixedOptional2Collection"
    }
  }
  
  @inlinable
  static var completeTypeName: String {
    get {
      return "\(self.shortTypeName)<\(self.typeParameterNames)>"
    }
  }
  
  @inlinable
  static var typeParameterNames: String {
    get {
      return String(reflecting: Element.self)
    }
  }
  
  @inlinable
  var parameterDescriptions: String {
    get {
      return [
        String(reflecting: self.a),
        String(reflecting: self.b)
        ].joined(separator: ", ")
      
    }
  }
  
  @inlinable
  var parameterDebugDescriptions: String {
    get {
      return [
        "a: \(String(reflecting: self.a))",
        "b: \(String(reflecting: self.b))"
        ].joined(separator: ", ")
      
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: InlineFixedOptional2Collection - With Derivation
// -------------------------------------------------------------------------- //

public extension InlineFixedOptional2Collection {
  
  @inlinable
  func with(a: Element?) -> InlineFixedOptional2Collection<Element> {
    return InlineFixedOptional2Collection(
      a,
      b
    )
  }
  
  @inlinable
  func with(b: Element?) -> InlineFixedOptional2Collection<Element> {
    return InlineFixedOptional2Collection(
      a,
      b
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: InlineFixedOptional2Collection - Equatable
// -------------------------------------------------------------------------- //

extension InlineFixedOptional2Collection : Equatable where Element:Equatable {
  
  @inlinable
  public static func ==(
    lhs: InlineFixedOptional2Collection<Element>,
    rhs: InlineFixedOptional2Collection<Element>) -> Bool {
    guard
      lhs.a == rhs.a,
      lhs.b == rhs.b else {
        return false
    }
    return true
  }
  
  @inlinable
  public static func !=(
    lhs: InlineFixedOptional2Collection<Element>,
    rhs: InlineFixedOptional2Collection<Element>) -> Bool {
    guard
      lhs.a == rhs.a,
      lhs.b == rhs.b else {
        return true
    }
    return false
  }
  
}


// -------------------------------------------------------------------------- //
// MARK: InlineFixedOptional2Collection - Hashable
// -------------------------------------------------------------------------- //

extension InlineFixedOptional2Collection : Hashable where Element:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.a.hash(into: &hasher)
    self.b.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: InlineFixedOptional2Collection - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension InlineFixedOptional2Collection : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "(\(self.parameterDescriptions))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: InlineFixedOptional2Collection - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension InlineFixedOptional2Collection : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.parameterDebugDescriptions))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: InlineFixedOptional2Collection - Codable
// -------------------------------------------------------------------------- //

extension InlineFixedOptional2Collection : Codable where Element:Codable {
  
  // synthesized ok
  
}


// -------------------------------------------------------------------------- //
// MARK: InlineFixedOptional2Collection - RandomAccessCollection
// -------------------------------------------------------------------------- //

extension InlineFixedOptional2Collection : RandomAccessCollection {
  
  public typealias Index = FixedOptional2CollectionIndex
  
  @inlinable
  public var isEmpty: Bool {
    get {
      switch (self.a,self.b) {
      case (.none,.none):
        return true
      default:
        return false
      }
    }
  }
  
  @inlinable
  public var count: Int {
    get {
      return (
        self.a.oneIfNotNil
        +
        self.b.oneIfNotNil
      )
    }
  }
  
  @usableFromInline
  internal typealias Position = FixedOptional2CollectionPosition
  
  @inlinable
  internal var firstSubscriptablePosition: Position? {
    get {
      // TODO: use indexed final non-nil
      if self.a != nil {
        return .a
      } else if self.b != nil {
        return .b
      } else {
        return nil
      }
    }
  }
  
  @inlinable
  internal var finalSubscriptablePosition: Position? {
    get {
      // TODO: use indexed final non-nil
      if self.b != nil {
        return .b
      } else if self.a != nil {
        return .a
      } else {
        return nil
      }
    }
  }
  
  @inlinable
  internal func subscriptablePosition(after position: Position) -> Position? {
    switch position {
    case .a:
      if self.b != nil {
        return .b
      }
      fallthrough
    case .b:
      return nil
    }
  }
  
  @inlinable
  internal func subscriptablePosition(before position: Position) -> Position? {
    switch position {
    case .b:
      if self.a != nil {
        return .a
      }
      fallthrough
    case .a:
      return nil
    }
  }
  
  @inlinable
  public var startIndex: Index {
    get {
      guard let position = self.firstSubscriptablePosition else {
        return Index.endIndex
      }
      return Index(
        position: position
      )
    }
  }
  
  @inlinable
  public var endIndex: Index {
    get {
      return Index.endIndex
    }
  }
  
  @inlinable
  internal subscript(position: Position) -> Element {
    get{
      switch position {
      case .a:
        guard let element = self.a else {
          preconditionFailure("Internal inconsistency: subscripted missing-position `.a` in \(String(reflecting: self))!")
        }
        return element
      case .b:
        guard let element = self.b else {
          preconditionFailure("Internal inconsistency: subscripted missing-position `.b` in \(String(reflecting: self))!")
        }
        return element
      }
    }
  }
  
  @inlinable
  public subscript(index: Index) -> Element {
    get {
      switch index.storage {
      case .endIndex:
        preconditionFailure("Tried to subscript the end index!")
      case .position(let position):
        return self[position]
      }
    }
  }
  
  @inlinable
  public func index(after i: Index) -> Index {
    switch i.storage {
    case .endIndex:
      preconditionFailure("Tried to advance the end index!")
    case .position(let position):
      if let nextPosition = self.subscriptablePosition(after: position) {
        return Index(
          position: nextPosition
        )
      } else {
        return .endIndex
      }
    }
  }
  
  @inlinable
  public func index(before i: Index) -> Index {
    switch i.storage {
    case .endIndex:
      guard let previousPosition = self.finalSubscriptablePosition else {
        preconditionFailure("Tried to go bac kfrom the start index!")
      }
      return Index(
        position: previousPosition
      )
    case .position(let position):
      guard let previousPosition = self.subscriptablePosition(before: position) else {
        preconditionFailure("Tried to go back from the start index!")
      }
      return Index(
        position: previousPosition
      )
    }
  }
  
}

