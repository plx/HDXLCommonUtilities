//
//  MobiusTransformation.swift
//

import Foundation
import Numerics

// -------------------------------------------------------------------------- //
// MARK: MobiusTransformation - Definition
// -------------------------------------------------------------------------- //

/// Prototype implementation of a `MobiusTransformation`.
///
/// - note:
/// This looks suitable for `@frozen`, but there's a bit of caveat: numerical
/// issues could at times make it so that, e.g., transformation that's supposed
/// to send `z` to `infinity` only sends it to some very big number, instead; the
/// chain of events would be `c*z + d` *should* be `0` but is, say, `1.1214124124e-323`
/// (or some similar outcome, you get the idea).
///
/// As a temporary solution, there's the `applyWithFudging(to:fudgeFactor:)` that
/// "corrupts" the naive result around the preimage of infinity and, instead, sends
/// anything with sufficiently-small `c*z + d` to `infinity`. Not great, but good
/// enough to verify the gist of the implementation (and for my purposes, anything
/// sent to `infinity` will also be sent beyond (the edges of the screen), ergo
/// sending nearby points to very large numbers is good enough.
///
/// That said, though, an alternative approach for transformations constructed
/// to send specific `zs` to specific `ws` would be to preserve those `zs` and `ws`
/// and ahdnle them as special-case values. This concept is currently confined within
/// the type I'm calling `MobiusTransformationSpecification`, but after seeing this
/// type in practice I may decide that that specification type's fucntionality makes
/// for the better "fundamental primitive" (and, e.g., start treating `MobiusTransformation`
/// with the concrete `a`, `b`, `c`, and `d` as a borderline-private implementation
/// detail, generated only when necessary and otherwise *downstream* from that specification).
///
/// I won't know for sure until I have this in use in visual context *and* I
/// experiment with interpolation as I've been planning, so, for now, I don't
/// see myself making this type @frozen even though it looks as-if it could be.
///
public struct MobiusTransformation<Representation:Real> {

  // ------------------------------------------------------------------------ //
  // MARK: Exported Typealiases
  // ------------------------------------------------------------------------ //
  
  public typealias ComplexPair = (Complex<Representation>,Complex<Representation>)
  public typealias ComplexTriple = (Complex<Representation>,Complex<Representation>,Complex<Representation>)

  // ------------------------------------------------------------------------ //
  // MARK: Stored Properties
  // ------------------------------------------------------------------------ //
  
  public var a: Complex<Representation>
  public var b: Complex<Representation>
  public var c: Complex<Representation>
  public var d: Complex<Representation>

  // ------------------------------------------------------------------------ //
  // MARK: Primary Initialization
  // ------------------------------------------------------------------------ //

  /// Componentwise "designated initializer": the constructed transform will be
  /// equivalent-to `h(z) = (az + b)/(cz +d)`.
  ///
  /// - parameter a: The standard `a` coefficient.
  /// - parameter b: The standard `b` coefficient.
  /// - parameter c: The standard `c` coefficient.
  /// - parameter d: The standard `d` coefficient.
  ///
  /// - precondition: `a.isFinite`
  /// - precondition: `b.isFinite`
  /// - precondition: `c.isFinite`
  /// - precondition: `d.isFinite`
  /// - precondition: `a*d - b * c != 0`
  ///
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
  
  /// Internal helper type used to calculate `a`, `b`, `c`, and `d` given triples
  /// of `zs` and the corresponding `ws`.
  ///
  /// - todo: Change from typealias => proper use of nested types
  @usableFromInline
  internal typealias TargetingFormula = MobiusTransformationTargetingFormula<Representation>
  
  /// Constructs the one-and-only transformation sending each `z` in `zs` to the
  /// corresponding `w` in `ws`.
  ///
  /// - precondition: `zs` contains 3 *distinct* values
  /// - precondition: `ws` contains 3 *distinct* values
  ///
  /// - postcondition: `f(z.i) = w.i` for each valid i (really: approximately-equal...)
  ///
  @inlinable
  init(
    sending zs: ComplexTriple,
    to ws: ComplexTriple) {
    let parameters = TargetingFormula.calculateMobiusTransformationParameters(
      zs: zs,
      ws: ws
    )
    self.init(
      a: parameters.a,
      b: parameters.b,
      c: parameters.c,
      d: parameters.d
    )
  }
    
