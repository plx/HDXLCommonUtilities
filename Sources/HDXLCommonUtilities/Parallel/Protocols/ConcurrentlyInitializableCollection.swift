//
//  ConcurrentlyInitializableCollection.swift
//

import Foundation

/// `ConcurrentlyInitializableCollection` is for collections that can be *populated*
/// concurrently from (a transformation-of) a concurrently-visitable source collection.
///
/// The prototypical examples include the stdlib's `Array` and `ContiguousArray`,
/// for which we have an initializer that is granted direct access to the uninitialized
/// backing memory (thereby allowing us to *safely* populate the contents concurrently,
/// as long as we do so with adequate care).
///
/// As with `ConcurrentlyVisitableCollection`, this includes 4 distinct methods
/// for strided/unstrided access including/not-including an `Int` positional value;
/// it's the caller's responsibility to choose wisely, since at runtime we typically
/// lack the necessary information to automatically determine the optimal choice.
///
/// - note: In theory this isn't really tied to `Collection`, but I'm leaving it this way for now.
///
public protocol ConcurrentlyInitializableCollection : Collection {
  
  /// Initializes `self` as the elementwise-`transformation` of `source`, using
  /// the unstrided, unenumerated visitation strategy.
  init<Source:ConcurrentlyVisitableCollection>(
    concurrentlyFromElements source: Source,
    using transformation: (Source.Element) -> Element)

  /// Initializes `self` as the elementwise-`transformation` of `source`, using
  /// the unstrided, enumerated visitation strategy.
  init<Source:ConcurrentlyVisitableCollection>(
    concurrentlyFromEnumeratedElements source: Source,
    using transformation: (Int,Source.Element) -> Element)

  /// Initializes `self` as the elementwise-`transformation` of `source`, using
  /// the strided-by-`stride`, unenumerated visitation strategy.
  init<Source:ConcurrentlyVisitableCollection>(
    fromElements source: Source,
    concurrentlyWithStride stride: Int,
    using transformation: (Source.Element) -> Element)

  /// Initializes `self` as the elementwise-`transformation` of `source`, using
  /// the strided-by-`stride`, enumerated visitation strategy.
  init<Source:ConcurrentlyVisitableCollection>(
    fromEnumeratedElements source: Source,
    concurrentlyWithStride stride: Int,
    using transformation: (Int,Source.Element) -> Element)

}

