//
//  SemanticEquivalenceComparable.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: SemanticEquivalenceComparable - Operator
// -------------------------------------------------------------------------- //

/// Operator analogous to `<=>`, but for use with `SemanticEquivalenceComparable`.
///
/// - note: Will need to search for operators (how?) and make sure this isn't in widespread use already.
///
infix operator <~> : ComparisonPrecedence

// -------------------------------------------------------------------------- //
// MARK: SemanticEquivalenceComparable - Definition
// -------------------------------------------------------------------------- //

/// `SemanticEquivalenceComparable` is for types for which there is both:
///
/// 1. some notion of "semantic equialence" between values
/// 2. a criterion establishing some "equivalent values" as more-favorable than others
///
/// ...both of which will need some clarification moving forward.
///
/// Put briefly, however, `SemanticEquivalenceComparable` supports finer-grained
/// notions of "equivalence" than `Equatable`, like so:
///
/// - *not-equal* is mapped to `.distinct`
/// - *equal* is split into three sub-categories:
///   - `.identical`, wherein the values are *completely-identical*
///   - `.equivalentPreferLHS`, wherein:
///     - the values are semantically-equivalent (vis-a-vis the type's notion thereof)
///     - the type prefers the representation used-by `lhs` (for type-specific reasons)
///   - `.equivalentPreferRHS`, wherein:
///     - the values are semantically-equivalent (vis-a-vis the type's notion thereof)
///     - the type prefers the representation used-by `rhs` (for type-specific reasons)
///
/// Note that the above can become helpful in cases wherein the natural implementation
/// for `Equatable` is either (a) "too weak" or (b) "too strong"; I'll provide
/// one concrete example of each such scenario.
///
/// ## `Rational` and "`Equatable` too weak"
///
/// Consider a hypothetical `Rational` type with a shorthand constructor we'll
/// write like `m/n => Rational(numerator: m, denominator: n)`.
///
/// For such a type, we'd want `a == b` whenever `a` and `b` represent equivalent
/// values--e.g. we'd want `1/2 == 2/4`. Despite being the natural choice, it's
/// also a week choice insofar as we don't have a built-in way to check that,
/// say, `(2/4).reduced == (1/2)`; we can introduce custom operators like, say,
/// a "physically-identical `====` operator", or we can introduce a method like
/// `func isPhysicallyIdentical(to other: Self) -> Bool`, or we can just inline
/// comparisons between the numerators and denominators...but there's not an
/// "official" mechanism for this.
///
/// If, however, `Rational` were to conform to `SemanticEquivalenceComparable`,
/// then we could use the following semantics:
///
/// - `.distinct` when the represented values are distinct
/// - `.identical` when the physical representations are identical
/// - `.equivalentPreferLHS` when, say:
///   - the represented values are the same
///   - `lhs` has a preferable representation (e.g. smaller denominator)
/// - `.equivalentPreferRHS` when, say:
///   - the represented values are the same
///   - `rhs` has a preferable representation (e.g. smaller denominator)
///
/// ...and thus gain a well-defined way to take a finer-grained look at the
/// nature of an equivalence between two values.
///
/// ## `Tag` Entity and "`Equatable` too strong"
///
/// A second example is, for example, a managed object model that expects to
/// *lazily-deduplicate* `Tag` entities:
///
/// - there should be at-most one `Tag` for any given textual representation
/// - the user can create a `Tag` on any device, at any time
/// - cross-device syncing of `Tag`s can be delayed and has no ordering guarantee
///
/// One recipe, here, is to add an arbitrary `UUID` field to the `Tag` objects,
/// and have it autogenerated upon creation of a new `Tag`. When individual
/// devices incorporate changes originating from the syncing process, they then
/// compare all newly-created `Tag` objects against all locally-existing `Tag`
/// objects, checking for the presence of multiple distinct `Tag` objects with
/// the same textual representation.
///
/// Upon identifying such duplicates, the devices locally "pick a winner" by
/// sorting the duplicate tags on that `UUID` field and then (a) picking the
/// lowest-sorting duplicate and (b) "merging" the other duplicates into it by
/// (c) replacing all references to the other duplicates with references to the
/// winning `Tag`.
///
/// Whew! That's currently the Apple-suggested recipe for maintaining "unique"-like
/// semantics for some entity, but it illustrates a case where the notion of *equivalence*
/// is *looser* than *equality*:
///
/// - `CoreData` will be confused unless `==` means "*all managed fields* are equal"
/// - for de-duplicating we need to group objects into their *semantic* equivalence-classes, which by definition needs somethign weaker than `==`
///
/// ...and thus our table might look like so:
///
/// - `.distinct` when the `Tag`s have different textual representations
/// - `.identical` when the `Tag`s are `==` in the usual sense
/// - `.equivalentPreferLHS` for identical textual representations but `lhs` having the lesser `UUID`
/// - `.equivalentPreferRHS` for identical textual representations but `rhs` having the lesser `UUID`
///
/// This once again lets us have `==` defined "as it should be (and needs to be)"
/// while also allowing us a consistent, well-defined way to make finer-grained
/// inspections when necessary.
///
/// ## Implementation Notes
///
/// The `<~>` method is the only *required* and determines both (a) if the compared
/// values are distinct-or-equivalent and then (b) if equivalent-but-not-identical,
/// which value should be favored.
///
/// The protocol also defines numerous customization points for narrower calculations:
///
/// - are `a` and `b` equivalent-or-not?
/// - is `a` identical to `b`?
/// - are `a` and `b` identical, equivalent, or distinct?
/// - should `a` be favored over `b`?
///
/// Default implementations are provided; said defaults simply call-through to `<~>`
/// and then interpret the result.
///
/// These methods exist--and as customization points--because:
///
/// - such narrower results can likely be obtained via fewer comparisons
/// - *clients* of these types can ask for exactly what's necessary
/// - *conformers* to this protocol can override said methods to eke out a bit more performance
///
/// To understand the intuition, in a more-realistic `Tag` deduplication scenario
/// similar to that I just outlined, calculating `<~>` might require comparing
/// multiple fields for equality; checking if `foo` should be favored over `bar`,
/// however, might only look at the `UUID` field.
///
/// Code that only needs to know which is favored should just ask for that information,
/// and--in this case--a `Tag` class that provided an implementation of that method
/// could jump directly to comparing the `UUID` values, bypassing the rest of the comparisons.
///
public protocol SemanticEquivalenceComparable : Equatable {

