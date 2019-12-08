//
//  ExtendedFloatingPointMath.swift
//

import Foundation
import Numerics

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
  
  static func cubeRoot(of value: Self) -> Self
  
  static func sineCosine(of value: Self) -> (Self,Self)
  
  static func sinePi(of value: Self) -> Self
  static func cosinePi(of value: Self) -> Self
  static func tangentPi(of value: Self) -> Self
  static func sineCosinePi(of value: Self) -> (Self,Self)
  
  static func twoToThePower(of value: Self) -> Self
  static func tenToThePower(of value: Self) -> Self
  
  static func baseTwoLogarithm(of value: Self) -> Self
  static func baseTenLogarithm(of value: Self) -> Self
  
  static func piArctangent2(y: Self, x: Self) -> Self

  // ------------------------------------------------------------------------ //
  // MARK: Modulus-Convenience API
  // ------------------------------------------------------------------------ //

  static func signedModulus(
    of value: Self,
    by modulus: Self) -> Self
  
  static func positiveModulus(
    of value: Self,
    by modulus: Self) -> Self

  static func negativeModulus(
    of value: Self,
    by modulus: Self) -> Self
  
}

public extension ExtendedFloatingPointMath {
  
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



