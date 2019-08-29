//
//  Sequence+ProjectionHistogram.swift
//

import Foundation

public extension Sequence {
  
  /// Prepares a histogram like `[Identifier:Int]` given a sequence of elements
  /// along with a projection from said elements to that `Identifier`.
  ///
  /// The motivation for `expectedIdentifiers` is for downstream use like `for (identifier,count) in histogram`.
  /// By default, all un-observed identifiers will be absent from the histogram,
  /// but you can use this parameter to guarantee the presence of important identifiers
  /// within the histogram despite their absence from the original sequence.
  ///
  /// - parameter expectedIdentifiers: A set of identifiers the presence of-which you wish to guarantee. Optional parameter, defaulting to the empty set.
  /// - parameter projection: A mapping from `Element`s to their `Identifier`s.
  ///
  /// - returns: A dictionary mapping `Identifier`s to their observed counts.
  ///
  @inlinable
  func projectionHistogram<Identifier:Hashable>(
    expectedIdentifiers: Set<Identifier> = [],
    projection: (Element) -> Identifier) -> [Identifier:Int] {
    var histogram: [Identifier:Int] = [Identifier:Int](minimumCapacity: expectedIdentifiers.count)
    for identifier in expectedIdentifiers {
      histogram[identifier] = 0
    }
    for element in self {
      histogram[projection(element), default: 0] += 1
    }
    if !expectedIdentifiers.isEmpty {
      for identifier in expectedIdentifiers {
        histogram[identifier] = histogram[identifier] ?? 0
      }
    }
    return histogram
  }
  
  /// Prepares a histogram like `[Identifier:Int]` given a sequence of elements
  /// along with a projection from said elements to that `Identifier`.
  ///
  /// Differs from `projectionHistogram` in that `projectionHistogram`'s projection
  /// is of the form `(Element) -> Identifier` but this uses `(Element) -> Identifier?`,
  /// and this automatically-ignores any `nil` projections it encounters.
  ///
  /// The motivation for `expectedIdentifiers` is for downstream use like `for (identifier,count) in histogram`.
  /// By default, all un-observed identifiers will be absent from the histogram,
  /// but you can use this parameter to guarantee the presence of important identifiers
  /// within the histogram despite their absence from the original sequence.
  ///
  /// - parameter expectedIdentifiers: A set of identifiers the presence of-which you wish to guarantee. Optional parameter, defaulting to the empty set.
  /// - parameter projection: A mapping from `Element`s to `Identifier?`; returning `nil` results in the element being ignored from the count.
  ///
  /// - returns: A dictionary mapping `Identifier`s to their observed counts.
  ///
  /// - todo: Consider a version returning e.g. `(Int,[Identifier:Int])` wherein the `Int` is the count of elements mapped to `nil`; I haven't needed it, yet.
  ///
  @inlinable
  func compactProjectionHistogram<Identifier:Hashable>(
    expectedIdentifiers: Set<Identifier> = [],
    projection: (Element) -> Identifier?) -> [Identifier:Int] {
    var histogram: [Identifier:Int] = [Identifier:Int](minimumCapacity: expectedIdentifiers.count)
    for identifier in expectedIdentifiers {
      histogram[identifier] = 0
    }
    for element in self {
      if let identifer = projection(element) {
        histogram[identifer, default: 0] += 1
      }
    }
    return histogram
  }

}
