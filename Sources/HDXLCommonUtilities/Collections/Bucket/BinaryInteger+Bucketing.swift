//
//  BinaryInteger+Bucketing.swift
//

import Foundation

public extension BinaryInteger where Stride:SignedInteger {

  /// Number of "buckets" needed when breaking `self` down into buckets of *uniform*
  /// size (except for, possibly, a partially-full final bucket).
  ///
  /// Motivated for use in handling chunked access to collections, etc., wherein
  /// there's always that potential for an awkward partially-full bucket at the end;
  /// `[0,1,2,3,4,5,6]` in buckets of size `3` becomes `[[0,1,2], [3,4,5], [6]]` (etc.).
  ///
  @inlinable
  func bucketCount(forBucketSize bucketSize: Int) -> Int {
    precondition(bucketSize > 0)
    precondition(self >= 0)
    let (buckets,remainder) = Int(self).quotientAndRemainder(
      dividingBy: bucketSize
    )
    if remainder != 0 {
      // nonzero remainder => need a final, partial bucket
      return 1 + buckets
    } else {
      // zero remainder => no need for a final, partial bucket
      return buckets
    }
  }
  
  
}
