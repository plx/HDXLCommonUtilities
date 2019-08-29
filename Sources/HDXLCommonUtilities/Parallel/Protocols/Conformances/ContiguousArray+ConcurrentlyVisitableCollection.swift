//
//  ContiguousArray+ConcurrentlyVisitableCollection.swift
//

import Foundation

extension ContiguousArray : ConcurrentlyVisitableCollection {
  
  @inlinable
  public func concurrentVisit(using elementVisitor: (Element) -> Void) {
    guard !self.isEmpty else {
      return
    }
    self.withUnsafeBufferPointer() {
      (unsafeBufferPointer: UnsafeBufferPointer<Element>) -> Void
      in
      unsafeBufferPointer.concurrentVisit(
        using: elementVisitor
      )
    }
  }

  @inlinable
  public func concurrentEnumeratedVisit(using elementVisitor: (Int,Element) -> Void) {
    guard !self.isEmpty else {
      return
    }
    self.withUnsafeBufferPointer() {
      (unsafeBufferPointer: UnsafeBufferPointer<Element>) -> Void
      in
      unsafeBufferPointer.concurrentEnumeratedVisit(
        using: elementVisitor
      )
    }
  }

  @inlinable
  public func stridedConcurrentVisit(
    stride: Int,
    using elementVisitor: (Element) -> Void) {
    precondition(stride > 0)
    guard !self.isEmpty else {
      return
    }
    self.withUnsafeBufferPointer() {
      (unsafeBufferPointer: UnsafeBufferPointer<Element>) -> Void
      in
      unsafeBufferPointer.stridedConcurrentVisit(
        stride: stride,
        using: elementVisitor
      )
    }
  }

  @inlinable
  public func stridedConcurrentEnumeratedVisit(
    stride: Int,
    using elementVisitor: (Int,Element) -> Void) {
    precondition(stride > 0)
    guard !self.isEmpty else {
      return
    }
    self.withUnsafeBufferPointer() {
      (unsafeBufferPointer: UnsafeBufferPointer<Element>) -> Void
      in
      unsafeBufferPointer.stridedConcurrentEnumeratedVisit(
        stride: stride,
        using: elementVisitor
      )
    }
  }
  
}
