//
//  ExtendedFloatingPointMath+FreeFunctions.swift
//  

import Foundation
import Numerics

@inlinable
public func squareRoot<T:ExtendedFloatingPointMath>(of value: T) -> T {
  return .sqrt(value)
}

@inlinable
public func cubeRoot<T:ExtendedFloatingPointMath>(of value: T) -> T {
  return T.cubeRoot(of: value)
}

@inlinable
public func hypotenuseLength<T:ExtendedFloatingPointMath>(_ a: T, _ b: T) -> T {
  return .hypot(a, b)
}

@inlinable
public func sinePi<T:ExtendedFloatingPointMath>(of value: T) -> T {
  return T.sinePi(of: value)
}

@inlinable
public func cosinePi<T:ExtendedFloatingPointMath>(of value: T) -> T {
  return T.cosinePi(of: value)
}

@inlinable
public func tangentPi<T:ExtendedFloatingPointMath>(of value: T) -> T {
  return T.tangentPi(of: value)
}

@inlinable
public func sineCosinePi<T:ExtendedFloatingPointMath>(of value: T) -> (T,T) {
  return T.sineCosinePi(of: value)
}

@inlinable
public func exponentiate<T:ExtendedFloatingPointMath>(
  _ value: T,
  by exponent: T) -> T {
  return .pow(
    value,
    exponent
  )
}

@inlinable
public func exponentToThePower<T:ExtendedFloatingPointMath>(of value: T) -> T {
  return .exp(value)
}

@inlinable
public func exponentMinusOne<T:ExtendedFloatingPointMath>(of exponent: T) -> T {
  return .expMinusOne(exponent)
}

@inlinable
public func twoToThePower<T:ExtendedFloatingPointMath>(of value: T) -> T {
  return T.twoToThePower(of: value)
}

@inlinable
public func tenToThePower<T:ExtendedFloatingPointMath>(of value: T) -> T {
  return T.tenToThePower(of: value)
}

@inlinable
public func naturalLogarithm<T:ExtendedFloatingPointMath>(of value: T) -> T {
  return .log(value)
}

@inlinable
public func naturalLogarithmOfOnePlus<T:ExtendedFloatingPointMath>(_ value: T) -> T {
  return .log(onePlus: value)
}

@inlinable
public func baseTwoLogarithm<T:ExtendedFloatingPointMath>(of value: T) -> T {
  return T.baseTwoLogarithm(of: value)
}

@inlinable
public func baseTenLogarithm<T:ExtendedFloatingPointMath>(of value: T) -> T {
  return T.baseTenLogarithm(of: value)
}

@inlinable
public func sine<T:ExtendedFloatingPointMath>(of value: T) -> T {
  return .sin(value)
}

@inlinable
public func cosine<T:ExtendedFloatingPointMath>(of value: T) -> T {
  return .cos(value)
}

@inlinable
public func tangent<T:ExtendedFloatingPointMath>(of value: T) -> T {
  return .tan(value)
}

@inlinable
public func sineCosine<T:ExtendedFloatingPointMath>(of value: T) -> (T,T) {
  return T.sineCosine(of: value)
}

@inlinable
public func arcsine<T:ExtendedFloatingPointMath>(of value: T) -> T {
  return .asin(value)
}

@inlinable
public func arccosine<T:ExtendedFloatingPointMath>(of value: T) -> T {
  return .acos(value)
}

@inlinable
public func arctangent<T:ExtendedFloatingPointMath>(of value: T) -> T {
  return .atan(value)
}

@inlinable
public func arctangent2<T:ExtendedFloatingPointMath>(y: T, x: T) -> T {
  return .atan2(
    y: y,
    x: x
  )
}

@inlinable
public func piArctangent2<T:ExtendedFloatingPointMath>(y: T, x: T) -> T {
  return T.piArctangent2(
    y: y,
    x: x
  )
}

@inlinable
public func hyperbolicSine<T:ExtendedFloatingPointMath>(of value: T) -> T {
  return .sinh(value)
}

@inlinable
public func hyperbolicCosine<T:ExtendedFloatingPointMath>(of value: T) -> T {
  return .cosh(value)
}

@inlinable
public func hyperbolicTangent<T:ExtendedFloatingPointMath>(of value: T) -> T {
  return .tanh(value)
}

@inlinable
public func hyperbolicArcsine<T:ExtendedFloatingPointMath>(of value: T) -> T {
  return .asinh(value)
}

@inlinable
public func hyperbolicArccosine<T:ExtendedFloatingPointMath>(of value: T) -> T {
  return .acosh(value)
}

@inlinable
public func hyperbolicArctangent<T:ExtendedFloatingPointMath>(of value: T) -> T {
  return .atanh(value)
}

@inlinable
public func signedModulus<T:ExtendedFloatingPointMath>(
  of value: T,
  by modulus: T) -> T {
  return T.signedModulus(
    of: value,
    by: modulus
  )
}

@inlinable
public func positiveModulus<T:ExtendedFloatingPointMath>(
  of value: T,
  by modulus: T) -> T {
  return T.positiveModulus(
    of: value,
    by: modulus
  )
}

@inlinable
public func negativeModulus<T:ExtendedFloatingPointMath>(
  of value: T,
  by modulus: T) -> T {
  return T.negativeModulus(
    of: value,
    by: modulus
  )
}

