//
//  Validatable+Collection.swift
//  
//

import Foundation

public extension Collection where Element:Validatable {

  /// `true` iff empty and all elements are *individually* valid.
  @inlinable
  var allElementsAreValid: Bool {
    get {
      // TODO: micro-benchmark? Always skeptical this is going to match the
      // performance of a manual for-loop.
      return self.allSatisfy() {
        $0.isValid
      }
    }
  }
  
  @inlinable
  var allElementsAreValidOrIndifferent: Bool {
    get {
      return self.allElementsAreValid
    }
  }

}

public extension Collection {
  
  @inlinable
  var allElementsAreValidOrIndifferent: Bool {
    get {
      guard Element.self is Validatable.Type else {
        return self.allSatisfy() {
          isValidOrIndifferent($0)
        }
      }
      return self.allSatisfy() {
        ($0 as! Validatable).isValid
      }
    }
  }

  
}
