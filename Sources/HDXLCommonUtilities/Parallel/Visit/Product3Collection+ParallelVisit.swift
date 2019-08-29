//
//  Product3Collection+ParallelVisit.swift
//

import Foundation
import Dispatch

/// Concurrently visits all elements within the cartesian product of the arguments,
/// using a strided dispatch approach under the hood.
@inlinable
public func StridedConcurrentVisit<A,B,C>(
  stride: Int,
  _ a: A,
  _ b: B,
  _ c: C,
  using visitor: (InlineProduct3<A.Element,B.Element,C.Element>) -> Void)
  where
  A:Collection,
  B:Collection,
  C:Collection {
  guard
    !a.isEmpty,
    !b.isEmpty,
    !c.isEmpty else {
      return
    }
    InlineCartesianProduct(a,b,c).stridedConcurrentVisit(
      stride: stride,
      using: visitor
    )
}

@inlinable
public func StridedConcurrentEnumeratedVisit<A,B,C>(
  stride: Int,
  _ a: A,
  _ b: B,
  _ c: C,
  using visitor: (Int,InlineProduct3<A.Element,B.Element,C.Element>) -> Void)
  where
  A:Collection,
  B:Collection,
  C:Collection {
  guard
    !a.isEmpty,
    !b.isEmpty,
    !c.isEmpty else {
      return
    }
    InlineCartesianProduct(a,b,c).stridedConcurrentEnumeratedVisit(
      stride: stride,
      using: visitor
    )
}

