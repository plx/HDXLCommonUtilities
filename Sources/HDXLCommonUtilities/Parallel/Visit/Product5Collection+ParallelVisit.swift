//
//  Product5Collection+ParallelVisit.swift
//

import Foundation
import Dispatch

/// Concurrently visits all elements within the cartesian product of the arguments,
/// using a strided dispatch approach under the hood.
@inlinable
public func StridedConcurrentVisit<A,B,C,D,E>(
  stride: Int,
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  using visitor: (InlineProduct5<A.Element,B.Element,C.Element,D.Element,E.Element>) -> Void)
  where
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection,
  E:Collection {
  guard
    !a.isEmpty,
    !b.isEmpty,
    !c.isEmpty,
    !d.isEmpty,
    !e.isEmpty else {
      return
    }
    InlineCartesianProduct(a,b,c,d,e).stridedConcurrentVisit(
      stride: stride,
      using: visitor
    )
}

@inlinable
public func StridedConcurrentEnumeratedVisit<A,B,C,D,E>(
  stride: Int,
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  using visitor: (Int,InlineProduct5<A.Element,B.Element,C.Element,D.Element,E.Element>) -> Void)
  where
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection,
  E:Collection {
  guard
    !a.isEmpty,
    !b.isEmpty,
    !c.isEmpty,
    !d.isEmpty,
    !e.isEmpty else {
      return
    }
    InlineCartesianProduct(a,b,c,d,e).stridedConcurrentEnumeratedVisit(
      stride: stride,
      using: visitor
    )
}

