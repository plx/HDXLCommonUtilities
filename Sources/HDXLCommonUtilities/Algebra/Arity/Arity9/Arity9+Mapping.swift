//
//  Arity9+Mapping.swift
//

import Foundation

public extension Sum9 {
  
  @inlinable
  func transformed<
    AA,
    BB,
    CC,
    DD,
    EE,
    FF,
    GG,
    HH,
    II>(using transforms: InlineProduct9<
    (A) -> AA,
    (B) -> BB,
    (C) -> CC,
    (D) -> DD,
    (E) -> EE,
    (F) -> FF,
    (G) -> GG,
    (H) -> HH,
    (I) -> II>) -> Sum9<AA,BB,CC,DD,EE,FF,GG,HH,II> {
    switch self {
    case .a(let a):
      return .a(transforms.a(a))
    case .b(let b):
      return .b(transforms.b(b))
    case .c(let c):
      return .c(transforms.c(c))
    case .d(let d):
      return .d(transforms.d(d))
    case .e(let e):
      return .e(transforms.e(e))
    case .f(let f):
      return .f(transforms.f(f))
    case .g(let g):
      return .g(transforms.g(g))
    case .h(let h):
      return .h(transforms.h(h))
    case .i(let i):
      return .i(transforms.i(i))
    }
  }

  @inlinable
  func transformed<
    AA,
    BB,
    CC,
    DD,
    EE,
    FF,
    GG,
    HH,
    II>(using transforms: COWProduct9<
    (A) -> AA,
    (B) -> BB,
    (C) -> CC,
    (D) -> DD,
    (E) -> EE,
    (F) -> FF,
    (G) -> GG,
    (H) -> HH,
    (I) -> II>) -> Sum9<AA,BB,CC,DD,EE,FF,GG,HH,II> {
    switch self {
    case .a(let a):
      return .a(transforms.a(a))
    case .b(let b):
      return .b(transforms.b(b))
    case .c(let c):
      return .c(transforms.c(c))
    case .d(let d):
      return .d(transforms.d(d))
    case .e(let e):
      return .e(transforms.e(e))
    case .f(let f):
      return .f(transforms.f(f))
    case .g(let g):
      return .g(transforms.g(g))
    case .h(let h):
      return .h(transforms.h(h))
    case .i(let i):
      return .i(transforms.i(i))
    }
  }

}
