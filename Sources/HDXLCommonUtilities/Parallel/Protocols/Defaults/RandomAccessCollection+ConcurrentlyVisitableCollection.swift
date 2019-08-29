//
//  RandomAccessCollection+ConcurrentlyVisitableCollection.swift
//

import Foundation

public extension RandomAccessCollection {
  
  @inlinable
  func unsafeConcurrentVisit(using elementVisitor: (Element) -> Void) {
    guard !self.isEmpty else {
      return
    }
    let didIt: Bool = self.withContiguousStorageIfAvailable() {
      (unsafeBufferPointer: UnsafeBufferPointer<Element>) -> Bool
      in
      unsafeBufferPointer.concurrentVisit(
        using: elementVisitor
      )
      return true
    } ?? false
    if !didIt {
      self.naiveConcurrentVisit(
        using: elementVisitor
      )
    }
  }

  @inlinable
  func unsafeConcurrentEnumeratedVisit(using elementVisitor: (Int,Element) -> Void) {
    guard !self.isEmpty else {
      return
    }
    let didIt: Bool = self.withContiguousStorageIfAvailable() {
      (unsafeBufferPointer: UnsafeBufferPointer<Element>) -> Bool
      in
      unsafeBufferPointer.concurrentEnumeratedVisit(
        using: elementVisitor
      )
      return true
    } ?? false
    if !didIt {
      self.naiveConcurrentEnumeratedVisit(
        using: elementVisitor
      )
    }
  }

  @inlinable
  func unsafeStridedConcurrentVisit(
    stride: Int,
    using elementVisitor: (Element) -> Void) {
    precondition(stride > 0)
    guard !self.isEmpty else {
      return
    }
    let didIt: Bool = self.withContiguousStorageIfAvailable() {
      (unsafeBufferPointer: UnsafeBufferPointer<Element>) -> Bool
      in
      unsafeBufferPointer.stridedConcurrentVisit(
        stride: stride,
        using: elementVisitor
      )
      return true
    } ?? false
    if !didIt {
      self.naiveStridedConcurrentVisit(
        stride: stride,
        using: elementVisitor
      )
    }
  }

  @inlinable
  func unsafeStridedConcurrentEnumeratedVisit(
    stride: Int,
    using elementVisitor: (Int,Element) -> Void) {
    precondition(stride > 0)
    guard !self.isEmpty else {
      return
    }
    let didIt: Bool = self.withContiguousStorageIfAvailable() {
      (unsafeBufferPointer: UnsafeBufferPointer<Element>) -> Bool
      in
      unsafeBufferPointer.stridedConcurrentEnumeratedVisit(
        stride: stride,
        using: elementVisitor
      )
      return true
    } ?? false
    if !didIt {
      self.naiveStridedConcurrentEnumeratedVisit(
        stride: stride,
        using: elementVisitor
      )
    }
  }
  
  @inlinable
  internal func naiveConcurrentVisit(using elementVisitor: (Element) -> Void) {
    guard !self.isEmpty else {
      return
    }
    DispatchQueue.concurrentPerform(iterations: self.count) {
      (iteration: Int) -> Void
      in
      elementVisitor(
        self[
          self.index(
            offsetFromStartBy: iteration
          )
        ]
      )
    }
  }

  @inlinable
  internal func naiveConcurrentEnumeratedVisit(using elementVisitor: (Int,Element) -> Void) {
    guard !self.isEmpty else {
      return
    }
    DispatchQueue.concurrentPerform(iterations: self.count) {
      (iteration: Int) -> Void
      in
      elementVisitor(
        iteration,
        self[
          self.index(
            offsetFromStartBy: iteration
          )
        ]
      )
    }
  }

  @inlinable
  internal func naiveStridedConcurrentVisit(
    stride: Int,
    using elementVisitor: (Element) -> Void) {
    precondition(stride > 0)
    guard !self.isEmpty else {
      return
    }
    guard stride > 1 else {
      self.naiveConcurrentVisit(
        using: elementVisitor
      )
      return
    }
    DispatchQueue.stridedConcurrentPerform(
      iterations: self.count,
      stride: stride) {
        (iteration: Int) -> Void
        in
        elementVisitor(
          self[
            self.index(
              offsetFromStartBy: iteration
            )
          ]
        )
    }
  }

  @inlinable
  internal func naiveStridedConcurrentEnumeratedVisit(
    stride: Int,
    using elementVisitor: (Int,Element) -> Void) {
    precondition(stride > 0)
    guard !self.isEmpty else {
      return
    }
    guard stride > 1 else {
      self.naiveConcurrentEnumeratedVisit(
        using: elementVisitor
      )
      return
    }
    DispatchQueue.stridedConcurrentPerform(
      iterations: self.count,
      stride: stride) {
        (iteration: Int) -> Void
        in
        elementVisitor(
          iteration,
          self[
            self.index(
              offsetFromStartBy: iteration
            )
          ]
        )
    }
  }

}
