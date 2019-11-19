//
//  MobiusTransformation.swift
//

import Foundation
import Numerics

// -------------------------------------------------------------------------- //
// MARK: MobiusTransformation - Definition
// -------------------------------------------------------------------------- //

/// Prototype implementation of a `MobiusTransformation`.
public struct MobiusTransformation<Representation:Real> {
  
  public var a: Complex<Representation>
  public var b: Complex<Representation>
  public var c: Complex<Representation>
  public var d: Complex<Representation>
  
  @inlinable
  public init(
    a: Complex<Representation>,
    b: Complex<Representation>,
    c: Complex<Representation>,
    d: Complex<Representation>) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(a.isFinite)
    pedantic_assert(b.isFinite)
    pedantic_assert(c.isFinite)
    pedantic_assert(d.isFinite)
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self.a = a
    self.b = b
    self.c = c
    self.d = d
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: MobiusTransformation - Convenience Constructors
// -------------------------------------------------------------------------- //

public extension MobiusTransformation {
  
  @inlinable
  init(
    preimageOfZero z1: Complex<Representation>,
    one z2: Complex<Representation>,
    infinity z3: Complex<Representation>) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(allArgumentsDistinct(z1,z2,z3))
    // /////////////////////////////////////////////////////////////////////////
    self.init(
      a: z2 - z3,
      b: -(z1 * (z2 - z3)),
      c: z2 - z1,
      d: -(z3 * (z2 - z1))
    )
  }
  
  ///
  /// - note: Temporary API; if experiment works out will reify these triples to a type for better interpolation.
  ///
  @inlinable
  init(
    sending zs: (Complex<Representation>, Complex<Representation>, Complex<Representation>),
    to ws: (Complex<Representation>, Complex<Representation>, Complex<Representation>)) {
    self.init(
      z1: zs.0,
      z2: zs.1,
      z3: zs.2,
      w1: ws.0,
      w2: ws.1,
      w3: ws.2
    )
  }
  
  /// Package-internal helper with the actual implementation of `init(sending:to:)`.
  ///
  /// Relies upon several purpose-built internal helpers, and in particular the
  /// internal-use-only `SymbolicCoefficient` type defined below (and specifically
  /// for this method); note that within *this* method it's abbreviated to `SC`,
  ///
  /// Conceptually, given proper triples `(z1, z2, z3)` and `(w1, w2, w3)` then
  /// there is *exactly* one mobius transformation sending each `z` to the corresponding
  /// `w`; citing wikipedia, there's an *almost* plug-and-chug formula for the
  /// transformation's `a`, `b`, `c`, and `d`.
  ///
  /// The wrinkle is handling infinity: the `z`s and `w`s could each contain infinity,
  /// and--further--specifying the point that gets sent to infinity is actually a rather
  /// likely thing to do (or at least something I *expect* to do for my own purposes).
  ///
  /// The way to handle this is to use the symbolic formulas as-written, but *after* (a)
  /// dividing by the infinite variables (and then taking the limit). Although in theory
  /// we can't just "divide our matrix coefficients by infinity", in this case  we actually
  /// can (as long we exercise a bit of caution).
  ///
  ///
  @inlinable
  internal init(
    z1: Complex<Representation>,
    z2: Complex<Representation>,
    z3: Complex<Representation>,
    w1: Complex<Representation>,
    w2: Complex<Representation>,
    w3: Complex<Representation>) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(allArgumentsDistinct(z1,z2,z3))
    pedantic_assert(allArgumentsDistinct(w1,w2,w3))
    // /////////////////////////////////////////////////////////////////////////
    let zInfinityCount = countOfInfinity(z1,z2,z3)
    let wInfinityCount = countOfInfinity(z1,z2,z3)
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert((0...1).contains(zInfinityCount))
    pedantic_assert((0...1).contains(wInfinityCount))
    // /////////////////////////////////////////////////////////////////////////
    
    let infinityCount = zInfinityCount + wInfinityCount
    
    let a:Complex<Representation> = threeXThreeDeterminant(
      SC(z1, w1), SC(w1), SC(.one),
      SC(z2, w2), SC(w2), SC(.one),
      SC(z3, w3), SC(w3), SC(.one),
      afterDivisionByInfinityCount: infinityCount
    )

    let b:Complex<Representation> = threeXThreeDeterminant(
      SC(z1, w1), SC(z1), SC(w1),
      SC(z2, w2), SC(z2), SC(w2),
      SC(z3, w3), SC(z3), SC(w3),
      afterDivisionByInfinityCount: infinityCount
    )

