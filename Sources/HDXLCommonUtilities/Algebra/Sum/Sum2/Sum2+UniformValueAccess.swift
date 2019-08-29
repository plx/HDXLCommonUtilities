//
//  Sum2+UniformValueAccess.swift
//

import Foundation

public extension Sum2
  where
  A == B {
  
  typealias UniformValue = A
  typealias IdentifiedUniformValue = Product2<Position,UniformValue>
  
  /// For sums of a uniform type, we can reliably extract a non-nil value of that type.
  @inlinable
  var uniformValue: UniformValue {
    get {
      switch self {
      case .a(let v):
        return v
      case .b(let v):
        return v
      }
    }
  }
  
  /// Like `uniformValue` but includes the arity-position from-which we sourced the value.
  @inlinable
  var identifiedUniformValue: IdentifiedUniformValue {
    get {
      switch self {
      case .a(let v):
        return IdentifiedUniformValue(.a,v)
      case .b(let v):
        return IdentifiedUniformValue(.b,v)
      }
    }
  }
  
}
