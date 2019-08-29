//
//  Collection+SemanticEquivalence.swift
//

import Foundation

public extension Collection where Element:SemanticEquivalenceComparable {
  
  @inlinable
  func allElementsHaveEquivalentSemantics() -> Bool {
    guard let firstElement = self.first else {
      return true
    }
    return self.lazy.dropFirst().allSatisfy() {
      firstElement.hasEquivalentSemantics(to: $0)
    }
  }
  
  @inlinable
  func allElementsHaveSemantics(equivalentTo element: Element) -> Bool {
    return self.allSatisfy() {
      element.hasEquivalentSemantics(to: $0)
    }
  }
    
}
