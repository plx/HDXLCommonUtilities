//
//  COWProduct9+UniformValueAccess.swift
//  

import Foundation

// -------------------------------------------------------------------------- //
// MARK: COWProduct9 - Uniform Get/Set Support
// -------------------------------------------------------------------------- //

public extension COWProduct9
  where
  A == B,
  A == C,
  A == D,
  A == E,
  A == F,
  A == G,
  A == H,
  A == I {
  
  @inlinable
  func value(at index: Int) -> A {
    precondition((0..<9).contains(index))
    switch index {
    case 0:
      return self.a
    case 1:
      return self.b
    case 2:
      return self.c
    case 3:
      return self.d
    case 4:
      return self.e
    case 5:
      return self.f
    case 6:
      return self.g
    case 7:
      return self.h
    case 8:
      return self.i
    default:
      preconditionFailure("Used invalid index \(index) to get value on \(String(reflecting: self))!")
    }
  }
  
  @inlinable
  mutating func setValue(
    _ newValue: A,
    at index: Int){
    precondition((0..<9).contains(index))
    switch index {
    case 0:
      self.a = newValue
    case 1:
      self.b = newValue
    case 2:
      self.c = newValue
    case 3:
      self.d = newValue
    case 4:
      self.e = newValue
    case 5:
      self.f = newValue
    case 6:
      self.g = newValue
    case 7:
      self.h = newValue
    case 8:
      self.i = newValue
    default:
      preconditionFailure("Used invalid index \(index) to set value on \(String(reflecting: self))!")
    }
  }
  
}

