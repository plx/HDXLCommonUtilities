//
//  Collection+CabooseSupport.swift
//

import Foundation

public extension Collection {

  /// Obtain a "caboose collection" appending the `caboose` to `self`.
  @inlinable
  func appendingCaboose(_ caboose: Element) -> CabooseCollection<Self> {
    return CabooseCollection<Self>(
      source: self,
      caboose: caboose
    )
  }
  
  /// Convenience to "simultaneously" obtain a caboose-collection for which we
  /// must also "homogeneize" our contents vis-a-vis the caboose.
  ///
  /// For example, `IndexPositionStorage<T>` has `.end` and `.position(T)`, and
  /// when `T:CaseIterable`, `IndexPositionStorage:CaseIterable`, morally-speaking,
  /// should be `T.allCases.appendingCaboose(.end)`, except the types won't work:
  ///
  /// - `T.allCases` has elements of type `T` (not `IndexPositionStorage<T>`)
  /// - `.end` is of type `IndexPositionStorage<T>`
  ///
  /// ...and this method is a convenience to write `T.allCases.homogeneizing(forCaboose: .end) { .position($0) }`,
  /// which is quite a bit shorter than spelling it all out the long way.
  @inlinable
  func homogeneizing<T>(
    forCaboose caboose: T,
    using transformation: @escaping (Element) -> T) -> CabooseCollection<OnDemandDirectMap<Self,T>> {
    return CabooseCollection<OnDemandDirectMap<Self,T>>(
      source: self.directlyMappedOnDemand(
        using: transformation
      ),
      caboose: caboose
    )
  }
  
}
