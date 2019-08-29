//
//  Product9Collection+ParallelVisit.swift
//

import Foundation
import Dispatch

/// Concurrently visits all elements within the cartesian product of the arguments,
/// using a strided dispatch approach under the hood.
@inlinable
public func StridedConcurrentVisit<A,B,C,D,E,F,G,H,I>(
  stride: Int,
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F,
  _ g: G,
  _ h: H,
  _ i: I,
  using visitor: (InlineProduct9<A.Element,B.Element,C.Element,D.Element,E.Element,F.Element,G.Element,H.Element,I.Element>) -> Void)
  where
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection,
  E:Collection,
  F:Collection,
  G:Collection,
  H:Collection,
  I:Collection {
  guard
    !a.isEmpty,
    !b.isEmpty,
    !c.isEmpty,
    !d.isEmpty,
    !e.isEmpty,
    !f.isEmpty,
    !g.isEmpty,
    !h.isEmpty,
    !i.isEmpty else {
      return
    }
    InlineCartesianProduct(a,b,c,d,e,f,g,h,i).stridedConcurrentVisit(
      stride: stride,
      using: visitor
    )
}

@inlinable
public func StridedConcurrentEnumeratedVisit<A,B,C,D,E,F,G,H,I>(
  stride: Int,
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F,
  _ g: G,
  _ h: H,
  _ i: I,
  using visitor: (Int,InlineProduct9<A.Element,B.Element,C.Element,D.Element,E.Element,F.Element,G.Element,H.Element,I.Element>) -> Void)
  where
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection,
  E:Collection,
  F:Collection,
  G:Collection,
  H:Collection,
  I:Collection {
  guard
    !a.isEmpty,
    !b.isEmpty,
    !c.isEmpty,
    !d.isEmpty,
    !e.isEmpty,
    !f.isEmpty,
    !g.isEmpty,
    !h.isEmpty,
    !i.isEmpty else {
      return
    }
    InlineCartesianProduct(a,b,c,d,e,f,g,h,i).stridedConcurrentEnumeratedVisit(
      stride: stride,
      using: visitor
    )
}
