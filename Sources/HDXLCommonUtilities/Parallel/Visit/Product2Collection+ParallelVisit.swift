//
//  Product2Collection+ParallelVisit.swift
//

import Foundation
import Dispatch

/// Concurrently visits all elements within the cartesian product of the arguments,
/// using a strided dispatch approach under the hood.
@inlinable
public func StridedConcurrentVisit<A,B>(
  stride: Int,
  _ a: A,
  _ b: B,
  using visitor: (InlineProduct2<A.Element,B.Element>) -> Void)
  where
  A:Collection,
  B:Collection {
  guard
    !a.isEmpty,
    !b.isEmpty else {
      return
    }
    InlineCartesianProduct(a,b).stridedConcurrentVisit(
      stride: stride,
      using: visitor
    )
}

@inlinable
public func StridedConcurrentEnumeratedVisit<A,B>(
  stride: Int,
  _ a: A,
  _ b: B,
  using visitor: (Int,InlineProduct2<A.Element,B.Element>) -> Void)
  where
  A:Collection,
  B:Collection {
  guard
    !a.isEmpty,
    !b.isEmpty else {
      return
    }
    InlineCartesianProduct(a,b).stridedConcurrentEnumeratedVisit(
      stride: stride,
      using: visitor
    )
}

