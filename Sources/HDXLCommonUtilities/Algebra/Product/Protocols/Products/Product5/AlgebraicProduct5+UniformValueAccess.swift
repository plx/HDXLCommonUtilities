//
//  AlgebraicProduct5+UniformValueAccess.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct5 - Uniform Value Access
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct5
  where
  A == B,
  A == C,
  A == D,
  A == E {

  // ------------------------------------------------------------------------ //
  // MARK: Typealias
  // ------------------------------------------------------------------------ //
  
  /// Synonym for `A`, but makes it clear when we mean "the type of the uniform value".
  typealias UniformValue = A

  // ------------------------------------------------------------------------ //
  // MARK: Homogeneous Construction
  // ------------------------------------------------------------------------ //
  
  /// Constructs a product by "splatting" `value` into all positions.
  @inlinable
  init(bySplatting value: UniformValue) {
    self.init(
      value,
      value,
      value,
      value,
      value
    )
  }

  // ------------------------------------------------------------------------ //
  // MARK: Value Access
  // ------------------------------------------------------------------------ //

  /// The first, leftmost, etc., value within `self`.
  @inlinable
  var firstValue: UniformValue {
    get {
      return self.a
    }
    set {
      self.a = newValue
    }
  }
  
  /// The final, rightmost, etc., value within `self`.
  @inlinable
  var lastValue: UniformValue {
    get {
      return self.e
    }
    set {
      self.e = newValue
    }
  }
  
  /// Retrieves the contents of `self` as an `Array`.
  @inlinable
  var allValues: [UniformValue] {
    get {
      return [
        self.a,
        self.b,
        self.c,
        self.d,
        self.e
      ]
    }
  }

  // ------------------------------------------------------------------------ //
  // MARK: Integer-Subscript Support
  // ------------------------------------------------------------------------ //
  
  @inlinable
  internal static func canSubscript(at index: Int) -> Bool {
    return (0..<self.arity).contains(index)
  }
  
  @inlinable
  subscript(index: Int) -> UniformValue {
    get {
      precondition(Self.canSubscript(at: index))
      switch index {
        case 0:
          return self.a
        case 1:
          return self.b
        case 2:
          return self.c
        case 3:
          return self.d
        case 4:
          return self.e
      default:
        preconditionFailure("Used invalid `index` \(index) to subscript \(String(reflecting: self))!")
      }
    }
    set {
      precondition(Self.canSubscript(at: index))
      // ///////////////////////////////////////////////////////////////////////
      pedantic_assert(isValidOrIndifferent(newValue))
      pedantic_assert(self.isValid)
      defer { pedantic_assert(self.isValid) }
      // ///////////////////////////////////////////////////////////////////////
      switch index {
        case 0:
          self.a = newValue
        case 1:
          self.b = newValue
        case 2:
          self.c = newValue
        case 3:
          self.d = newValue
        case 4:
          self.e = newValue
        default:
          preconditionFailure("Used invalid `index` \(index) to subscript \(String(reflecting: self))!")
      }
    }
  }

  @inlinable
  func uniformValue(at index: Int) -> UniformValue {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(Self.canSubscript(at: index)) // we have a `precondition` already within the subscript
    // /////////////////////////////////////////////////////////////////////////
    return self[index]
  }

  @inlinable
  mutating func setUniformValue(
    _ value: UniformValue,
    at index: Int) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(Self.canSubscript(at: index)) // we have a `precondition` already within the subscript
    pedantic_assert(isValidOrIndifferent(value))
    // /////////////////////////////////////////////////////////////////////////
    self[index] = value
  }

  // ------------------------------------------------------------------------ //
  // MARK: Arity-Subscript Support
  // ------------------------------------------------------------------------ //
  
  @inlinable
  subscript(position: ArityPosition) -> UniformValue {
    get {
      switch position {
      case .a:
        return self.a
      case .b:
        return self.b
      case .c:
        return self.c
      case .d:
        return self.d
      case .e:
        return self.e
      }
    }
    set {
      // ///////////////////////////////////////////////////////////////////////
      pedantic_assert(isValidOrIndifferent(newValue))
      pedantic_assert(self.isValid)
      defer { pedantic_assert(self.isValid) }
      // ///////////////////////////////////////////////////////////////////////
      switch position {
      case .a:
        self.a = newValue
      case .b:
        self.b = newValue
      case .c:
        self.c = newValue
      case .d:
        self.d = newValue
      case .e:
        self.e = newValue
      }
    }
  }

  @inlinable
  func uniformValue(at position: ArityPosition) -> UniformValue {
    return self[position]
  }

  @inlinable
  mutating func setUniformValue(
    _ value: UniformValue,
    at position: ArityPosition) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(isValidOrIndifferent(value))
    // /////////////////////////////////////////////////////////////////////////
    self[position] = value
  }

  // ------------------------------------------------------------------------ //
  // MARK: Out-of-Place Pushes
  // ------------------------------------------------------------------------ //
  
  @inlinable
  func pushedLeftward(byAppending value: UniformValue) -> Self {
    return Self(
      self.b,
      self.c,
      self.d,
      self.e,
      value
    )
  }

  @inlinable
  func pushedRightward(byPrepending value: UniformValue) -> Self {
    return Self(
      value,
      self.a,
      self.b,
      self.c,
      self.d
    )
  }

  // ------------------------------------------------------------------------ //
  // MARK: In-Place Pushes
  // ------------------------------------------------------------------------ //
  
  @inlinable
  mutating func formLeftwardPush(byAppending value: UniformValue) {
    self.a = self.b
    self.b = self.c
    self.c = self.d
    self.d = self.e
    self.e = value
  }
  
  @inlinable
  mutating func formRightwardPush(byPrepending value: UniformValue) {
    self.b = self.a
    self.c = self.b
    self.d = self.c
    self.e = self.d
    self.a = value
  }

}

public extension Array {

  @inlinable
  init<T>(_ product: T)
    where
    T:AlgebraicProduct5,
    T.A == Element,
    T.B == Element,
    T.C == Element,
    T.D == Element,
    T.E == Element {
      self = product.allValues
  }
  
  
}
