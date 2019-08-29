//
//  Array+ConcurrentlyVisitableCollection.swift
//

import Foundation

extension Array : ConcurrentlyVisitableCollection {
  
  @inlinable
  public func concurrentVisit(using elementVisitor: (Element) -> Void) {
    self.unsafeConcurrentVisit(using: elementVisitor)
  }

  @inlinable
  public func concurrentEnumeratedVisit(using elementVisitor: (Int,Element) -> Void) {
    self.unsafeConcurrentEnumeratedVisit(using: elementVisitor)
  }

  @inlinable
  public func stridedConcurrentVisit(
    stride: Int,
    using elementVisitor: (Element) -> Void) {
    self.unsafeStridedConcurrentVisit(
      stride: stride,
      using: elementVisitor
    )
  }

  @inlinable
  public func stridedConcurrentEnumeratedVisit(
    stride: Int,
    using elementVisitor: (Int,Element) -> Void) {
    self.unsafeStridedConcurrentEnumeratedVisit(
      stride: stride,
      using: elementVisitor
    )
  }
  
}
