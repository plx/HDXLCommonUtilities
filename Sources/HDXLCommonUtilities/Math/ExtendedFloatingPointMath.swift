//
//  ExtendedFloatingPointMath.swift
//

import Foundation
import Numerics

// -------------------------------------------------------------------------- //
// MARK: ExtendedFloatingPointMath - Definition
// -------------------------------------------------------------------------- //

/// Edit circa version 0.0.30: the initial release of the `Numerics` package was
/// right around when I picked this back up. Since (a) the `Real` protocol is the
/// same as this--*mutatis mutandis*, etc.--I've decided to come back, base this
/// atop `Real`, and eliminate as much as I can.
///
/// I'm a little hestitant to drop the `π`-unit trigonometric methods and a little
/// hestitant to drop the `modulus`-related methods, though--I actually use those
/// downstream from this package--and so, for now, I won't be *eliminating* this
/// protocol...I'll just be rebasing it to inherit from `Real`, instead.
///
/// Since this is just an experiment I'll be keeping my nonstandard-name free
/// functions for now (less code to change upfront; may get dropped later on).
///
/// In the future I would prefer to drop this protocol entirely.
///
/// As was previously the case, this protocol is a *temporary* implementation
/// detail--to be phased out in favor of `Real` as soon as possible.
///
/// - note: `ExpressibleByFloatLiteral` seems to be one of the culprits behind crazy-slow compile times downstream. I'm replacing it with `Float` and `Double` initializers, with `Double` variant accessible as `Self.κ()`.
/// - note: `ExpressibleByFloatLiteral` *aggravates* the underyling issues, but a *known* compiler regression seems to be the real problem.
///
public protocol ExtendedFloatingPointMath : Real /*, ExpressibleByFloatLiteral */ {
  
  // ------------------------------------------------------------------------ //
  // MARK: Literal Construction
  // ------------------------------------------------------------------------ //
  
  /// Constructs `Self` from what *should be* a `Float` literal.
  ///
  /// - note: Temporary work-around until we have a way to write literals that works with `Real`.
  ///
  init(fromLiteralFloat literalFloat: Float)
  
  /// Constructs `Self` from what *should be* a `Double` literal.
  ///
  /// - note: Temporary work-around until we have a way to write literals that works with `Real`.
  ///
  init(fromLiteralDouble literalDouble: Double)
  
  /// Type-level shorthand for a "κ(onstant)"; expected to call-through to `init(fromLiteralDouble:)`.
  ///
  /// - note: Temporary work-around until we have a way to write literals that works with `Real`.
  ///
  static func κ(_ literalDouble: Double) -> Self
  
  // ------------------------------------------------------------------------ //
  // MARK: Common Operations
  // ------------------------------------------------------------------------ //

  /// Returns `self * 0.5`.
  ///
  /// *Artificial* protocol requirement, introduced *only* to--hopefully!--reduce
  /// downstream compile-time blowups.
  var half: Self { get }

  // ------------------------------------------------------------------------ //
  // MARK: Extended Math API
  // ------------------------------------------------------------------------ //
  
  /// Special-case returning the cube root of `value`.
  static func cubeRoot(of value: Self) -> Self
  
  /// Simultaneously returns `(sin(value),cos(value))` (in units of radians).
  static func sineCosine(of value: Self) -> (Self,Self)
  
  /// Provides `sin(π*value)`.
  static func sinePi(of value: Self) -> Self
  
  /// Provides `cos(π*value)`.
  static func cosinePi(of value: Self) -> Self
  
  /// Provides `tan(π*value)`.
  static func tangentPi(of value: Self) -> Self
  
  /// Simultaneously provides `sin(π*value)` and `cos(π*value)`.
  static func sineCosinePi(of value: Self) -> (Self,Self)

  /// Like `arctangent2` but converting to π-units.
  static func piArctangent2(y: Self, x: Self) -> Self

  static func twoToThePower(of value: Self) -> Self
  static func tenToThePower(of value: Self) -> Self
  
  static func baseTwoLogarithm(of value: Self) -> Self
  static func baseTenLogarithm(of value: Self) -> Self
  

  // ------------------------------------------------------------------------ //
  // MARK: Modulus-Convenience API
  // ------------------------------------------------------------------------ //

  /// My name for a modulus wherein we make no effort to control the result sign.
  static func signedModulus(
    of value: Self,
    by modulus: Self) -> Self

  /// A floating-point "modulus" with results I guarantee will be `>= 0.0`.
  static func positiveModulus(
    of value: Self,
    by modulus: Self) -> Self
  
  /// A floating-point "modulus" with results I guarantee will be `<= 0.0`.
  static func negativeModulus(
    of value: Self,
    by modulus: Self) -> Self
  
}

// -------------------------------------------------------------------------- //
// MARK: ExtendedFloatingPointMath - Default Implementations
// -------------------------------------------------------------------------- //

public extension ExtendedFloatingPointMath {
  
  // To my knowledge we don't have a `__piatan2`, so this has no *numeric* benefit,
  // but at least it keeps the code cleaner @ call sites...
  @inlinable
  static func piArctangent2(y: Self, x: Self) -> Self {
    return Self.atan2(y: y, x: x) / Self.pi
  }
  
  @inlinable
  mutating func formExponentiation(by power: Self) {
    self = exponentiate(
      self,
      by: power
    )
  }
  
  @inlinable
  mutating func formCubeRoot() {
    self = Self.cubeRoot(
      of: self
    )
  }

  @inlinable
  static func positiveModulus(
    of value: Self,
    by modulus: Self) -> Self {
    precondition(modulus > 0)
    let result = Self.signedModulus(
      of: value,
      by: modulus
    )
    return result >= 0 ? result : result + modulus
  }

  @inlinable
  static func negativeModulus(
    of value: Self,
    by modulus: Self) -> Self {
    let result = Self.signedModulus(
      of: value,
      by: modulus
    )
    return result <= 0 ? result : result - modulus
  }
  
  @inlinable
  func signedModulus(by modulus: Self) -> Self {
    return Self.signedModulus(
      of: self,
      by: modulus
    )
  }
  
  @inlinable
  mutating func formSignedModulus(by modulus: Self) {
    self = Self.signedModulus(
      of: self,
      by: modulus
    )
  }

  @inlinable
  func positiveModulus(by modulus: Self) -> Self {
    return Self.positiveModulus(
      of: self,
      by: modulus
    )
  }
    
  @inlinable
  mutating func formPositivePodulus(by modulus: Self) {
    self = Self.positiveModulus(
      of: self,
      by: modulus
    )
  }

  @inlinable
  func negativeModulus(by modulus: Self) -> Self {
    return Self.negativeModulus(
      of: self,
      by: modulus
    )
  }

  @inlinable
  mutating func formNegativeModulus(by modulus: Self){
    self = Self.negativeModulus(
      of: self,
      by: modulus
    )
  }

}



