//
//  NSPredicate+Conveniences.swift
//

import Foundation

public extension NSPredicate {
  
  /// Convenience to get a predicate with the predicates in `predicates` orred-together.
  @inlinable
  static func byOrring<S>(predicates: S) -> NSPredicate
    where
    S:Sequence,
    S.Element == NSPredicate {
      return NSCompoundPredicate(
        orPredicateWithSubpredicates: Array(predicates)
      )
  }
  
  /// Convenience to get a predicate with the predicates in `predicates` orred-together.
  @inlinable
  static func withDisjunction<S>(of predicates: S) -> NSPredicate
    where
    S:Sequence,
    S.Element == NSPredicate {
      return NSCompoundPredicate(
        orPredicateWithSubpredicates: Array(predicates)
      )
  }

  /// Convenience to get a predicate with the predicates in `predicates` anded-together.
  @inlinable
  static func byAnding<S>(predicates: S) -> NSPredicate
    where
    S:Sequence,
    S.Element == NSPredicate {
      return NSCompoundPredicate(
        andPredicateWithSubpredicates: Array(predicates)
      )
  }

  /// Convenience to get a predicate with the predicates in `predicates` anded-together.
  @inlinable
  static func withConjunction<S>(of predicates: S) -> NSPredicate
    where
    S:Sequence,
    S.Element == NSPredicate {
      return NSCompoundPredicate(
        andPredicateWithSubpredicates: Array(predicates)
      )
  }

}

