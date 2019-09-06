//
//  AlgebraicProduct7.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct7 - Definition
// -------------------------------------------------------------------------- //

public protocol AlgebraicProduct7 : AlgebraicProduct
  where
  ArityPosition == Arity7Position {
  
  // ------------------------------------------------------------------------ //
  // MARK: Component Types
  // ------------------------------------------------------------------------ //
  
  associatedtype A
  associatedtype B
  associatedtype C
  associatedtype D
  associatedtype E
  associatedtype F
  associatedtype G

  // ------------------------------------------------------------------------ //
  // MARK: Related Types
  // ------------------------------------------------------------------------ //
  
  /// Shorthand for the same-arity sum type.
  ///
  /// It'd be accurate to call this an "algebraic dual", but I find this name
  /// easier to follow (even if dual is arguably more-proper, here).
  typealias AssociatedSum = Sum7<A,B,C,D,E,F,G>

  // ------------------------------------------------------------------------ //
  // MARK: Component Properties
  // ------------------------------------------------------------------------ //

  var a: A { get set }
  var b: B { get set }
  var c: C { get set }
  var d: D { get set }
  var e: E { get set }
  var f: F { get set }
  var g: G { get set }

  // ------------------------------------------------------------------------ //
  // MARK: Initialization
  // ------------------------------------------------------------------------ //
  
  init(
    _ a: A,
    _ b: B,
    _ c: C,
    _ d: D,
    _ e: E,
    _ f: F,
    _ g: G)
  
  // ------------------------------------------------------------------------ //
  // MARK: with-Derivation - Simple
  // ------------------------------------------------------------------------ //
  
  func with(a: A) -> Self
  func with(b: B) -> Self
  func with(c: C) -> Self
  func with(d: D) -> Self
  func with(e: E) -> Self
  func with(f: F) -> Self
  func with(g: G) -> Self

  // ------------------------------------------------------------------------ //
  // MARK: with-Derivation - Preference
  // ------------------------------------------------------------------------ //
  
  static var withDerivationShouldEnsureUniqueCopyByDefault: Bool { get }

  // ------------------------------------------------------------------------ //
  // MARK: with-Derivation - Complete
  // ------------------------------------------------------------------------ //
  
  func with(
    a: A,
    ensureUniqueCopy: Bool) -> Self
  
  func with(
    b: B,
    ensureUniqueCopy: Bool) -> Self
  
  func with(
    c: C,
    ensureUniqueCopy: Bool) -> Self
  
  func with(
    d: D,
    ensureUniqueCopy: Bool) -> Self
  
  func with(
    e: E,
    ensureUniqueCopy: Bool) -> Self
  
  func with(
    f: F,
    ensureUniqueCopy: Bool) -> Self
  
  func with(
    g: G,
    ensureUniqueCopy: Bool) -> Self

}

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct7 - To-Tuple
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct7 {
  
  /// Shorthand for the tuple equivalent-to `Self`.
  typealias EquivalentTuple = (A,B,C,D,E,F,G)

  /// Returns a tuple equivalent-to `self`.
  @inlinable
  var equivalentTupleValue: EquivalentTuple {
    get {
      return (
        self.a,
        self.b,
        self.c,
        self.d,
        self.e,
        self.f,
        self.g
      )
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct7 - AlgebraicProduct Defaults
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct7 {
  
  @inlinable
  static var arity: Int {
    get {
      return 7
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct7 - Validatable
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct7 {
  
  @inlinable
  var isValid: Bool {
    get {
      guard
        isValidOrIndifferent(self.a),
        isValidOrIndifferent(self.b),
        isValidOrIndifferent(self.c),
        isValidOrIndifferent(self.d),
        isValidOrIndifferent(self.e),
        isValidOrIndifferent(self.f),
        isValidOrIndifferent(self.g) else {
          return false
      }
      return true
    }
  }
  
}
