//
//  Range+Bucketing.swift
//

import Foundation

public extension Range where Bound:BinaryInteger, Bound.Stride:SignedInteger {
  
  @inlinable
  func bucket(
    at position: Int,
    forBucketSize bucketSize: Int) -> Range<Bound> {
    precondition(position >= 0)
    precondition(bucketSize > 0)
    guard !self.isEmpty else {
      return self
    }
    let bucketLowerBound: Bound = self.lowerBound + Bound(position * bucketSize)
    let bucketUpperBound: Bound = Swift.min(self.upperBound, (bucketLowerBound + Bound(bucketSize)))
    return bucketLowerBound..<bucketUpperBound
  }
  
}