  @inlinable
  static func canConstructTransformation(
    sending zs: ComplexTriple,
    to ws: ComplexTriple) -> Bool {
    guard
      allArgumentsDistinct(zs.0,zs.1,zs.2),
      allArgumentsDistinct(ws.0,ws.1,ws.2),
      countOfTrue(
        zs.0 == ws.0,
        zs.1 == ws.1,
        zs.2 == ws.2
        ) <= 2 else {
          return false
    }
    return true
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: MobiusTransformation - Basic API
// -------------------------------------------------------------------------- //

public extension MobiusTransformation {

  @inlinable
  func applyWithFudging(
    to value: Complex<Representation>,
    fudgeFactor epsilon: Representation) -> Complex<Representation> {
    precondition(epsilon >= 0)
    switch value.isFinite {
    case true:
      let upper = (self.a * value) + self.b
      let lower = (self.c * value) + self.d
      let distanceFromLowerToZero = Complex<Representation>.infinityNormDistance(
        from: lower,
        to: .zero        
      )
      guard distanceFromLowerToZero >= epsilon else {
        // /////////////////////////////////////////////////////////////////////
        // if a z exists s.t. lower == upper == zero
        // z == -b/a == -d/c =>
        // b/a == d/c =>
        // cb == ad =>
        // ad - cb == 0,
        //
        // ...but recall that we require `ad-bc != 0` (and try to enforce @ type level).
        pedantic_assert(!upper.isZero)
        // /////////////////////////////////////////////////////////////////////
        return .infinity
      }
      return upper/lower
    case false:
      // *note*: at time of implementation, I believe that `self.a/self.c`
      // should "just work" identically to what we have below.
      //
      // I'm still making it explicit b/c (a) I initially didn't think of the
      // need to do special-handling for this case and (b) I don't want the
      // correctness of this case to hinge on what's currently a potentially-mutable
      // implementation detail of `Complex`.
      switch (self.a.isZero, self.c.isZero) {
      case (false,false):
        return self.a/self.c
      case (false,true):
        return .infinity
      case (true,false):
        return .zero
      case (true,true):
        preconditionFailure("Encountered invalid mobius transformation with `a` and `c` identically-zero")
      }
    }
  }

  @inlinable
  func apply(to value: Complex<Representation>) -> Complex<Representation> {
    switch value.isFinite {
    case true:
      let upper = (self.a * value) + self.b
      let lower = (self.c * value) + self.d
      // specio
      guard !lower.isZero else {
        // /////////////////////////////////////////////////////////////////////
        // if a z exists s.t. lower == upper == zero
        // z == -b/a == -d/c =>
        // b/a == d/c =>
        // cb == ad =>
        // ad - cb == 0,
        //
        // ...but recall that we require `ad-bc != 0` (and try to enforce @ type level).
        pedantic_assert(!upper.isZero)
        // /////////////////////////////////////////////////////////////////////
        return .infinity
      }
      return upper/lower
    case false:
      // *note*: at time of implementation, I believe that `self.a/self.c`
      // should "just work" identically to what we have below.
      //
      // I'm still making it explicit b/c (a) I initially didn't think of the
      // need to do special-handling for this case and (b) I don't want the
      // correctness of this case to hinge on what's currently a potentially-mutable
      // implementation detail of `Complex`.
      switch (self.a.isZero, self.c.isZero) {
      case (false,false):
        return self.a/self.c
      case (false,true):
        return .infinity
      case (true,false):
        return .zero
      case (true,true):
        preconditionFailure("Encountered invalid mobius transformation with `a` and `c` identically-zero")
      }
    }
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
// MARK: MobiusTransformation - Comparison API
// -------------------------------------------------------------------------- //

public extension MobiusTransformation {
  
  /// Simple distance calculation returning the largest absolute distance between the coefficients in `x` and `y`.
  @inlinable
  static func infinityNormDistance(
    from x: MobiusTransformation<Representation>,
    to y: MobiusTransformation<Representation>) -> Representation {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(x.isValid)
    pedantic_assert(y.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return max(
      Complex<Representation>.infinityNormDistance(
        from: x.a,
        to: y.a
      ),
      Complex<Representation>.infinityNormDistance(
        from: x.b,
        to: y.b
      ),
      Complex<Representation>.infinityNormDistance(
        from: x.c,
        to: y.c
      ),
      Complex<Representation>.infinityNormDistance(
        from: x.d,
        to: y.d
      )
    )
  }
  
  @inlinable
  func infinityNormDistance(to other: MobiusTransformation<Representation>) -> Representation {
    return MobiusTransformation<Representation>.infinityNormDistance(
      from: self,
      to: other
    )
  }
  
  @inlinable
  func hasInfinityNormDistance(
    strictlyLessThan epsilon: Representation,
    to other: MobiusTransformation<Representation>) -> Bool {
    pedantic_assert(epsilon >= 0)
    return self.infinityNormDistance(
      to: other
    ) < epsilon
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
// MARK: MobiusTransformation - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension MobiusTransformation : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "h(z) = (\(self.a.description)z + \(self.b.description))/(\(self.c.description)z + \(self.d.description))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: MobiusTransformation - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension MobiusTransformation : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "MobiusTransformation<\(String(reflecting: Representation.self))>(a: \(self.a.debugDescription), b: \(self.b.debugDescription), c: \(self.c.debugDescription), d: \(self.d.debugDescription))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: MobiusTransformation - Codable
// -------------------------------------------------------------------------- //

extension MobiusTransformation : Codable where Representation : Codable {
  
}
