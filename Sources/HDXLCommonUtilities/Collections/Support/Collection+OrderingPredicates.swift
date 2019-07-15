//
//  Collection+OrderingPredicates.swift
//

import Foundation

public extension Collection where Element:Comparable {
  
  @inlinable
  var isOrderedAscending: Bool {
    get {
      guard self.count > 1 else {
        return true
      }
      return zip(self, self.lazy.dropFirst()).allSatisfy() {
        $0 <= $1
      }
    }
  }
  
  @inlinable
  var isOrderedStrictlyAscending: Bool {
    get {
      guard self.count > 1 else {
        return true
      }
      return zip(self, self.lazy.dropFirst()).allSatisfy() {
        $0 < $1
      }
    }
  }
  
  @inlinable
  var isOrderedDescending: Bool {
    get {
      guard self.count > 1 else {
        return true
      }
      return zip(self, self.lazy.dropFirst()).allSatisfy() {
        $0 >= $1
      }
    }
  }
  
  @inlinable
  var isOrderedStrictlyDescending: Bool {
    get {
      guard self.count > 1 else {
        return true
      }
      return zip(self, self.lazy.dropFirst()).allSatisfy() {
        $0 > $1
      }
    }
  }
  
}
