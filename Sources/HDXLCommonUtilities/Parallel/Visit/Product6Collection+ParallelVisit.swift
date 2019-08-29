//
//  Product6Collection+ParallelVisit.swift
//

import Foundation
import Dispatch

/// Concurrently visits all elements within the cartesian product of the arguments,
/// using a strided dispatch approach under the hood.
@inlinable
public func StridedConcurrentVisit<A,B,C,D,E,F>(
  stride: Int,
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F,
  using visitor: (InlineProduct6<A.Element,B.Element,C.Element,D.Element,E.Element,F.Element>) -> Void)
  where
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection,
  E:Collection,
  F:Collection {
  guard
    !a.isEmpty,
    !b.isEmpty,
    !c.isEmpty,
    !d.isEmpty,
    !e.isEmpty,
    !f.isEmpty else {
      return
    }
    InlineCartesianProduct(a,b,c,d,e,f).stridedConcurrentVisit(
      stride: stride,
      using: visitor
    )
}

@inlinable
public func StridedConcurrentEnumeratedVisit<A,B,C,D,E,F>(
  stride: Int,
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F,
  using visitor: (Int,InlineProduct6<A.Element,B.Element,C.Element,D.Element,E.Element,F.Element>) -> Void)
  where
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection,
  E:Collection,
  F:Collection {
  guard
    !a.isEmpty,
    !b.isEmpty,
    !c.isEmpty,
    !d.isEmpty,
    !e.isEmpty,
    !f.isEmpty else {
      return
    }
    InlineCartesianProduct(a,b,c,d,e,f).stridedConcurrentEnumeratedVisit(
      stride: stride,
      using: visitor
    )
}

