//
//  ConcurrentPerform.swift
//

import Foundation
import Dispatch

public extension DispatchQueue {
  
  @inlinable
  static func stridedConcurrentPerform(
    iterations: Int,
    stride: Int,
    executing work: (Range<Int>) -> Void) {
    precondition(iterations >= 0)
    precondition(stride > 0)
    let (completeStrides, remainder) = iterations.quotientAndRemainder(dividingBy: stride)
    let strideCount = remainder == 0 ? completeStrides : completeStrides + 1
    self.concurrentPerform(iterations: strideCount) {
      (strideIndex: Int) -> Void
      in
      let strideStart = strideIndex * stride
      let strideLimit = min(
        (1 + strideIndex) * stride,
        iterations
      )
      work(strideStart..<strideLimit)
    }
  }
  
  @inlinable
  static func stridedConcurrentPerform(
    iterations: Int,
    stride: Int,
    executing work: (Int) -> Void) {
    precondition(iterations >= 0)
    precondition(stride > 0)
    let (completeStrides, remainder) = iterations.quotientAndRemainder(dividingBy: stride)
    let strideCount = remainder == 0 ? completeStrides : completeStrides + 1
    self.concurrentPerform(iterations: strideCount) {
      (strideIndex: Int) -> Void
      in
      let strideStart = strideIndex * stride
      let strideLimit = min(
        (1 + strideIndex) * stride,
        iterations
      )
      for iteration in strideStart..<strideLimit {
        work(iteration)
      }
    }
  }

  
}
