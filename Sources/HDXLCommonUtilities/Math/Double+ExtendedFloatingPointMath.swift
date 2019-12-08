//
//  Double+ExtendedFloatingPointMath.swift
//

import Foundation

extension Double : ExtendedFloatingPointMath {

  @inlinable
  public init(fromLiteralFloat literalFloat: Float) {
    self.init(literalFloat)
  }

  @inlinable
  public init(fromLiteralDouble literalDouble: Double) {
    self.init(literalDouble)
  }
  
  @inlinable
  public static func κ(_ literalDouble: Double) -> Double {
    return literalDouble
  }
  
  @inlinable
  public var half: Double {
    get {
      return self * 0.5
    }
  }
  
  @inlinable
  public static func cubeRoot(of value: Double) -> Double {
    return cbrt(value)
  }
  
  @inlinable
  public static func sineCosine(of value: Double) -> (Double,Double) {
    var s: Double = 0.0
    var t: Double = 0.0
    __sincos(value, &s, &t)
    return (s,t)
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
  public static func twoToThePower(of value: Double) -> Double {
    return exp2(value)
  }
  
  @inlinable
  public static func tenToThePower(of value: Double) -> Double {
    return __exp10(value)
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
