//
//  Product4Collection+ParallelVisit.swift
//

import Foundation
import Dispatch

/// Concurrently visits all elements within the cartesian product of the arguments,
/// using a strided dispatch approach under the hood.
@inlinable
public func StridedConcurrentVisit<A,B,C,D>(
  stride: Int,
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  using visitor: (InlineProduct4<A.Element,B.Element,C.Element,D.Element>) -> Void)
  where
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection {
  guard
    !a.isEmpty,
    !b.isEmpty,
    !c.isEmpty,
    !d.isEmpty else {
      return
    }
    InlineCartesianProduct(a,b,c,d).stridedConcurrentVisit(
      stride: stride,
      using: visitor
    )
}

@inlinable
public func StridedConcurrentEnumeratedVisit<A,B,C,D>(
  stride: Int,
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  using visitor: (Int,InlineProduct4<A.Element,B.Element,C.Element,D.Element>) -> Void)
  where
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection {
  guard
    !a.isEmpty,
    !b.isEmpty,
    !c.isEmpty,
    !d.isEmpty else {
      return
    }
    InlineCartesianProduct(a,b,c,d).stridedConcurrentEnumeratedVisit(
      stride: stride,
      using: visitor
    )
}

