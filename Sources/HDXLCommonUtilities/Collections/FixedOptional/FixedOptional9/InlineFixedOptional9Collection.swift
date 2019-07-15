//
//  InlineFixedOptional9Collection.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: InlineFixedOptional9Collection - Definition
// -------------------------------------------------------------------------- //

public struct InlineFixedOptional9Collection<Element> {
  
  public var a: Element?
  public var b: Element?
  public var c: Element?
  public var d: Element?
  public var e: Element?
  public var f: Element?
  public var g: Element?
  public var h: Element?
  public var i: Element?
  
  @inlinable
  public init(
    _ a: Element?,
    _ b: Element?,
    _ c: Element?,
    _ d: Element?,
    _ e: Element?,
    _ f: Element?,
    _ g: Element?,
    _ h: Element?,
    _ i: Element?) {
    self.a = a
    self.b = b
    self.c = c
    self.d = d
    self.e = e
    self.f = f
    self.g = g
    self.h = h
    self.i = i
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: InlineFixed9Collection - Reflection Support
// ------------------------------------------------------------------------ //

internal extension InlineFixedOptional9Collection {
  
  @usableFromInline
  static var shortTypeName: String {
    get {
      return "InlineFixedOptional9Collection"
    }
  }
  
  @usableFromInline
  static var completeTypeName: String {
    get {
      return "\(self.shortTypeName)<\(self.typeParameterNames)>"
    }
  }
  
  @usableFromInline
  static var typeParameterNames: String {
    get {
      return String(reflecting: Element.self)
    }
  }
  
  @usableFromInline
  var parameterDescriptions: String {
    get {
      return [
        String(reflecting: self.a),
        String(reflecting: self.b),
        String(reflecting: self.c),
        String(reflecting: self.d),
        String(reflecting: self.e),
        String(reflecting: self.f),
        String(reflecting: self.g),
        String(reflecting: self.h),
        String(reflecting: self.i)
        ].joined(separator: ", ")
      
    }
  }
  
  @usableFromInline
  var parameterDebugDescriptions: String {
    get {
      return [
        "a: \(String(reflecting: self.a))",
        "b: \(String(reflecting: self.b))",
        "c: \(String(reflecting: self.c))",
        "d: \(String(reflecting: self.d))",
        "e: \(String(reflecting: self.e))",
        "f: \(String(reflecting: self.f))",
        "g: \(String(reflecting: self.g))",
        "h: \(String(reflecting: self.h))",
        "i: \(String(reflecting: self.i))"
        ].joined(separator: ", ")
      
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: InlineFixedOptional9Collection - With Derivation
// -------------------------------------------------------------------------- //

public extension InlineFixedOptional9Collection {
  
  @inlinable
  func with(a: Element?) -> InlineFixedOptional9Collection<Element> {
    return InlineFixedOptional9Collection(
      a,
      b,
      c,
      d,
      e,
      f,
      g,
      h,
      i
    )
  }
  
  @inlinable
  func with(b: Element?) -> InlineFixedOptional9Collection<Element> {
    return InlineFixedOptional9Collection(
      a,
      b,
      c,
      d,
      e,
      f,
      g,
      h,
      i
    )
  }
  
  @inlinable
  func with(c: Element?) -> InlineFixedOptional9Collection<Element> {
    return InlineFixedOptional9Collection(
      a,
      b,
      c,
      d,
      e,
      f,
      g,
      h,
      i
    )
  }
  
  @inlinable
  func with(d: Element?) -> InlineFixedOptional9Collection<Element> {
    return InlineFixedOptional9Collection(
      a,
      b,
      c,
      d,
      e,
      f,
      g,
      h,
      i
    )
  }
  
  @inlinable
  func with(e: Element?) -> InlineFixedOptional9Collection<Element> {
    return InlineFixedOptional9Collection(
      a,
      b,
      c,
      d,
      e,
      f,
      g,
      h,
      i
    )
  }
  
  @inlinable
  func with(f: Element?) -> InlineFixedOptional9Collection<Element> {
    return InlineFixedOptional9Collection(
      a,
      b,
      c,
      d,
      e,
      f,
      g,
      h,
      i
    )
  }
  
  @inlinable
  func with(g: Element?) -> InlineFixedOptional9Collection<Element> {
    return InlineFixedOptional9Collection(
      a,
      b,
      c,
      d,
      e,
      f,
      g,
      h,
      i
    )
  }
  
  @inlinable
  func with(h: Element?) -> InlineFixedOptional9Collection<Element> {
    return InlineFixedOptional9Collection(
      a,
      b,
      c,
      d,
      e,
      f,
      g,
      h,
      i
    )
  }
  
  @inlinable
  func with(i: Element?) -> InlineFixedOptional9Collection<Element> {
    return InlineFixedOptional9Collection(
      a,
      b,
      c,
      d,
      e,
      f,
      g,
      h,
      i
    )
  }
    
}

// -------------------------------------------------------------------------- //
// MARK: InlineFixedOptional9Collection - Equatable
// -------------------------------------------------------------------------- //

extension InlineFixedOptional9Collection : Equatable where Element:Equatable {
  
  @inlinable
  public static func ==(
    lhs: InlineFixedOptional9Collection<Element>,
    rhs: InlineFixedOptional9Collection<Element>) -> Bool {
    guard
      lhs.a == rhs.a,
      lhs.b == rhs.b,
      lhs.c == rhs.c,
      lhs.d == rhs.d,
      lhs.e == rhs.e,
      lhs.f == rhs.f,
      lhs.g == rhs.g,
      lhs.h == rhs.h,
      lhs.i == rhs.i else {
        return false
    }
    return true
  }
  
  @inlinable
  public static func !=(
    lhs: InlineFixedOptional9Collection<Element>,
    rhs: InlineFixedOptional9Collection<Element>) -> Bool {
    guard
      lhs.a == rhs.a,
      lhs.b == rhs.b,
      lhs.c == rhs.c,
      lhs.d == rhs.d,
      lhs.e == rhs.e,
      lhs.f == rhs.f,
      lhs.g == rhs.g,
      lhs.h == rhs.h,
      lhs.i == rhs.i else {
        return true
    }
    return false
  }
  
}


// -------------------------------------------------------------------------- //
// MARK: InlineFixedOptional9Collection - Hashable
// -------------------------------------------------------------------------- //

extension InlineFixedOptional9Collection : Hashable where Element:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.a.hash(into: &hasher)
    self.b.hash(into: &hasher)
    self.c.hash(into: &hasher)
    self.d.hash(into: &hasher)
    self.e.hash(into: &hasher)
    self.f.hash(into: &hasher)
    self.g.hash(into: &hasher)
    self.h.hash(into: &hasher)
    self.i.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: InlineFixedOptional9Collection - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension InlineFixedOptional9Collection : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "(\(self.parameterDescriptions))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: InlineFixedOptional9Collection - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension InlineFixedOptional9Collection : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.parameterDebugDescriptions))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: InlineFixedOptional9Collection - Codable
// -------------------------------------------------------------------------- //

extension InlineFixedOptional9Collection : Codable where Element:Codable {
  
  // synthesized ok
  
}


// -------------------------------------------------------------------------- //
// MARK: InlineFixedOptional9Collection - RandomAccessCollection
// -------------------------------------------------------------------------- //

extension InlineFixedOptional9Collection : RandomAccessCollection {
  
  public typealias Index = FixedOptional9CollectionIndex
  
  @inlinable
  public var isEmpty: Bool {
    get {
      switch (self.a,self.b,self.c,self.d,self.e,self.f,self.g,self.h,self.i) {
      case (.none,.none,.none,.none,.none,.none,.none,.none,.none):
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
          +
          self.d.oneIfNotNil
          +
          self.e.oneIfNotNil
          +
          self.f.oneIfNotNil
          +
          self.g.oneIfNotNil
          +
          self.h.oneIfNotNil
          +
          self.i.oneIfNotNil
      )
    }
  }
  
  @usableFromInline
  internal typealias Position = FixedOptional9CollectionPosition
  
  @usableFromInline
  internal var firstSubscriptablePosition: Position? {
    get {
      // TODO: use indexed final non-nil
      if self.a != nil {
        return .a
      } else if self.b != nil {
        return .b
      } else if self.c != nil {
        return .c
      } else if self.d != nil {
        return .d
      } else if self.e != nil {
        return .e
      } else if self.f != nil {
        return .f
      } else if self.g != nil {
        return .g
      } else if self.h != nil {
        return .h
      } else if self.i != nil {
        return .i
      } else {
        return nil
      }
    }
  }
  
  @usableFromInline
  internal var finalSubscriptablePosition: Position? {
    get {
      // TODO: use indexed final non-nil
      if self.i != nil {
        return .i
      } else if self.h != nil {
        return .h
      } else if self.g != nil {
        return .g
      } else if self.f != nil {
        return .f
      } else if self.e != nil {
        return .e
      } else if self.d != nil {
        return .d
      } else if self.c != nil {
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
  
  @usableFromInline
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
      if self.d != nil {
        return .d
      }
      fallthrough
    case .d:
      if self.e != nil {
        return .e
      }
      fallthrough
    case .e:
      if self.f != nil {
        return .f
      }
      fallthrough
    case .f:
      if self.g != nil {
        return .g
      }
      fallthrough
    case .g:
      if self.h != nil {
        return .h
      }
      fallthrough
    case .h:
      if self.i != nil {
        return .i
      }
      fallthrough
    case .i:
      return nil
    }
  }
  
  @usableFromInline
  internal func subscriptablePosition(before position: Position) -> Position? {
    switch position {
    case .i:
      if self.h != nil {
        return .h
      }
      fallthrough
    case .h:
      if self.g != nil {
        return .g
      }
      fallthrough
    case .g:
      if self.f != nil {
        return .f
      }
      fallthrough
    case .f:
      if self.e != nil {
        return .e
      }
      fallthrough
    case .e:
      if self.d != nil {
        return .d
      }
      fallthrough
    case .d:
      if self.c != nil {
        return .c
      }
      fallthrough
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
  
  @usableFromInline
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
      case .d:
        guard let element = self.d else {
          preconditionFailure("Internal inconsistency: subscripted missing-position `.d` in \(String(reflecting: self))!")
        }
        return element
      case .e:
        guard let element = self.e else {
          preconditionFailure("Internal inconsistency: subscripted missing-position `.e` in \(String(reflecting: self))!")
        }
        return element
      case .f:
        guard let element = self.f else {
          preconditionFailure("Internal inconsistency: subscripted missing-position `.f` in \(String(reflecting: self))!")
        }
        return element
      case .g:
        guard let element = self.g else {
          preconditionFailure("Internal inconsistency: subscripted missing-position `.g` in \(String(reflecting: self))!")
        }
        return element
      case .h:
        guard let element = self.h else {
          preconditionFailure("Internal inconsistency: subscripted missing-position `.h` in \(String(reflecting: self))!")
        }
        return element
      case .i:
        guard let element = self.i else {
          preconditionFailure("Internal inconsistency: subscripted missing-position `.i` in \(String(reflecting: self))!")
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

