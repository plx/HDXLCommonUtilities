//
//  Collection+SetMapping.swift
//

import Foundation

public extension Sequence {
  
  /// Like `map`, but gathers the results into a `Set<T>` instead of an `Array`.
  ///
  /// Note that this exists b/c, for now, `map` conceptually wants there to be a
  /// 1:1 relationship between original items and results, but that isn't going to
  /// be true for `Set` in general; `Dictionary` solves this potential discrepancy
  /// in its own way, but nothing's in the standard library for `Set`, yet.
  ///
  /// If you don't care about collisions, etc., you may find this method of interest.
  ///
  @inlinable
  func setMap<T:Hashable>(using transform: (Element) throws -> T) rethrows -> Set<T> {
    return try Set<T>(
      self
        .lazy
        .map({
          try transform($0)
        })
    )
  }
  
  /// Like `compactMap`, but gathers the results into a `Set<T>` instead of an `Array`.
  ///
  /// Note that this exists b/c, for now, `map` conceptually wants there to be a
  /// 1:1 relationship between original items and results, but that isn't going to
  /// be true for `Set` in general; `Dictionary` solves this potential discrepancy
  /// in its own way, but nothing's in the standard library for `Set`, yet.
  ///
  /// If you don't care about collisions, etc., you may find this method of interest.
  ///
  @inlinable
  func compactSetMap<T:Hashable>(using transform: (Element) throws -> T?) rethrows -> Set<T> {
    return try Set<T>(
      self
        .lazy
        .compactMap({
          try transform($0)
        })
    )
  }
  
}
