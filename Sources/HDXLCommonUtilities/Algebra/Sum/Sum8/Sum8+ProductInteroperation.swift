//
//  Sum8+ProductInteroperation.swift
//

import Foundation

public extension Sum8 {

  /// Given a value of one-of-n possible types and a mapping from each possible
  /// type to some specific type `T`, we can apply the matching mapping to the
  /// value we have and arrive at a value of type `T`.
  @inlinable
  func produceValue<T,Producer>(
    using producer: Producer) -> T
    where
    Producer:AlgebraicProduct8,
    Producer.A == (A) -> T,
    Producer.B == (B) -> T,
    Producer.C == (C) -> T,
    Producer.D == (D) -> T,
    Producer.E == (E) -> T,
    Producer.F == (F) -> T,
    Producer.G == (G) -> T,
    Producer.H == (H) -> T {
      // ///////////////////////////////////////////////////////////////////////
      pedantic_assert(isValidOrIndifferent(producer))
      pedantic_assert(self.isValid)
      // ///////////////////////////////////////////////////////////////////////
      switch self {
      case .a(let a):
        return producer.a(a)
      case .b(let b):
        return producer.b(b)
      case .c(let c):
        return producer.c(c)
      case .d(let d):
        return producer.d(d)
      case .e(let e):
        return producer.e(e)
      case .f(let f):
        return producer.f(f)
      case .g(let g):
        return producer.g(g)
      case .h(let h):
        return producer.h(h)
      }
  }

  /// Componentwise-maps one sum type to another using the mappings in `mapping`.
  @inlinable
  func mapped<AA,BB,CC,DD,EE,FF,GG,HH,Mapping>(
    using mapping: Mapping) -> Sum8<AA,BB,CC,DD,EE,FF,GG,HH>
    where
    Mapping:AlgebraicProduct8,
    Mapping.A == (A) -> AA,
    Mapping.B == (B) -> BB,
    Mapping.C == (C) -> CC,
    Mapping.D == (D) -> DD,
    Mapping.E == (E) -> EE,
    Mapping.F == (F) -> FF,
    Mapping.G == (G) -> GG,
    Mapping.H == (H) -> HH {
      // ///////////////////////////////////////////////////////////////////////
      pedantic_assert(isValidOrIndifferent(mapping))
      pedantic_assert(self.isValid)
      // ///////////////////////////////////////////////////////////////////////
      switch self {
      case .a(let a):
        return .a(mapping.a(a))
      case .b(let b):
        return .b(mapping.b(b))
      case .c(let c):
        return .c(mapping.c(c))
      case .d(let d):
        return .d(mapping.d(d))
      case .e(let e):
        return .e(mapping.e(e))
      case .f(let f):
        return .f(mapping.f(f))
      case .g(let g):
        return .g(mapping.g(g))
      case .h(let h):
        return .h(mapping.h(h))
      }
  }

  
}
