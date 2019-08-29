//
//  UniqueableManagedObjectEquivalenceTable.swift
//

import Foundation

public struct SemanticEquivalenceTable<Element:SemanticEquivalenceClassIdentifierConvertible> {

  public typealias EquivalenceClass = SemanticEquivalenceClass<Element>
  public typealias Identifier = EquivalenceClass.Identifier

  @usableFromInline
  internal typealias TableEntry = SemanticEquivalenceTableEntry<Element>
  
  @usableFromInline
  internal typealias Table = [Identifier:TableEntry]
  
  @usableFromInline
  internal var table: Table
  
  @inlinable
  internal init() {
    self.table = Table()
  }
  
  @inlinable
  public init<S:Sequence>(elements: S) where S.Element == Element {
    self.init()
    self.incorporate(elements: elements)
  }
  
}

extension SemanticEquivalenceTable : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      return self.table.allValuesAreValid
    }
  }
  
}

public extension SemanticEquivalenceTable {
  
  @inlinable
  var equivalenceClasses: AnyCollection<EquivalenceClass> {
    get {
      return AnyCollection<EquivalenceClass>(
        self
          .table
          .values
          .lazy
          .map({ $0.equivalenceClasses })
          .joined()
      )
    }
  }
  
  @inlinable
  var isEmpty: Bool {
    get {
      return self.table.isEmpty
    }
  }
  
  @inlinable
  var semanticEquivalenceClassIdentifiers: Set<Identifier> {
    get {
      return Set<Identifier>(self.table.keys)
    }
  }
  
  @inlinable
  internal mutating func incorporate(element: Element) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(self.isValid)
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    let semanticEquivalenceClassIdentifier = element.semanticEquivalenceClassIdentifier
    if let indexOfExistingTableEntry = self.table.index(forKey: semanticEquivalenceClassIdentifier) {
      self.table.values[indexOfExistingTableEntry].incorporate(
        element: element
      )
    } else {
      self.table[semanticEquivalenceClassIdentifier] = TableEntry(
        referenceElement: element
      )
    }
  }
  
  @inlinable
  internal mutating func incorporate<S:Sequence>(elements: S) where S.Element == Element {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(self.isValid)
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    for element in elements {
      self.incorporate(element: element)
    }
  }

  // TODO: introduce the pruning concept, here
//  @inlinable
//  public mutating func filter(preservingOnlyThoseSatisfying  relevantObjects: Set<Object>) {
//    // /////////////////////////////////////////////////////////////////////////
//    pedantic_assert(self.isValid)
//    defer { pedantic_assert(self.isValid) }
//    defer { pedantic_assert(self.table.values.allSatisfy({!$0.isDisjoint(with: relevantObjects)}))}
//    // /////////////////////////////////////////////////////////////////////////
//    guard !relevantObjects.isEmpty else {
//      self.table.removeAll()
//      return
//    }
//    let identifiers = Set(self.table.keys)
//    for identifier in identifiers {
//      guard let becameEmpty = self.table[identifier]?.unsafe_prune(preservingOnlyThoseIntersecting: relevantObjects) else {
//          continue
//      }
//      if becameEmpty {
//        self.table.removeValue(
//          forKey: identifier
//        )
//      }
//    }
//  }
  
}
