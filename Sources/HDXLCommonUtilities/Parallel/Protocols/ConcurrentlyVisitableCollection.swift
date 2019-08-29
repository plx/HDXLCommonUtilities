//
//  ConcurrentlyVisitableCollection.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: ConcurrentlyVisitableCollection - Definition
// -------------------------------------------------------------------------- //

/// Protocol for collections for which safe, efficient concurrent access can be
/// provided (e.g. via `DispatchQueue.concurrentPerform`). The reason this protocol
/// exists is that many of the custom collections in this package use COW-style
/// backing storage that, in turn, includes lazily-initialized caches of expensive
/// derived properties. Concurrent access to said collections thus unfortunately
/// risks triggering subtle leaks/heisenbugs if, e.g., some weirdness emerges from
/// non-atomic, concurrent access to those cached values.
///
/// From an implementation standpoint the protocol methods provide *advance notice*
/// of concurrent access, thereby allowing, say, the package's custom collections
/// to pre-hydrate their cached properties; not necessarily an inexpensive option,
/// but necessary to allow safe, concurrent access. I've also included (a) the
/// obvious conformances for `Array`, `ContiguousArray`, `UnsafeBufferPointer`, and
/// `UnsafeMutableBufferPointer` as well as (b) reasonable default implementations
/// for other scenarios, but named with an `unsafe` prefix; the purpose of (b) is
/// to allow for both (b.1) concurrent access to arbitrary random-access collections
/// on a "trust me this will work" basis as well as (b.2) to make it easy for
/// custom collections to adopt this protocol by forwarding-through to the `unsafe`
/// variants where appropriate.
///
/// For users of this protocol, the takeaway is simple: collections conforming
/// to this protocol support safe-and-efficient concurrent access.
///
/// Additionally, note that (a) this offers both "strided" and "unstrided" concurrent-visit
/// support and also (b) the `stride` parameter is user-supplied. The reason for this
/// is that--to be blunt--Swift doesn't provide a reasonable way to automagically
/// determine, at runtime, whether or not strided-and-unstrided would be better;
/// the relevant factors include:
///
/// - size of the collection
/// - per-element work quantity
///
/// ...and that, further:
///
/// - large collection, expensive per-element work => strided/non-strided may not matter
/// - large collection, cheap per-element work => strided
/// - small collection, expensive per-element work => non-strided
/// - small collection, cheap per-element work => maybe not even concurrent
///
/// ...with the optimal stride size, itself, being another empirical issue.
///
/// ...which brings me to my last point: it's perfectly-acceptable for a collection,
/// itself, to implement these methods without *actually* doing a *concurrent* visit
/// *or*, say, doing a strided access. This behavior can even be done at runtime,
/// for example, by having `concurrentVisit(using:)` forward to `forEach(_:)` when
/// `self.count` is below some threshhold. Doing so across the board is silly, but
/// I'm deliberately pointing this out as a valid implmentation choice.
///
/// In a similar vein, the strided access need not *actually* stride, and all
/// of the same remarks apply (mutatis mutandis, of course).
///
public protocol ConcurrentlyVisitableCollection : Collection {
  
  /// Concurrently visit all elements in `self` *without* requesting any striding.
  ///
  /// - parameter elementVisitor: A closure called on each visited `Element`.
  ///
  /// - note: Being concurrent, visitation order isn't guaranteed (but visitation-completeness is!)
  ///
  func concurrentVisit(
    using elementVisitor: (Element) -> Void
  )

  /// Concurrently visits the equivalent of `self.enumerated()`, *without* requesting any striding.
  ///
  /// - parameter elementVisitor: A closure called on each `(Int,Element)` visited.
  ///
  /// - note: Being concurrent, visitation order isn't guaranteed (but visitation-completeness is!)
  ///
  func concurrentEnumeratedVisit(
    using elementVisitor: (Int,Element) -> Void
  )

  /// Concurrently visits all elements in `self`, strided using the indicated `stride`.
  ///
  /// - parameter stride: The number of elements to visit in each "block of work".
  /// - parameter elementVisitor: A closure called on each visited `Element`.
  ///
  /// - precondition: `stride > 0`
  /// - note: Being concurrent, visitation order isn't guaranteed (but visitation-completeness is!)
  ///
  func stridedConcurrentVisit(
    stride: Int,
    using elementVisitor: (Element) -> Void)
  
  /// Concurrently visits the equivalent of `self.enumerated()`, strided
  /// using the indicated `stride`.
  ///
  /// - parameter stride: The number of elements to visit in each "block of work".
  /// - parameter elementVisitor: A closure called on each `(Int,Element)` visited.
  ///
  /// - precondition: `stride > 0`
  /// - note: Being concurrent, visitation order isn't guaranteed (but visitation-completeness is!)
  ///
  func stridedConcurrentEnumeratedVisit(
    stride: Int,
    using elementVisitor: (Int,Element) -> Void)
  
}
