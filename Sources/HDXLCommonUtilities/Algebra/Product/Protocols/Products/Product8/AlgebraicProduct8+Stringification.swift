//
//  AlgebraicProduct8+Stringification.swift
//

import Foundation

public extension AlgebraicProduct8 {
  
  @inlinable
  static var unenclosedComponentTypeDescriptions: String {
    get {
      return [
        String(describing: A.self),
        String(describing: B.self),
        String(describing: C.self),
        String(describing: D.self),
        String(describing: E.self),
        String(describing: F.self),
        String(describing: G.self),
        String(describing: H.self)
        ].joined(separator: ", ")
    }
  }

  @inlinable
  static var unenclosedComponentTypeDebugDescriptions: String {
    get {
      return [
        String(reflecting: A.self),
        String(reflecting: B.self),
        String(reflecting: C.self),
        String(reflecting: D.self),
        String(reflecting: E.self),
        String(reflecting: F.self),
        String(reflecting: G.self),
        String(reflecting: H.self)
        ].joined(separator: ", ")
    }
  }
  
  @inlinable
  var unenclosedComponentValueDescriptions: String {
    get {
      return [
      String(describing: self.a),
      String(describing: self.b),
      String(describing: self.c),
      String(describing: self.d),
      String(describing: self.e),
      String(describing: self.f),
      String(describing: self.g),
      String(describing: self.h)
      ].joined(separator: ", ")
    }
  }

  @inlinable
  var unenclosedComponentValueDebugDescriptions: String {
    get {
      return [
      String(reflecting: self.a),
      String(reflecting: self.b),
      String(reflecting: self.c),
      String(reflecting: self.d),
      String(reflecting: self.e),
      String(reflecting: self.f),
      String(reflecting: self.g),
      String(reflecting: self.h)
      ].joined(separator: ", ")
    }
  }

  @inlinable
  var unenclosedLabeledComponentValueDescriptions: String {
    get {
      return [
      "a: \(String(describing: self.a))",
      "b: \(String(describing: self.b))",
      "c: \(String(describing: self.c))",
      "d: \(String(describing: self.d))",
      "e: \(String(describing: self.e))",
      "f: \(String(describing: self.f))",
      "g: \(String(describing: self.g))",
      "h: \(String(describing: self.h))"
      ].joined(separator: ", ")
    }
  }

  @inlinable
  var unenclosedLabeledComponentValueDebugDescriptions: String {
    get {
      return [
      "a: \(String(reflecting: self.a))",
      "b: \(String(reflecting: self.b))",
      "c: \(String(reflecting: self.c))",
      "d: \(String(reflecting: self.d))",
      "e: \(String(reflecting: self.e))",
      "f: \(String(reflecting: self.f))",
      "g: \(String(reflecting: self.g))",
      "h: \(String(reflecting: self.h))"
      ].joined(separator: ", ")
    }
  }

}
