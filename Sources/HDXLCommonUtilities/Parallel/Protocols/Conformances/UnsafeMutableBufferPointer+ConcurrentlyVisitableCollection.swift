//
//  UnsafeMutableBufferPointer+ConcurrentlyVisitableCollection.swift
//

import Foundation

extension UnsafeMutableBufferPointer : ConcurrentlyVisitableCollection {
  
  @inlinable
  public func concurrentVisit(using elementVisitor: (Element) -> Void) {
    guard
      !self.isEmpty,
      let address = self.baseAddress else {
      return
    }
    DispatchQueue.concurrentPerform(iterations: self.count) {
      (iteration: Int) -> Void
      in
      elementVisitor(
        address[iteration]
      )
    }
  }

  @inlinable
  public func concurrentEnumeratedVisit(using elementVisitor: (Int,Element) -> Void) {
    guard
      !self.isEmpty,
      let address = self.baseAddress else {
      return
    }
    DispatchQueue.concurrentPerform(iterations: self.count) {
      (iteration: Int) -> Void
      in
      elementVisitor(
        iteration,
        address[iteration]
      )
    }
  }

  @inlinable
  public func stridedConcurrentVisit(
    stride: Int,
    using elementVisitor: (Element) -> Void) {
    precondition(stride > 0)
    guard
      !self.isEmpty,
      let address = self.baseAddress else {
      return
    }
    guard stride > 1 else {
      self.concurrentVisit(
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
          address[iteration]
        )
    }
  }

  @inlinable
  public func stridedConcurrentEnumeratedVisit(
    stride: Int,
    using elementVisitor: (Int,Element) -> Void) {
    precondition(stride > 0)
    guard
      !self.isEmpty,
      let address = self.baseAddress else {
      return
    }
    guard stride > 1 else {
      self.concurrentEnumeratedVisit(
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
          address[iteration]
        )
    }
  }
  
}
