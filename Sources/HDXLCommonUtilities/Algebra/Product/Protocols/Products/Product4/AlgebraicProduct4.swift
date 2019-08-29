//
//  AlgebraicProduct4.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct4 - Definition
// -------------------------------------------------------------------------- //

public protocol AlgebraicProduct4 : AlgebraicProduct
  where
  ArityPosition == Arity4Position {
  
  // ------------------------------------------------------------------------ //
  // MARK: Component Types
  // ------------------------------------------------------------------------ //
  
  associatedtype A
  associatedtype B
  associatedtype C
  associatedtype D

  // ------------------------------------------------------------------------ //
  // MARK: Related Types
  // ------------------------------------------------------------------------ //
  
  /// Shorthand for the same-arity sum type.
  ///
  /// It'd be accurate to call this an "algebraic dual", but I find this name
  /// easier to follow (even if dual is arguably more-proper, here).
  typealias AssociatedSum = Sum4<A,B,C,D>

  // ------------------------------------------------------------------------ //
  // MARK: Component Properties
  // ------------------------------------------------------------------------ //

  var a: A { get set }
  var b: B { get set }
  var c: C { get set }
  var d: D { get set }

  // ------------------------------------------------------------------------ //
  // MARK: Initialization
  // ------------------------------------------------------------------------ //
  
  init(
    _ a: A,
    _ b: B,
    _ c: C,
    _ d: D)
  
  // ------------------------------------------------------------------------ //
  // MARK: with-Derivation - Simple
  // ------------------------------------------------------------------------ //
  
  func with(a: A) -> Self
  func with(b: B) -> Self
  func with(c: C) -> Self
  func with(d: D) -> Self

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

}

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct4 - AlgebraicProduct Defaults
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct4 {
  
  @inlinable
  static var arity: Int {
    get {
      return 4
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct4 - Validatable
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct4 {
  
  @inlinable
  var isValid: Bool {
    get {
      guard
        isValidOrIndifferent(self.a),
        isValidOrIndifferent(self.b),
        isValidOrIndifferent(self.c),
        isValidOrIndifferent(self.d) else {
          return false
      }
      return true
    }
  }
  
}
