//
//  Double+ExtendedFloatingPointMath.swift
//

import Foundation

extension Double : ExtendedFloatingPointMath {
  
  @inlinable
  public static func squareRoot(of value: Double) -> Double {
    return sqrt(value)
  }
  
  @inlinable
  public static func cubeRoot(of value: Double) -> Double {
    return cbrt(value)
  }
  
  @inlinable
  public static func hypotenuseLength(_ a: Double, _ b: Double) -> Double {
    return hypot(a,b)
  }
  
  @inlinable
  public static func sinePi(of value: Double) -> Double {
    return __sinpi(value)
  }
  
  @inlinable
  public static func cosinePi(of value: Double) -> Double {
    return __cospi(value)
  }
  
  @inlinable
  public static func tangentPi(of value: Double) -> Double {
    return __tanpi(value)
  }
  
  @inlinable
  public static func sineCosinePi(of value: Double) -> (Double,Double) {
    var sine: Double = 0.0
    var cosine: Double = 0.0
    __sincospi(value, &sine, &cosine)
    return (sine,cosine)
  }
  
  @inlinable
  public static func exponentiate(
    _ value: Double,
    by exponent: Double) -> Double {
    return pow(value,exponent)
  }

  @inlinable
  public static func exponentToThePower(of value: Double) -> Double {
    return exp(value)
  }
  
  @inlinable
  public static func exponentMinusOne(of exponent: Double) -> Double {
    return expm1(exponent)
  }
  
  @inlinable
  public static func twoToThePower(of value: Double) -> Double {
    return exp2(value)
  }
  
  @inlinable
  public static func tenToThePower(of value: Double) -> Double {
    return __exp10(value)
  }
  
  @inlinable
  public static func naturalLogarithm(of value: Double) -> Double {
    return log(value)
  }
  
  @inlinable
  public static func naturalLogarithmOfOnePlus(_ value: Double) -> Double {
    return log1p(value)
  }
  
  @inlinable
  public static func baseTwoLogarithm(of value: Double) -> Double {
    return log2(value)
  }
  
  @inlinable
  public static func baseTenLogarithm(of value: Double) -> Double {
    return log10(value)
  }
    
  @inlinable
  public static func sine(of value: Double) -> Double {
    return sin(value)
  }
  
  @inlinable
  public static func cosine(of value: Double) -> Double {
    return cos(value)
  }
  
  @inlinable
  public static func tangent(of value: Double) -> Double {
    return tan(value)
  }
  
  @inlinable
  public static func sineCosine(of value: Double) -> (Double,Double) {
    var sine: Double = 0.0
    var cosine: Double = 0.0
    __sincos(value, &sine, &cosine)
    return (sine, cosine)
  }
  
  @inlinable
  public static func arcsine(of value: Double) -> Double {
    return asin(value)
  }
  
  @inlinable
  public static func arccosine(of value: Double) -> Double {
    return acos(value)
  }
  
  @inlinable
  public static func arctangent(of value: Double) -> Double {
    return atan(value)
  }
  
  @inlinable
  public static func arcTangent2(y: Double, x: Double) -> Double {
    return atan2(
      y,
      x
    )
  }
  
  @inlinable
  public static func hyperbolicSine(of value: Double) -> Double {
    return sinh(value)
  }
  
  @inlinable
  public static func hyperbolicCosine(of value: Double) -> Double {
    return cosh(value)
  }
  
  @inlinable
  public static func hyperbolicTangent(of value: Double) -> Double {
    return tanh(value)
  }
  
  @inlinable
  public static func hyperbolicArcsine(of value: Double) -> Double {
    return asinh(value)
  }
  
  @inlinable
  public static func hyperbolicArccosine(of value: Double) -> Double {
    return acosh(value)
  }
  
  @inlinable
  public static func hyperbolicArctangent(of value: Double) -> Double {
    return atanh(value)
  }

  @inlinable
  public static func signedModulus(
    of value: Double,
    by modulus: Double) -> Double {
    precondition(modulus > 0.0)
    return fmod(
      value,
      modulus
    )
  }
  
}
