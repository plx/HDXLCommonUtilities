//
//  BucketCollection.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: BucketCollection - Convenience
// -------------------------------------------------------------------------- //

public extension Range where Bound:BinaryInteger, Bound.Stride:SignedInteger {
  
  /// Access the values within a `Range` as a collection of uniformly-sized "buckets"
  /// (except for, perhaps, a partially-full final bucket).
  ///
  /// - parameter bucketSize: The desired bucket size.
  ///
  /// - returns: A collection of disjoint-subrange "buckets" drawn from `self` (including, potentially, a smaller "remainder" bucket @ the end).
  ///
  @inlinable
  func bucketCollection(forBucketSize bucketSize: Int) -> BucketCollection<Bound> {
    return BucketCollection<Bound>(
      valueRange: self,
      bucketSize: bucketSize
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: BucketCollection - Definition
// -------------------------------------------------------------------------- //

/// I find it so frequently-necessary to view a range-of-integers as, instead,
/// a collection of disjoint, (mostly) uniformly-sized 'buckets' it makes sense
/// to put the necessary math, logic, etc., into a collection--so I did!
///
/// Mostly useful as a tool for building on, pretty rare to need in and of itself.
public struct BucketCollection<Representation>
  where
  Representation:BinaryInteger,
  Representation.Stride: SignedInteger {
  
  public typealias ValueRange = Range<Representation>
  
  /// The range of values that need bucketing.
  public var valueRange: ValueRange
  
  /// The desired bucket size.
  public var bucketSize: Int
  
  /// Componentwise initializer for `BucketCollection`.
  ///
  /// - parameter valueRange: The range of values that need bucketing.
  /// - parameter bucketSize: The desired bucket size.
  ///
  /// - returns: A collection of disjoint-subrange "buckets" drawn from `self` (including, potentially, a smaller "remainder" bucket @ the end).
  ///
  @inlinable
  public init(
    valueRange: ValueRange,
    bucketSize: Int) {
    self.valueRange = valueRange
    self.bucketSize = bucketSize
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: BucketCollection - Support
// -------------------------------------------------------------------------- //

public extension BucketCollection {
  
  /// Get the lower bound of the underlying range.
  @inlinable
  var lowerBound: Representation {
    get {
      return self.valueRange.lowerBound
    }
  }
  
  /// Get the upper bound of the underlying range.
  @inlinable
  var upperBound: Representation {
    get {
      return self.valueRange.upperBound
    }
  }
  
  /// Count of the distinct *values* contained within self.
  @inlinable
  var valueCount: Int {
    get {
      return self.valueRange.count
    }
  }
  
  @inlinable
  var bucketCount: Int {
    get {
      self.valueCount.bucketCount(
        forBucketSize: self.bucketSize
      )
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: BucketCollection - Validatable
// -------------------------------------------------------------------------- //

extension BucketCollection : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      return self.bucketSize > 0
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: BucketCollection - Equatable
// -------------------------------------------------------------------------- //

extension BucketCollection : Equatable {
  
  @inlinable
  public static func ==(
    lhs: BucketCollection<Representation>,
    rhs: BucketCollection<Representation>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    guard
      lhs.valueRange == rhs.valueRange,
      lhs.bucketSize == rhs.bucketSize else {
        return false
    }
    return true
  }

}

// -------------------------------------------------------------------------- //
// MARK: BucketCollection - Hashable
// -------------------------------------------------------------------------- //

extension BucketCollection : Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.valueRange.hash(into: &hasher)
    self.bucketSize.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: BucketCollection - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension BucketCollection : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "\(self.lowerBound)..<\(self.upperBound) w/bucket-size \(self.bucketSize)"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: BucketCollection - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension BucketCollection : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "BucketCollection<\(String(reflecting: Representation.self))>(valueRange: \(String(reflecting: self.valueRange)), bucketSize: \(String(reflecting: self.bucketSize)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: BucketCollection - Codable
// -------------------------------------------------------------------------- //

extension BucketCollection where Representation:Codable {
  
  // synthesized ok
  
}

// -------------------------------------------------------------------------- //
// MARK: BucketCollection - RandomAccessCollection
// -------------------------------------------------------------------------- //

extension BucketCollection : RandomAccessCollection {
  
  public typealias Index = Int
  public typealias Element = Range<Representation>
  
  @inlinable
  public var isEmpty: Bool {
    get {
      return self.valueRange.isEmpty
    }
  }
  
  @inlinable
  public var count: Int {
    get {
      return self.bucketCount
    }
  }
  
  @inlinable
  public var startIndex: Index {
    get {
      return 0
    }
  }

  @inlinable
  public var endIndex: Index {
    get {
      return self.bucketSize
    }
  }

  @inlinable
  public subscript(index: Index) -> Element {
    get {
      guard index < self.count else {
        preconditionFailure("Attempted to subscript the `endIndex` \(index) on \(String(reflecting: self))!")
      }
      return self.valueRange.bucket(
        at: index,
        forBucketSize: self.bucketSize
      )
    }
  }
    
}
