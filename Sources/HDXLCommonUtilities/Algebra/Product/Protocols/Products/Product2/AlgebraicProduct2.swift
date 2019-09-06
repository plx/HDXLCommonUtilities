//
//  AlgebraicProduct2.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct2 - Definition
// -------------------------------------------------------------------------- //

public protocol AlgebraicProduct2 : AlgebraicProduct
  where
  ArityPosition == Arity2Position {
  
  // ------------------------------------------------------------------------ //
  // MARK: Component Types
  // ------------------------------------------------------------------------ //
  
  associatedtype A
  associatedtype B

  // ------------------------------------------------------------------------ //
  // MARK: Related Types
  // ------------------------------------------------------------------------ //
  
  /// Shorthand for the same-arity sum type.
  ///
  /// It'd be accurate to call this an "algebraic dual", but I find this name
  /// easier to follow (even if dual is arguably more-proper, here).
  typealias AssociatedSum = Sum2<A,B>

  // ------------------------------------------------------------------------ //
  // MARK: Component Properties
  // ------------------------------------------------------------------------ //

  var a: A { get set }
  var b: B { get set }

  // ------------------------------------------------------------------------ //
  // MARK: Initialization
  // ------------------------------------------------------------------------ //
  
  init(
    _ a: A,
    _ b: B)
  
  // ------------------------------------------------------------------------ //
  // MARK: with-Derivation - Simple
  // ------------------------------------------------------------------------ //
  
  func with(a: A) -> Self
  func with(b: B) -> Self

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

}

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct2 - AlgebraicProduct Defaults
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct2 {
  
  /// Shorthand for the tuple equivalent-to `Self`.
  typealias EquivalentTuple = (A,B)
  
  /// Returns a tuple equivalent-to `self`.
  @inlinable
  var equivalentTupleValue: EquivalentTuple {
    get {
      return (
        self.a,
        self.b
      )
    }
  }
  
}


// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct2 - AlgebraicProduct Defaults
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct2 {
  
  @inlinable
  static var arity: Int {
    get {
      return 2
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct2 - Validatable
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct2 {
  
  @inlinable
  var isValid: Bool {
    get {
      guard
        isValidOrIndifferent(self.a),
        isValidOrIndifferent(self.b) else {
          return false
      }
      return true
    }
  }
  
}
