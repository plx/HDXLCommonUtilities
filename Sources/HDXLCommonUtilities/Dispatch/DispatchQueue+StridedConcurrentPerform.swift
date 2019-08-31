//
//  DispatchQueue+StridedConcurrentPerform.swift
//

import Foundation
import Dispatch

public extension DispatchQueue {
  
  /// Does concurrent-perform, providing access to buckets-qua-buckets.
  @inlinable
  static func bucketedStridedConcurrentPerform(
    iterations: Int,
    stride: Int,
    executing work: (Range<Int>) -> Void) {
    precondition(iterations >= 0)
    precondition(stride > 0)
    let buckets = (0..<iterations).bucketCollection(
      forBucketSize: stride
    )
    // ^ note: `buckets` is *completely-safe* for concurrent access as-done below.
    self.concurrentPerform(iterations: buckets.count) {
      (bucketIndex: Int) -> Void
      in
      work(buckets[bucketIndex])
    }
  }
  
  /// Streamlines use of strided chunks with `DispatchQueue.concurrentPerform(iterations:_:)`.
  ///
  /// Essentially the issue is that (a) `DispatchQueue.concurrentPerform(iterations:_:)` does
  /// the naive thing, and is *conceptually* akin to, say, doing this:
  ///
  /// ```
  /// // setup a group here
  /// for iteration in 0..<iterations {
  ///   queue.async() { work(iteration) }
  /// }
  /// // wait on group here
  /// ```
  ///
  /// ...and has similar performance characteristics: if you request `iterations`
  /// iterations, you're going to pay the cost of dispatching an individual work item
  /// each of `iterations` times; yes, what happens under the hood is quite a bit smarter
  /// in how it does its dispatching--at least AIUI--but that still doesn't avoid paying
  /// the cost of *dispatching* each of your iterations.
  ///
  /// Apple thus advises you to consider using a chunked dispatch pattern, wherein
  /// if you have, say, 100,000 tiny work items, maybe you dispatch 1000 iterations,
  /// each of which handles a block of 100 individual work items. The tradeoff here
  /// is you pay less dispatch overhead but potentially wind up with less parallelism
  /// (due to having "too few batches" vis-a-vis the available resources) and/or
  /// less-efficient parallelism (due to e.g. having number 22 in a block of 100 be
  /// some horribly-slow "straggler", and having no way of fobbing off items 23 onwards
  /// to resources that *could* steal that work, etc.).
  ///
  /// This method doesn't try to do anything *smart*, but it does let you adopt
  /// a strided/chunked dispatch strategy while sticking with the single-item-at-a-time
  /// signature for your closure.
  ///
  /// - parameter iterations: The iterations to perform (in total, and e.g. independent of all striding and chunking).
  /// - parameter stride: The size of the individual "chunks of work" to visit.
  /// - parameter work: Closure with the per-item work to be done.
  ///
  @inlinable
  static func stridedConcurrentPerform(
    iterations: Int,
    stride: Int,
    executing work: (Int) -> Void) {
    precondition(iterations >= 0)
    precondition(stride > 0)
    let buckets = (0..<iterations).bucketCollection(
      forBucketSize: stride
    )
    self.concurrentPerform(iterations: buckets.count) {
      (bucketIndex: Int) -> Void
      in
      for iteration in buckets[bucketIndex] {
        work(iteration)
      }
    }
  }
  
}
