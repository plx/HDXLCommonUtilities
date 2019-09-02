//
//  ExtendedFloatingPointMath.swift
//

import Foundation

/// Protocol letting me get free-standing functions that work on `Double` and `Float`.
///
/// I use full, nonstandard names to *lessen* the risk of name collisions with
/// (eventual) standard-library improvements, third-party libraries, and all that.
///
/// The issue, here, btw, is that the C math functions are type-specific in that
/// e.g. `sin` takes a `Double` and `sinf` takes a `Float`; recent versions of C
/// include a generics feature, Clang has supported overloading for C-style functions
/// for a long time, etc., but...in Swift they still show up as `sin` and `sinf`
/// (to the best of my knowledge--if there's type-generic/overloaded versions
/// I haven't found them).
///
/// This *protocol* is basically (a) re-exposing this pre-existing API as static
/// methods on the type so that (b) `Float` and `Double` can each provide a "mapping"
/// from the protocol methods to the corresponding, type-specific functions. We
/// can then implement freestanding, generic functions that call the appropriate
/// static method on the value, e.g.:
///
/// ```
/// func sine<T:ExtendedFloatingPointMath>(of value: T) -> T {
///   return T.sine(of: value)
/// }
/// ```
///
/// ...which means for `Float` we wind up with `sine(of: x)` being the same as
/// `sinf(x)` (after several levels of *compile-time* indirection).
///
/// For now I'm just defining this in the obvious way and sticking it into my
/// common utilities for e
/// ase of use elsewhere; of all the functionality within
/// this library, however, this is the best candidate for breaking my rules about
/// things like `@inline(__always)` and even `@_transparent`--it's really important
/// this protocol not introduce ridiculous overhead vis-a-vis what it actually does.
public protocol ExtendedFloatingPointMath : BinaryFloatingPoint {
  
  static func squareRoot(of value: Self) -> Self
  static func cubeRoot(of value: Self) -> Self
  static func hypotenuseLength(_ a: Self, _ b: Self) -> Self
  
  static func sinePi(of value: Self) -> Self
  static func cosinePi(of value: Self) -> Self
  static func tangentPi(of value: Self) -> Self
  static func sineCosinePi(of value: Self) -> (Self,Self)
  
  static func exponentiate(
    _ value: Self,
    by exponent: Self) -> Self
  
  static func exponentToThePower(of value: Self) -> Self
  static func exponentMinusOne(of exponent: Self) -> Self
  static func twoToThePower(of value: Self) -> Self
  static func tenToThePower(of value: Self) -> Self
  
  static func naturalLogarithm(of value: Self) -> Self
  static func naturalLogarithmOfOnePlus(_ value: Self) -> Self
  static func baseTwoLogarithm(of value: Self) -> Self
  static func baseTenLogarithm(of value: Self) -> Self
    
  static func sine(of value: Self) -> Self
  static func cosine(of value: Self) -> Self
  static func tangent(of value: Self) -> Self
  static func sineCosine(of value: Self) -> (Self,Self)
  
  static func arcsine(of value: Self) -> Self
  static func arccosine(of value: Self) -> Self
  static func arctangent(of value: Self) -> Self
  
  static func arcTangent2(y: Self, x: Self) -> Self
  
  static func hyperbolicSine(of value: Self) -> Self
  static func hyperbolicCosine(of value: Self) -> Self
  static func hyperbolicTangent(of value: Self) -> Self

  static func hyperbolicArcsine(of value: Self) -> Self
  static func hyperbolicArccosine(of value: Self) -> Self
  static func hyperbolicArctangent(of value: Self) -> Self
  
}

public extension ExtendedFloatingPointMath {
  
  @inlinable
  func exponentiated(by power: Self) -> Self {
    return Self.exponentiate(
      self,
      by: power
    )
  }
  
  @inlinable
  mutating func formExponentiation(by power: Self) {
    self = self.exponentiated(
      by: power
    )
  }
  
  @inlinable
  mutating func formCubeRoot() {
    self = Self.cubeRoot(
      of: self
    )
  }

}



