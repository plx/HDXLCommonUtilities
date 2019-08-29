//
//  Product5Collection+ConcurrentlyVisitableCollection.swift
//

import Foundation
import Dispatch

extension Product5Collection : ConcurrentlyVisitableCollection {

  @inlinable
  public func concurrentVisit(
    using elementVisitor: (Element) -> Void) {
    let count = self.count
    guard self.count > 0 else {
      return
    }
    // to avoid possible race conditions arising due to multiple threads
    // triggering lazy-property population (semantically "ok", i worry about
    // memory leaks or other weirdness)
    self.fullyPopulateCaches()
    // /////////////////////////////////////////////////////////////////////////
    precondition(self.hasFullyPopulatedCaches) // <- to (hopefully) detect optimizer-eliminated cache-population
    // /////////////////////////////////////////////////////////////////////////
    DispatchQueue.concurrentPerform(iterations: count) {
        (iteration: Int) -> Void
        in
        elementVisitor(
          self.storage[
            self.storage.position(
              forLinearPosition: iteration
            )
          ]
        )
    }
  }

  @inlinable
  public func concurrentEnumeratedVisit(
    using elementVisitor: (Int,Element) -> Void) {
    let count = self.count
    guard self.count > 0 else {
      return
    }
    // to avoid possible race conditions arising due to multiple threads
    // triggering lazy-property population (semantically "ok", i worry about
    // memory leaks or other weirdness)
    self.fullyPopulateCaches()
    // /////////////////////////////////////////////////////////////////////////
    precondition(self.hasFullyPopulatedCaches) // <- to (hopefully) detect optimizer-eliminated cache-population
    // /////////////////////////////////////////////////////////////////////////
    DispatchQueue.concurrentPerform(iterations: count) {
        (iteration: Int) -> Void
        in
        elementVisitor(
          iteration,
          self.storage[
            self.storage.position(
              forLinearPosition: iteration
            )
          ]
        )
    }
  }

  @inlinable
  public func stridedConcurrentVisit(
    stride: Int,
    using elementVisitor: (Element) -> Void) {
    let count = self.count
    guard self.count > 0 else {
      return
    }
    // to avoid possible race conditions arising due to multiple threads
    // triggering lazy-property population (semantically "ok", i worry about
    // memory leaks or other weirdness)
    self.fullyPopulateCaches()
    // /////////////////////////////////////////////////////////////////////////
    precondition(self.hasFullyPopulatedCaches) // <- to (hopefully) detect optimizer-eliminated cache-population
    // /////////////////////////////////////////////////////////////////////////
    DispatchQueue.stridedConcurrentPerform(
      iterations: count,
      stride: stride) {
        (iteration: Int) -> Void
        in
        elementVisitor(
          self.storage[
            self.storage.position(
              forLinearPosition: iteration
            )
          ]
        )
    }
  }

  @inlinable
  public func stridedConcurrentEnumeratedVisit(
    stride: Int,
    using elementVisitor: (Int,Element) -> Void) {
    let count = self.count
    guard self.count > 0 else {
      return
    }
    // to avoid possible race conditions arising due to multiple threads
    // triggering lazy-property population (semantically "ok", i worry about
    // memory leaks or other weirdness)
    self.fullyPopulateCaches()
    // /////////////////////////////////////////////////////////////////////////
    precondition(self.hasFullyPopulatedCaches) // <- to (hopefully) detect optimizer-eliminated cache-population
    // /////////////////////////////////////////////////////////////////////////
    DispatchQueue.stridedConcurrentPerform(
      iterations: count,
      stride: stride) {
        (iteration: Int) -> Void
        in
        elementVisitor(
          iteration,
          self.storage[
            self.storage.position(
              forLinearPosition: iteration
            )
          ]
        )
    }
  }

}
