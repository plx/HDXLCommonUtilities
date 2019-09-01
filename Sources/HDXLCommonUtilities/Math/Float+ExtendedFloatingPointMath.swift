//
//  Float+ExtendedFloatingPointMath.swift
//

import Foundation

extension Float : ExtendedFloatingPointMath {
  
  @inlinable
  public static func squareRoot(of value: Float) -> Float {
    return sqrtf(value)
  }
  
  @inlinable
  public static func cubeRoot(of value: Float) -> Float {
    return cbrtf(value)
  }
  
  @inlinable
  public static func hypotenuseLength(_ a: Float, _ b: Float) -> Float {
    return hypotf(a,b)
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
  public static func exponentToThePower(of value: Float) -> Float {
    return expf(value)
  }
  
  @inlinable
  public static func exponentMinusOne(of exponent: Float) -> Float {
    return expm1f(exponent)
  }
  
  @inlinable
  public static func twoToThePower(of value: Float) -> Float {
    return exp2f(value)
  }
  
  @inlinable
  public static func tenToThePower(of value: Float) -> Float {
    return __exp10f(value)
  }
  
  @inlinable
  public static func naturalLogarithm(of value: Float) -> Float {
    return logf(value)
  }
  
  @inlinable
  public static func naturalLogarithmOfOnePlus(_ value: Float) -> Float {
    return log1pf(value)
  }
  
  @inlinable
  public static func baseTwoLogarithm(of value: Float) -> Float {
    return log2f(value)
  }
  
  @inlinable
  public static func baseTenLogarithm(of value: Float) -> Float {
    return log10f(value)
  }
    
  @inlinable
  public static func sine(of value: Float) -> Float {
    return sinf(value)
  }
  
  @inlinable
  public static func cosine(of value: Float) -> Float {
    return cosf(value)
  }
  
  @inlinable
  public static func tangent(of value: Float) -> Float {
    return tanf(value)
  }
  
  @inlinable
  public static func sineCosine(of value: Float) -> (Float,Float) {
    var sine: Float = 0.0
    var cosine: Float = 0.0
    __sincosf(value, &sine, &cosine)
    return (sine, cosine)
  }
  
  @inlinable
  public static func arcsine(of value: Float) -> Float {
    return asinf(value)
  }
  
  @inlinable
  public static func arccosine(of value: Float) -> Float {
    return acosf(value)
  }
  
  @inlinable
  public static func arctangent(of value: Float) -> Float {
    return atanf(value)
  }
  
  @inlinable
  public static func arcTangent2(y: Float, x: Float) -> Float {
    return atan2f(
      y,
      x
    )
  }
  
  @inlinable
  public static func hyperbolicSine(of value: Float) -> Float {
    return sinhf(value)
  }
  
  @inlinable
  public static func hyperbolicCosine(of value: Float) -> Float {
    return coshf(value)
  }
  
  @inlinable
  public static func hyperbolicTangent(of value: Float) -> Float {
    return tanhf(value)
  }
  
  @inlinable
  public static func hyperbolicArcsine(of value: Float) -> Float {
    return asinhf(value)
  }
  
  @inlinable
  public static func hyperbolicArccosine(of value: Float) -> Float {
    return acoshf(value)
  }
  
  @inlinable
  public static func hyperbolicArctangent(of value: Float) -> Float {
    return atanhf(value)
  }
  
  
}