    let c:Complex<Representation> = threeXThreeDeterminant(
      SC(z1), SC(w1), SC(.one),
      SC(z2), SC(w2), SC(.one),
      SC(z3), SC(w3), SC(.one),
      afterDivisionByInfinityCount: infinityCount
    )

    let d:Complex<Representation> = threeXThreeDeterminant(
      SC(z1, w1), SC(z1), SC(.one),
      SC(z2, w2), SC(z2), SC(.one),
      SC(z3, w3), SC(z3), SC(.one),
      afterDivisionByInfinityCount: infinityCount
    )
    
    self.init(
      a: a,
      b: b,
      c: c,
      d: d
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: MobiusTransformation - Basic API
// -------------------------------------------------------------------------- //

public extension MobiusTransformation {
  
  @inlinable
  func apply(to value: Complex<Representation>) -> Complex<Representation> {
    let upper = (self.a * value) + b
    let lower = (self.c * value) + d
    return upper/lower
  }
  
  // TODO: bulk-application wherein we use the currently-named `reciprocal` API
  // to selectively do it as "(1/lower) * upper(x)" (more or less).
  
}

// -------------------------------------------------------------------------- //
// MARK: MobiusTransformation - Core Properties
// -------------------------------------------------------------------------- //

public extension MobiusTransformation {
  
  @inlinable
  var isIdentity: Bool {
    get {
      guard
        self.a.isOne,
        self.b.isZero,
        self.c.isZero,
        self.d.isOne else {
          return false
      }
      return true
    }
  }
  
  @inlinable
  static var identity: MobiusTransformation<Representation> {
    get {
      return MobiusTransformation<Representation>(
        a: Complex<Representation>.one,
        b: Complex<Representation>.zero,
        c: Complex<Representation>.zero,
        d: Complex<Representation>.one
      )
    }
  }
  
  /// The determinant of `self` (when represented as a 2x2 matrix in the standard way).
  @inlinable
  var determinant: Complex<Representation> {
    get {
      return (self.a * self.d) - (self.b * self.c)
    }
  }
  
  /// The trace of `self` (when represented as a 2x2 matrix in the standard way).
  @inlinable
  var trace: Complex<Representation> {
    get {
      return self.a + self.d
    }
  }
  
  /// Preimage of `∞` under `self` (e.g. "point that `self` sends *to* `∞`).
  @inlinable
  var pole: Complex<Representation> {
    get {
      return -(self.d/self.c)
    }
  }
  
  /// Image of `∞` under `self` (e.g. "point *to which* `self` sends `∞`).
  @inlinable
  var inversePole: Complex<Representation> {
    get {
      return self.a/self.c
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: MobiusTransformation - Manipulation API
// -------------------------------------------------------------------------- //

public extension MobiusTransformation {
  
  // ------------------------------------------------------------------------ //
  // MARK: Inversion
  // ------------------------------------------------------------------------ //
  
  @inlinable
  var inverted: MobiusTransformation<Representation> {
    get {
      // ///////////////////////////////////////////////////////////////////////
      pedantic_assert(self.isValid)
      // ///////////////////////////////////////////////////////////////////////
      return MobiusTransformation<Representation>(
        a: self.d,
        b: -self.b,
        c: -self.c,
        d: self.a
      )
    }
  }
  
  @inlinable
  mutating func formInverse() {
    // ///////////////////////////////////////////////////////////////////////
    pedantic_assert(self.isValid)
    // ///////////////////////////////////////////////////////////////////////
    swap(&self.a,&self.d)
    self.b.negate()
    self.c.negate()
  }

  // ------------------------------------------------------------------------ //
  // MARK: Canonicalization
  // ------------------------------------------------------------------------ //

  @inlinable
  var canonicalized: MobiusTransformation<Representation> {
    get {
      // ///////////////////////////////////////////////////////////////////////
      pedantic_assert(self.isValid)
      // ///////////////////////////////////////////////////////////////////////
      return MobiusTransformation<Representation>(
        a: self.a.canonicalized,
        b: self.b.canonicalized,
        c: self.c.canonicalized,
        d: self.d.canonicalized
      )
    }
  }
  
  @inlinable
  mutating func formCanonicalization() {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(self.isValid)
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self.a.formCanonicalization()
    self.b.formCanonicalization()
    self.c.formCanonicalization()
    self.d.formCanonicalization()
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: MobiusTransformation - Validatable
// -------------------------------------------------------------------------- //

extension MobiusTransformation : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      guard
        self.a.isFinite,
        self.b.isFinite,
        self.c.isFinite,
        self.d.isFinite,
        self.determinant.isFiniteNonZero else {
          return false
      }
      return true
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: MobiusTransformation - Equatable
// -------------------------------------------------------------------------- //

extension MobiusTransformation : Equatable {
  
  @inlinable
  public static func ==(
    lhs: MobiusTransformation<Representation>,
    rhs: MobiusTransformation<Representation>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    guard
      lhs.a == rhs.a,
      lhs.b == rhs.b,
      lhs.c == rhs.c,
      lhs.d == rhs.d else {
        return false
    }
    return true
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: MobiusTransformation - Hashable
// -------------------------------------------------------------------------- //

extension MobiusTransformation : Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.a.hash(into: &hasher)
    self.b.hash(into: &hasher)
    self.c.hash(into: &hasher)
    self.d.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: MobiusTransformation - Codable
// -------------------------------------------------------------------------- //

extension MobiusTransformation : Codable where Representation : Codable {
  
}


// -------------------------------------------------------------------------- //
// MARK: MobiusTransformation.PreimagesOf - Validatable
// -------------------------------------------------------------------------- //

// MARK: Complex - Missing API

@usableFromInline
internal func canonicalizing<R:Real>(_ work: () throws -> Complex<R>) rethrows -> Complex<R> {
  let result = try work()
  return result.canonicalized
}

internal extension Complex {
  
  @usableFromInline
  enum Characterization {
    case zero
    case infinity
    case finiteNonZero(RealType,RealType)
  }

  @usableFromInline
  enum CharacterizationType {
    case zero
    case infinity
    case finiteNonZero
  }
  
  @inlinable
  var isOnRiemannSphere: Bool {
    get {
      // note: all combos of `infinity` and `nan` are equally the point at infinity
      return true
    }
  }

  @inlinable
  var isFiniteNonZero: Bool {
    get {
      guard
        self.isFinite,
        self.isNonZero else {
          return false
      }
      return true
    }
  }
  
  @inlinable
  var isNonZero: Bool {
    get {
      return !self.isZero
    }
  }
  
  @inlinable
  var isOne: Bool {
    get {
      return self == .one
    }
  }
  
  @inlinable
  mutating func negate() {
    self = -self
  }
  
  @inlinable
  var characterizationType: CharacterizationType {
    get {
      guard self.isNonZero else {
        return .zero
      }
      guard self.isFinite else {
        return .infinity
      }
      return .finiteNonZero
    }
  }
  
  @inlinable
  mutating func formCanonicalization() {
    switch self.characterizationType {
    case .zero:
      self = Self.zero
    case .infinity:
      self = Self.infinity
    case .finiteNonZero:
      self *= 1
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: MobiusTransformation - SymbolicCoefficient
// -------------------------------------------------------------------------- //

internal extension MobiusTransformation {
  
  @usableFromInline
  typealias SC = SymbolicCoefficient
  
  @usableFromInline
  enum SymbolicCoefficient {
    case simple(Complex<Representation>)
    case product(Complex<Representation>, Complex<Representation>)
    
    @inlinable
    init(_ coefficient: Complex<Representation>) {
      self = .simple(coefficient)
    }
    
    @inlinable
    init(_ lhs: Complex<Representation>, _ rhs: Complex<Representation>) {
      self = .product(lhs, rhs)
    }
    
    @inlinable
    var infinityCount: Int {
      get {
        switch self {
        case .simple(let value):
          return countOfInfinity(value)
        case .product(let lhs, let rhs):
          return countOfInfinity(lhs, rhs)
        }
      }
    }
    
    @inlinable
    var directRealization: Complex<Representation> {
      get {
        switch self {
        case .simple(let value):
          precondition(value.isFinite)
          return value
        case .product(let lhs, let rhs):
          precondition(lhs.isFinite)
          precondition(rhs.isFinite)
          return lhs * rhs
        }
      }
    }
    
    
    @inlinable
    func realized(afterDivisionByInfinityCount divisionInfinityCount: Int) -> Complex<Representation> {
      precondition((0...2).contains(divisionInfinityCount))
      precondition(self.infinityCount <= divisionInfinityCount)
      guard divisionInfinityCount > 0 else {
        return self.directRealization
      }
      switch self.infinityCount <=> divisionInfinityCount {
      case .orderedAscending:
        // dividing by more infinity than we have
        return Complex<Representation>.zero
      case .orderedSame:
        switch self {
        case .simple(let value):
          // ///////////////////////////////////////////////////////////////////
          pedantic_assert(!value.isFinite)
          // ///////////////////////////////////////////////////////////////////
          return Complex<Representation>.one
        case .product(let lhs, let rhs):
          // ///////////////////////////////////////////////////////////////////
          pedantic_assert(lhs.isFinite || rhs.isFinite)
          // ///////////////////////////////////////////////////////////////////
          return firstFiniteValue(lhs, rhs) ?? Complex<Representation>.one
        }
      case .orderedDescending:
        preconditionFailure(
          """
          Shouldn't actually hit this branch: all symbolic coefficients *in intended use* will have `infinityCount` <= the `divisionInfinityCount`.
          """
        )
      }
    }
  }
  
}

@inlinable
internal func countOfInfinity<R:Real>(
  _ a: Complex<R>) -> Int {
  return countOfFalse(
    a.isFinite
  )
}

@inlinable
internal func countOfInfinity<R:Real>(
  _ a: Complex<R>,
  _ b: Complex<R>) -> Int {
  return countOfFalse(
    a.isFinite,
    b.isFinite
  )
}

@inlinable
internal func countOfInfinity<R:Real>(
  _ a: Complex<R>,
  _ b: Complex<R>,
  _ c: Complex<R>) -> Int {
  return countOfFalse(
    a.isFinite,
    b.isFinite,
    c.isFinite
  )
}

@inlinable
internal func firstFiniteValue<R:Real>(
  _ a: Complex<R>,
  _ b: Complex<R>) -> Complex<R>? {
  if a.isFinite {
    return a
  } else if b.isFinite {
    return b
  } else {
    return nil
  }
}

@inlinable
internal func twoXTwoDeterminant<T:SignedNumeric>(
  _ x11: T, _ x12: T,
  _ x21: T, _ x22: T) -> T {
  return x11 * x22 - x12 * x21
}

@inlinable
internal func threeXThreeDeterminant<T:SignedNumeric>(
  _ x11: T, _ x12: T, _ x13: T,
  _ x21: T, _ x22: T, _ x23: T,
  _ x31: T, _ x32: T, _ x33: T) -> T {
  let x11Contribution = x11 * twoXTwoDeterminant(
    x22, x23,
    x32, x33
  )
  let x12Contribution = -x12 * twoXTwoDeterminant(
    x21, x23,
    x31, x33
  )
  let x13Contribution = x13 * twoXTwoDeterminant(
    x21, x22,
    x31, x32
  )
  return (
    x11Contribution
    +
    x12Contribution
    +
    x13Contribution
  )
}

@inlinable
internal func threeXThreeDeterminant<R:Real>(
  _ x11: MobiusTransformation<R>.SymbolicCoefficient,
  _ x12: MobiusTransformation<R>.SymbolicCoefficient,
  _ x13: MobiusTransformation<R>.SymbolicCoefficient,
  _ x21: MobiusTransformation<R>.SymbolicCoefficient,
  _ x22: MobiusTransformation<R>.SymbolicCoefficient,
  _ x23: MobiusTransformation<R>.SymbolicCoefficient,
  _ x31: MobiusTransformation<R>.SymbolicCoefficient,
  _ x32: MobiusTransformation<R>.SymbolicCoefficient,
  _ x33: MobiusTransformation<R>.SymbolicCoefficient,
  afterDivisionByInfinityCount divisionInfinityCount: Int) -> Complex<R> {
  return threeXThreeDeterminant(
    x11.realized(afterDivisionByInfinityCount: divisionInfinityCount),
    x12.realized(afterDivisionByInfinityCount: divisionInfinityCount),
    x13.realized(afterDivisionByInfinityCount: divisionInfinityCount),
    x21.realized(afterDivisionByInfinityCount: divisionInfinityCount),
    x22.realized(afterDivisionByInfinityCount: divisionInfinityCount),
    x23.realized(afterDivisionByInfinityCount: divisionInfinityCount),
    x31.realized(afterDivisionByInfinityCount: divisionInfinityCount),
    x32.realized(afterDivisionByInfinityCount: divisionInfinityCount),
    x33.realized(afterDivisionByInfinityCount: divisionInfinityCount)
  )
}
