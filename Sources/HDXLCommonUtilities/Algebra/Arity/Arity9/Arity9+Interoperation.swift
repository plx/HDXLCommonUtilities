//
//  Arity9+Interoperation.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: InlineProduct9 - Arity9 Interoperation
// -------------------------------------------------------------------------- //

public extension InlineProduct9 {
  
  @inlinable
  mutating func formReplacement(component: Sum9<A,B,C,D,E,F,G,H,I>) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(component.isValid)
    pedantic_assert(self.isValid)
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    switch component {
    case .a(let a):
      self.a = a
    case .b(let b):
      self.b = b
    case .c(let c):
      self.c = c
    case .d(let d):
      self.d = d
    case .e(let e):
      self.e = e
    case .f(let f):
      self.f = f
    case .g(let g):
      self.g = g
    case .h(let h):
      self.h = h
    case .i(let i):
      self.i = i
    }
  }
  
  @inlinable
  func replacing(component: Sum9<A,B,C,D,E,F,G,H,I>) -> InlineProduct9<A,B,C,D,E,F,G,H,I> {
    switch component {
    case .a(let a):
      return self.with(a: a)
    case .b(let b):
      return self.with(b: b)
    case .c(let c):
      return self.with(c: c)
    case .d(let d):
      return self.with(d: d)
    case .e(let e):
      return self.with(e: e)
    case .f(let f):
      return self.with(f: f)
    case .g(let g):
      return self.with(g: g)
    case .h(let h):
      return self.with(h: h)
    case .i(let i):
      return self.with(i: i)
    }
  }
  
  @inlinable
  func value(at position: Arity9Position) -> Sum9<A,B,C,D,E,F,G,H,I> {
    switch position {
    case .a:
      return .a(self.a)
    case .b:
      return .b(self.b)
    case .c:
      return .c(self.c)
    case .d:
      return .d(self.d)
    case .e:
      return .e(self.e)
    case .f:
      return .f(self.f)
    case .g:
      return .g(self.g)
    case .h:
      return .h(self.h)
    case .i:
      return .i(self.i)
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct9 - Arity9 Interoperation
// -------------------------------------------------------------------------- //

public extension COWProduct9 {
  
  @inlinable
  mutating func formReplaecment(component: Sum9<A,B,C,D,E,F,G,H,I>) {
    if isKnownUniquelyReferenced(&self.storage) {
      self.storage.formReplacement(
        component: component
      )
    } else {
      self.storage = self.storage.replacing(
        component: component
      )
    }
  }
  
  @inlinable
  func replacing(component: Sum9<A,B,C,D,E,F,G,H,I>) -> COWProduct9<A,B,C,D,E,F,G,H,I> {
    return COWProduct9<A,B,C,D,E,F,G,H,I>(
      storage: self.storage.replacing(
        component: component
      )
    )
  }
  
  @inlinable
  func value(at position: Arity9Position) -> Sum9<A,B,C,D,E,F,G,H,I> {
    return self.storage.value(at: position)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct9Storage - Arity9 Interoperation
// -------------------------------------------------------------------------- //

internal extension COWProduct9Storage {
  
  @usableFromInline
  func formReplacement(component: Sum9<A,B,C,D,E,F,G,H,I>) {
    self.storage.formReplacement(
      component: component
    )
  }
  
  @usableFromInline
  func replacing(component: Sum9<A,B,C,D,E,F,G,H,I>) -> COWProduct9Storage<A,B,C,D,E,F,G,H,I> {
    return COWProduct9Storage<A,B,C,D,E,F,G,H,I>(
      storage: self.storage.replacing(
        component: component
      )
    )
  }
  
  @usableFromInline
  func value(at position: Arity9Position) -> Sum9<A,B,C,D,E,F,G,H,I> {
    return self.storage.value(at: position)
  }

}
