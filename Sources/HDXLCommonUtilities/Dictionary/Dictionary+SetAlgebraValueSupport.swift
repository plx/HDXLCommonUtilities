//
//  Dictionary+SetAlgebraValueSupport.swift
//

import Foundation

public extension Dictionary where Value:SetAlgebra {
  
//  @inlinable
//  func keywiseUnion(
//    with other: [Key:Value],
//    omittingEmptySets: Bool = true) -> [Key:Value] {
//    guard !self.isEmpty else {
//      return other
//    }
//    guard !other.isEmpty else {
//      return self
//    }
//    let keySet = Set<Key>(chain(self.keys, other.keys))
//    var result = Dictionary<Key,Value>(minimumCapacity: keySet.count)
//    let sharedEmptySet = Value()
//    for key in keySet {
//      let setForKey = (self[key] ?? sharedEmptySet).union(other[key] ?? sharedEmptySet)
//      if !setForKey.isEmpty || !omittingEmptySets {
//        result[key] = setForKey
//      }
//    }
//    return result
//  }
//  
//  @inlinable
//  mutating func formKeywiseUnion(
//    with other: [Key:Value],
//    omittingEmptySets: Bool = true) {
//    for (key,set) in other {
//      if let existingIndex = self.index(forKey: key) {
//        if set.isEmpty && omittingEmptySets && self.values[existingIndex].isEmpty {
//          self.remove(at: existingIndex)
//        } else {
//          self.values[existingIndex].formUnion(set)
//        }
//      } else if !set.isEmpty || !omittingEmptySets {
//        self[key] = set
//      }
//    }
//  }
//  
//  @inlinable
//  func isKeywiseDisjoint(with other: [Key:Value]) -> Bool {
//    // NOTE: for a disjointness check we only need to look @ the keys in common,
//    // and thus b/c any common key *must* be in both, we can get away with only
//    // iterating through the keys of the smaller dictionary (between `self` and `other`).
//    //
//    //
//    let smallerKeys: Keys = self.count <= other.count ? self.keys : other.keys
//    for key in smallerKeys {
//      if
//        let thisSet = self[key],
//        let thatSet = other[key],
//        !thisSet.isDisjoint(with: thatSet) {
//        return false
//      }
//    }
//    return true
//  }
//  
//  @inlinable
//  func isKeywiseSubset(of other: [Key:Value]) -> Bool {
//    guard !self.isEmpty else {
//      return true
//    }
//    guard self.count <= other.count else {
//      return false
//    }
//    for (key, thisValueSet) in self {
//      guard
//        let thatValueSet = other[key],
//        thisValueSet.isSubset(of: thatValueSet) else {
//          return false
//      }
//    }
//    return true
//  }
//
//  @inlinable
//  func isKeywiseSuperset(of other: [Key:Value]) -> Bool {
//    return other.isKeywiseSubset(of: self)
//  }

}

