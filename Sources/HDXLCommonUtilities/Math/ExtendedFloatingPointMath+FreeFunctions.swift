//
//  ExtendedFloatingPointMath+FreeFunctions.swift
//  

import Foundation


@inlinable
public func squareRoot<T:ExtendedFloatingPointMath>(of value: T) -> T {
  return T.squareRoot(of: value)
}

@inlinable
public func cubeRoot<T:ExtendedFloatingPointMath>(of value: T) -> T {
  return T.cubeRoot(of: value)
}

@inlinable
public func hypotenuseLength<T:ExtendedFloatingPointMath>(_ a: T, _ b: T) -> T {
  return T.hypotenuseLength(a, b)
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
  return T.exponentiate(
    value,
    by: exponent
  )
}

@inlinable
public func exponentToThePower<T:ExtendedFloatingPointMath>(of value: T) -> T {
  return T.exponentToThePower(of: value)
}

@inlinable
public func exponentMinusOne<T:ExtendedFloatingPointMath>(of exponent: T) -> T {
  return T.exponentMinusOne(of: exponent)
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
  return T.naturalLogarithm(of: value)
}

@inlinable
public func naturalLogarithmOfOnePlus<T:ExtendedFloatingPointMath>(_ value: T) -> T {
  return T.naturalLogarithmOfOnePlus(value)
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
  return T.sine(of: value)
}

@inlinable
public func cosine<T:ExtendedFloatingPointMath>(of value: T) -> T {
  return T.cosine(of: value)
}

@inlinable
public func tangent<T:ExtendedFloatingPointMath>(of value: T) -> T {
  return T.tangent(of: value)
}

@inlinable
public func sineCosine<T:ExtendedFloatingPointMath>(of value: T) -> (T,T) {
  return T.sineCosine(of: value)
}

@inlinable
public func arcsine<T:ExtendedFloatingPointMath>(of value: T) -> T {
  return T.arcsine(of: value)
}

@inlinable
public func arccosine<T:ExtendedFloatingPointMath>(of value: T) -> T {
  return T.arccosine(of: value)
}

@inlinable
public func arctangent<T:ExtendedFloatingPointMath>(of value: T) -> T {
  return T.arctangent(of: value)
}

@inlinable
public func arcTangent2<T:ExtendedFloatingPointMath>(y: T, x: T) -> T {
  return T.arcTangent2(
    y: y,
    x: x
  )
}

@inlinable
public func hyperbolicSine<T:ExtendedFloatingPointMath>(of value: T) -> T {
  return T.hyperbolicSine(of: value)
}

@inlinable
public func hyperbolicCosine<T:ExtendedFloatingPointMath>(of value: T) -> T {
  return T.hyperbolicCosine(of: value)
}

@inlinable
public func hyperbolicTangent<T:ExtendedFloatingPointMath>(of value: T) -> T {
  return T.hyperbolicTangent(of: value)
}

@inlinable
public func hyperbolicArcsine<T:ExtendedFloatingPointMath>(of value: T) -> T {
  return T.hyperbolicArcsine(of: value)
}

@inlinable
public func hyperbolicArccosine<T:ExtendedFloatingPointMath>(of value: T) -> T {
  return T.hyperbolicArccosine(of: value)
}

@inlinable
public func hyperbolicArctangent<T:ExtendedFloatingPointMath>(of value: T) -> T {
  return T.hyperbolicArctangent(of: value)
}

