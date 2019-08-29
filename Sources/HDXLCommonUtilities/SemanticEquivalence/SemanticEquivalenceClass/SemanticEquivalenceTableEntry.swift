//
//  SemanticEquivalenceTableEntry.swift
//

import Foundation

@usableFromInline
internal struct SemanticEquivalenceTableEntry<Element:SemanticEquivalenceClassIdentifierConvertible> {
  
  @usableFromInline
  internal typealias EquivalenceClass = SemanticEquivalenceClass<Element>
  
  @usableFromInline
  internal typealias Identifier = Element.SemanticEquivalenceClassIdentifier
  
  @usableFromInline
  internal let semanticEquivalenceClassIdentifier: Identifier
  
  @usableFromInline
  internal var equivalenceClasses: [EquivalenceClass]
  
  @inlinable
  internal init(referenceElement: Element) {
    // /////////////////////////////////////////////////////////////////////////
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self.semanticEquivalenceClassIdentifier = referenceElement.semanticEquivalenceClassIdentifier
    self.equivalenceClasses = [
      EquivalenceClass(
        referenceElement: referenceElement
      )
    ]
  }
  
}

extension SemanticEquivalenceTableEntry : Validatable {
  
  @inlinable
  internal var isValid: Bool {
    get {
      guard
        !self.equivalenceClasses.isEmpty,
        self.equivalenceClasses.allElementsAreValidOrIndifferent,
        self.equivalenceClasses.allSatisfy({$0.semanticEquivalenceClassIdentifier == self.semanticEquivalenceClassIdentifier}) else {
        return false
      }
      return true
    }
  }
  
}

internal extension SemanticEquivalenceTableEntry {
  
  @inlinable
  func contains(element: Element) -> Bool {
    guard element.semanticEquivalenceClassIdentifier == self.semanticEquivalenceClassIdentifier else {
      return false
    }
    for equivalenceClass in self.equivalenceClasses where equivalenceClass.contains(element: element) {
      return true
    }
    return false
  }
  
  @inlinable
  mutating func incorporate(element: Element) {
    precondition(element.semanticEquivalenceClassIdentifier == self.semanticEquivalenceClassIdentifier)
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(self.isValid)
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    if let indexOfExistingIndexClass = self.equivalenceClasses.firstIndex(where: {$0.shouldInclude(element: element)}) {
      self.equivalenceClasses[indexOfExistingIndexClass].incorporate(
        element: element
      )
    } else {
      self.equivalenceClasses.append(
        EquivalenceClass(
          referenceElement: element
        )
      )
    }
  }
//
//  @inlinable
//  func isDisjoint(with elements: Set<Element>) -> Bool {
//    guard !self.equivalenceClasses.isEmpty else {
//      return true
//    }
//    return self.equivalenceClasses.allSatisfy() {
//      $0.isDisjoint(with: elements)
//    }
//  }
  
//  @inlinable
//  mutating func unsafe_prune(preservingOnlyThoseIntersecting relevantElements: Set<Element>) -> Bool {
//    self.equivalenceClasses.removeAll(
//      where: {
//        (equivalenceClass: UniqueableManagedElementEquivalenceClass<Element>) -> Bool
//        in
//        return equivalenceClass.isDisjoint(with: relevantElements)
//      }
//    )
//    return self.equivalenceClasses.isEmpty
//  }

}
