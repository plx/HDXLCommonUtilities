//
//  Float+ExtendedFloatingPointMath.swift
//

import Foundation

extension Float : ExtendedFloatingPointMath {
  
  @inlinable
  public static func cubeRoot(of value: Float) -> Float {
    return cbrt(value)
  }

  @inlinable
  public static func sineCosine(of value: Float) -> (Float,Float) {
    var s: Float = 0.0
    var t: Float = 0.0
    __sincosf(value, &s, &t)
    return (s,t)
  }

  @inlinable
  public static func sinePi(of value: Float) -> Float {
    return __sinpif(value)
  }
  
  @inlinable
  public static func cosinePi(of value: Float) -> Float {
    return __cospif(value)
  }
  
  @inlinable
  public static func tangentPi(of value: Float) -> Float {
    return __tanpif(value)
  }
  
  @inlinable
  public static func sineCosinePi(of value: Float) -> (Float,Float) {
    var sine: Float = 0.0
    var cosine: Float = 0.0
    __sincospif(value, &sine, &cosine)
    return (sine,cosine)
  }
  
  @inlinable
  public static func twoToThePower(of value: Float) -> Float {
    return exp2(value)
  }
  
  @inlinable
  public static func tenToThePower(of value: Float) -> Float {
    return __exp10f(value)
  }
  @inlinable
  public static func baseTwoLogarithm(of value: Float) -> Float {
    return log2(value)
  }
  
  @inlinable
  public static func baseTenLogarithm(of value: Float) -> Float {
    return log10(value)
  }

  @inlinable
  public static func signedModulus(
    of value: Float,
    by modulus: Float) -> Float {
    precondition(modulus > 0.0)
    return fmodf(
      value,
      modulus
    )
  }
  
}
