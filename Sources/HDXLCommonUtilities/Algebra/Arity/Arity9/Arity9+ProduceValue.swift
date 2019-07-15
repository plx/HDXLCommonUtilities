//
//  Arity9+ProduceValue.swift
//

import Foundation

public extension Sum9 {
  
  @inlinable
  func produceValue<T>(
    using producers: InlineProduct9<
    (A) -> T,
    (B) -> T,
    (C) -> T,
    (D) -> T,
    (E) -> T,
    (F) -> T,
    (G) -> T,
    (H) -> T,
    (I) -> T>) -> T {
    switch self {
    case .a(let a):
      return producers.a(a)
    case .b(let b):
      return producers.b(b)
    case .c(let c):
      return producers.c(c)
    case .d(let d):
      return producers.d(d)
    case .e(let e):
      return producers.e(e)
    case .f(let f):
      return producers.f(f)
    case .g(let g):
      return producers.g(g)
    case .h(let h):
      return producers.h(h)
    case .i(let i):
      return producers.i(i)
    }
  }

  @inlinable
  func produceValue<T>(
    using producers: COWProduct9<
    (A) -> T,
    (B) -> T,
    (C) -> T,
    (D) -> T,
    (E) -> T,
    (F) -> T,
    (G) -> T,
    (H) -> T,
    (I) -> T>) -> T {
    switch self {
    case .a(let a):
      return producers.a(a)
    case .b(let b):
      return producers.b(b)
    case .c(let c):
      return producers.c(c)
    case .d(let d):
      return producers.d(d)
    case .e(let e):
      return producers.e(e)
    case .f(let f):
      return producers.f(f)
    case .g(let g):
      return producers.g(g)
    case .h(let h):
      return producers.h(h)
    case .i(let i):
      return producers.i(i)
    }
  }

}
