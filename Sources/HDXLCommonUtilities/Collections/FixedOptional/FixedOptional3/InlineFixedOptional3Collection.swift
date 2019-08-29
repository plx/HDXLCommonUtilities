//
//  InlineFixedOptional3Collection.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: InlineFixedOptional3Collection - Definition
// -------------------------------------------------------------------------- //

public struct InlineFixedOptional3Collection<Element> {
  
  public var a: Element?
  public var b: Element?
  public var c: Element?
  
  @inlinable
  public init(
    _ a: Element?,
    _ b: Element?,
    _ c: Element?) {
    self.a = a
    self.b = b
    self.c = c
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: InlineFixed9Collection - Reflection Support
// ------------------------------------------------------------------------ //

internal extension InlineFixedOptional3Collection {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "InlineFixedOptional3Collection"
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
        String(reflecting: self.b),
        String(reflecting: self.c)
        ].joined(separator: ", ")
      
    }
  }
  
  @inlinable
  var parameterDebugDescriptions: String {
    get {
      return [
        "a: \(String(reflecting: self.a))",
        "b: \(String(reflecting: self.b))",
        "c: \(String(reflecting: self.c))"
        ].joined(separator: ", ")
      
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: InlineFixedOptional3Collection - With Derivation
// -------------------------------------------------------------------------- //

public extension InlineFixedOptional3Collection {
  
  @inlinable
  func with(a: Element?) -> InlineFixedOptional3Collection<Element> {
    return InlineFixedOptional3Collection(
      a,
      b,
      c
    )
  }
  
  @inlinable
  func with(b: Element?) -> InlineFixedOptional3Collection<Element> {
    return InlineFixedOptional3Collection(
      a,
      b,
      c
    )
  }
  
  @inlinable
  func with(c: Element?) -> InlineFixedOptional3Collection<Element> {
    return InlineFixedOptional3Collection(
      a,
      b,
      c
    )
  }
      
}

// -------------------------------------------------------------------------- //
// MARK: InlineFixedOptional3Collection - Equatable
// -------------------------------------------------------------------------- //

extension InlineFixedOptional3Collection : Equatable where Element:Equatable {
  
  @inlinable
  public static func ==(
    lhs: InlineFixedOptional3Collection<Element>,
    rhs: InlineFixedOptional3Collection<Element>) -> Bool {
    guard
      lhs.a == rhs.a,
      lhs.b == rhs.b,
      lhs.c == rhs.c else {
        return false
    }
    return true
  }
  
  @inlinable
  public static func !=(
    lhs: InlineFixedOptional3Collection<Element>,
    rhs: InlineFixedOptional3Collection<Element>) -> Bool {
    guard
      lhs.a == rhs.a,
      lhs.b == rhs.b,
      lhs.c == rhs.c else {
        return true
    }
    return false
  }
  
}


// -------------------------------------------------------------------------- //
// MARK: InlineFixedOptional3Collection - Hashable
// -------------------------------------------------------------------------- //

extension InlineFixedOptional3Collection : Hashable where Element:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.a.hash(into: &hasher)
    self.b.hash(into: &hasher)
    self.c.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: InlineFixedOptional3Collection - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension InlineFixedOptional3Collection : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "(\(self.parameterDescriptions))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: InlineFixedOptional3Collection - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension InlineFixedOptional3Collection : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.parameterDebugDescriptions))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: InlineFixedOptional3Collection - Codable
// -------------------------------------------------------------------------- //

extension InlineFixedOptional3Collection : Codable where Element:Codable {
  
  // synthesized ok
  
}


// -------------------------------------------------------------------------- //
// MARK: InlineFixedOptional3Collection - RandomAccessCollection
// -------------------------------------------------------------------------- //

extension InlineFixedOptional3Collection : RandomAccessCollection {
  
  public typealias Index = FixedOptional3CollectionIndex
  
  @inlinable
  public var isEmpty: Bool {
    get {
      switch (self.a,self.b,self.c) {
      case (.none,.none,.none):
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
        +
        self.c.oneIfNotNil
      )
    }
  }
  
  @usableFromInline
  internal typealias Position = FixedOptional3CollectionPosition
  
  @inlinable
  internal var firstSubscriptablePosition: Position? {
    get {
      // TODO: use indexed final non-nil
      if self.a != nil {
        return .a
      } else if self.b != nil {
        return .b
      } else if self.c != nil {
        return .c
      } else {
        return nil
      }
    }
  }
  
  @inlinable
  internal var finalSubscriptablePosition: Position? {
    get {
      // TODO: use indexed final non-nil
      if self.c != nil {
        return .c
      } else if self.b != nil {
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
      if self.c != nil {
        return .c
      }
      fallthrough
    case .c:
      return nil
    }
  }
  
  @inlinable
  internal func subscriptablePosition(before position: Position) -> Position? {
    switch position {
    case .c:
      if self.b != nil {
        return .b
      }
      fallthrough
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
      case .c:
        guard let element = self.c else {
          preconditionFailure("Internal inconsistency: subscripted missing-position `.c` in \(String(reflecting: self))!")
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
