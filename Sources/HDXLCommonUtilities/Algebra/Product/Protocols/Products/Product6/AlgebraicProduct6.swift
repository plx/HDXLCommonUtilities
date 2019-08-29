//
//  AlgebraicProduct6.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct6 - Definition
// -------------------------------------------------------------------------- //

public protocol AlgebraicProduct6 : AlgebraicProduct
  where
  ArityPosition == Arity6Position {
  
  // ------------------------------------------------------------------------ //
  // MARK: Component Types
  // ------------------------------------------------------------------------ //
  
  associatedtype A
  associatedtype B
  associatedtype C
  associatedtype D
  associatedtype E
  associatedtype F

  // ------------------------------------------------------------------------ //
  // MARK: Related Types
  // ------------------------------------------------------------------------ //
  
  /// Shorthand for the same-arity sum type.
  ///
  /// It'd be accurate to call this an "algebraic dual", but I find this name
  /// easier to follow (even if dual is arguably more-proper, here).
  typealias AssociatedSum = Sum6<A,B,C,D,E,F>

  // ------------------------------------------------------------------------ //
  // MARK: Component Properties
  // ------------------------------------------------------------------------ //

  var a: A { get set }
  var b: B { get set }
  var c: C { get set }
  var d: D { get set }
  var e: E { get set }
  var f: F { get set }

  // ------------------------------------------------------------------------ //
  // MARK: Initialization
  // ------------------------------------------------------------------------ //
  
  init(
    _ a: A,
    _ b: B,
    _ c: C,
    _ d: D,
    _ e: E,
    _ f: F)
  
  // ------------------------------------------------------------------------ //
  // MARK: with-Derivation - Simple
  // ------------------------------------------------------------------------ //
  
  func with(a: A) -> Self
  func with(b: B) -> Self
  func with(c: C) -> Self
  func with(d: D) -> Self
  func with(e: E) -> Self
  func with(f: F) -> Self

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
  
}

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct6 - AlgebraicProduct Defaults
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct6 {
  
  @inlinable
  static var arity: Int {
    get {
      return 6
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct6 - Validatable
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct6 {
  
  @inlinable
  var isValid: Bool {
    get {
      guard
        isValidOrIndifferent(self.a),
        isValidOrIndifferent(self.b),
        isValidOrIndifferent(self.c),
        isValidOrIndifferent(self.d),
        isValidOrIndifferent(self.e),
        isValidOrIndifferent(self.f) else {
          return false
      }
      return true
    }
  }
  
}