  /// Determine the semantic equivalance between `lhs` and `rhs`; are they:
  ///
  /// - `.distinct` values altogether?
  /// - `.identical` values (e.g. equivalent and physically-equal, etc.)
  /// - `.equivalentPreferLHS`: semantic equivalence, but favor use of `lhs` over `rhs`?
  /// - `.equivalentPreferRHS`: semantic equivalence, but favor use of `rhs` over `lhs`?
  ///
  /// - parameter lhs: A value of interest
  /// - parameter rhs: A value of interest
  ///
  /// - returns: The result of evaulating the semantic-equivalence (or lack thereof) between `lhs` and `rhs`.
  ///
  /// - note: Like `<=>` the operator is visually-symmetric but the results are--necessarily!--sensitive to the ordering of the arguments.
  ///
  static func <~> (lhs: Self, rhs: Self) -> SemanticEquivalenceComparisonResult
  
  /// Check for semantic relationship (and *only* semantic relationship).
  ///
  /// *Users* who only need the semantic representation should call this just-in-case
  /// the type has provided a more-efficient, narrower implementation of this method.
  ///
  /// *Conformers* to this protocol can consider overriding this for performance,
  /// but need not do so; in many cases the default implementation will suffice.
  ///
  /// - note: Default provided, but performance in some secnmay improve
  ///
  func semanticEquivalenceRelationship(with other: Self) -> SemanticEquivalenceRelationship
  
  /// Check for semantically-identical values (e.g. `.identical`).
  ///
  /// *Users* who only need equivalence should call this just-in-case the type
  /// has provided a more-efficient, narrower implementation for this method.
  ///
  /// *Conformers* to this protocol can consider overriding this for performance,
  /// but need not do so; in many cases the default implementation will suffice.
  ///
  func hasIdenticalSemantics(to other: Self) -> Bool

  /// Check for semantic equivalence (and *only* semantic equivalance).
  ///
  /// *Users* who only need equivalence should call this just-in-case the type
  /// has provided a more-efficient, narrower implementation for this method.
  ///
  /// *Conformers* to this protocol can consider overriding this for performance,
  /// but need not do so; in many cases the default implementation will suffice.
  ///
  func hasEquivalentSemantics(to other: Self) -> Bool
  
  /// Check for favorability vis-a-vis `other` (and *only* for favorability).
  ///
  /// Allowed to have GIGO/undefined results when called on `self` and `other`
  /// that have distinct semantics.
  ///
  /// *Users* who only need to know "which is favored" should call this just-in-case
  /// the type has provided a more-efficient, specialized implementation.
  ///
  /// *Conformers* to this protocol can consider overriding this for performance,
  /// but need not do so; in many cases the default implementation will suffice.
  ///
  func shouldBeFavored(over other: Self) -> Bool
  
}

// -------------------------------------------------------------------------- //
// MARK: SemanticEquivalenceComparable - Conveniences
// -------------------------------------------------------------------------- //

public extension SemanticEquivalenceComparable {
  
  @inlinable
  func semanticEquivalenceRelationship(with other: Self) -> SemanticEquivalenceRelationship {
    switch self <~> other {
    case .distinct:
      return .distinct
    case .identical:
      return .identical
    case .equivalentPreferLHS:
      return .equivalent
    case .equivalentPreferRHS:
      return .equivalent
    }
  }
  
  @inlinable
  func hasIdenticalSemantics(to other: Self) -> Bool {
    switch self <~> other {
    case .distinct:
      return false
    case .identical:
      return true
    case .equivalentPreferLHS:
      return false
    case .equivalentPreferRHS:
      return false
    }
  }
  
  /// Convenience to check whether or not `self` and `other` have semantic
  /// equivalance; this will be true whenever `self == other`, but may also be
  /// true in cases for which `self != other`.
  ///
  @inlinable
  func hasEquivalentSemantics(to other: Self) -> Bool {
    return (self <~> other).impliesEquivalence
  }
  
  /// Convenience to see if `self` is to be favored over `other`.
  @inlinable
  func shouldBeFavored(over other: Self) -> Bool {
    switch self <~> other {
    case .distinct:
      return false
    case .identical:
      return false
    case .equivalentPreferLHS:
      return true
    case .equivalentPreferRHS:
      return false
    }
  }
  
}
