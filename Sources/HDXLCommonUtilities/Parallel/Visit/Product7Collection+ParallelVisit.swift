//
//  Product7Collection+ParallelVisit.swift
//

import Foundation
import Dispatch

/// Concurrently visits all elements within the cartesian product of the arguments,
/// using a strided dispatch approach under the hood.
@inlinable
public func StridedConcurrentVisit<A,B,C,D,E,F,G>(
  stride: Int,
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F,
  _ g: G,
  using visitor: (InlineProduct7<A.Element,B.Element,C.Element,D.Element,E.Element,F.Element,G.Element>) -> Void)
  where
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection,
  E:Collection,
  F:Collection,
  G:Collection {
  guard
    !a.isEmpty,
    !b.isEmpty,
    !c.isEmpty,
    !d.isEmpty,
    !e.isEmpty,
    !f.isEmpty,
    !g.isEmpty else {
      return
    }
    InlineCartesianProduct(a,b,c,d,e,f,g).stridedConcurrentVisit(
      stride: stride,
      using: visitor
    )
}

@inlinable
public func StridedConcurrentEnumeratedVisit<A,B,C,D,E,F,G>(
  stride: Int,
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F,
  _ g: G,
  using visitor: (Int,InlineProduct7<A.Element,B.Element,C.Element,D.Element,E.Element,F.Element,G.Element>) -> Void)
  where
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection,
  E:Collection,
  F:Collection,
  G:Collection {
  guard
    !a.isEmpty,
    !b.isEmpty,
    !c.isEmpty,
    !d.isEmpty,
    !e.isEmpty,
    !f.isEmpty,
    !g.isEmpty else {
      return
    }
    InlineCartesianProduct(a,b,c,d,e,f,g).stridedConcurrentEnumeratedVisit(
      stride: stride,
      using: visitor
    )
}

