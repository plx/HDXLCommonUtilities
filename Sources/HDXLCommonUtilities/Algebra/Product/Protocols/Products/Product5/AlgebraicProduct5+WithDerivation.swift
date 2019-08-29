//
//  AlgebraicProduct5+WithDerivation.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct5 - `with` Derivation - Simple
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct5 {
  
  @inlinable
  func with(a: A) -> Self {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(isValidOrIndifferent(a))
    // /////////////////////////////////////////////////////////////////////////
    return self.with(
      a: a,
      ensureUniqueCopy: Self.withDerivationShouldEnsureUniqueCopyByDefault
    )
  }

  @inlinable
  func with(b: B) -> Self {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(isValidOrIndifferent(b))
    // /////////////////////////////////////////////////////////////////////////
    return self.with(
      b: b,
      ensureUniqueCopy: Self.withDerivationShouldEnsureUniqueCopyByDefault
    )
  }

  @inlinable
  func with(c: C) -> Self {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(isValidOrIndifferent(c))
    // /////////////////////////////////////////////////////////////////////////
    return self.with(
      c: c,
      ensureUniqueCopy: Self.withDerivationShouldEnsureUniqueCopyByDefault
    )
  }

  @inlinable
  func with(d: D) -> Self {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(isValidOrIndifferent(d))
    // /////////////////////////////////////////////////////////////////////////
    return self.with(
      d: d,
      ensureUniqueCopy: Self.withDerivationShouldEnsureUniqueCopyByDefault
    )
  }

  @inlinable
  func with(e: E) -> Self {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(isValidOrIndifferent(e))
    // /////////////////////////////////////////////////////////////////////////
    return self.with(
      e: e,
      ensureUniqueCopy: Self.withDerivationShouldEnsureUniqueCopyByDefault
    )
  }

}

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct5 - `with` Derivation - Complete - Baseline
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct5 {
  
  @inlinable
  func with(
    a: A,
    ensureUniqueCopy: Bool) -> Self {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(isValidOrIndifferent(a))
    // /////////////////////////////////////////////////////////////////////////
    return Self(
      a,
      self.b,
      self.c,
      self.d,
      self.e
    )
  }

  @inlinable
  func with(
    b: B,
    ensureUniqueCopy: Bool) -> Self {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(isValidOrIndifferent(b))
    // /////////////////////////////////////////////////////////////////////////
    return Self(
      self.a,
      b,
      self.c,
      self.d,
      self.e
    )
  }

  @inlinable
  func with(
    c: C,
    ensureUniqueCopy: Bool) -> Self {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(isValidOrIndifferent(c))
    // /////////////////////////////////////////////////////////////////////////
    return Self(
      self.a,
      self.b,
      c,
      self.d,
      self.e
    )
  }

  @inlinable
  func with(
    d: D,
    ensureUniqueCopy: Bool) -> Self {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(isValidOrIndifferent(d))
    // /////////////////////////////////////////////////////////////////////////
    return Self(
      self.a,
      self.b,
      self.c,
      d,
      self.e
    )
  }

  @inlinable
  func with(
    e: E,
    ensureUniqueCopy: Bool) -> Self {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(isValidOrIndifferent(e))
    // /////////////////////////////////////////////////////////////////////////
    return Self(
      self.a,
      self.b,
      self.c,
      self.d,
      e
    )
  }

}

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct5 - `with` Derivation - Equatable-A
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct5 where A:Equatable {

  @inlinable
  func with(
    a: A,
    ensureUniqueCopy: Bool) -> Self {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(isValidOrIndifferent(a))
    // /////////////////////////////////////////////////////////////////////////
    guard ensureUniqueCopy || a != self.a else {
      return self
    }
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(ensureUniqueCopy || a != self.a)
    // /////////////////////////////////////////////////////////////////////////
    return Self(
      a,
      self.b,
      self.c,
      self.d,
      self.e
    )
  }

}

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct5 - `with` Derivation - Equatable-B
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct5 where B:Equatable {

  @inlinable
  func with(
    b: B,
    ensureUniqueCopy: Bool) -> Self {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(isValidOrIndifferent(b))
    // /////////////////////////////////////////////////////////////////////////
    guard ensureUniqueCopy || b != self.b else {
      return self
    }
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(ensureUniqueCopy || b != self.b)
    // /////////////////////////////////////////////////////////////////////////
    return Self(
      self.a,
      b,
      self.c,
      self.d,
      self.e
    )
  }

}

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct5 - `with` Derivation - Equatable-C
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct5 where C:Equatable {

  @inlinable
  func with(
    c: C,
    ensureUniqueCopy: Bool) -> Self {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(isValidOrIndifferent(c))
    // /////////////////////////////////////////////////////////////////////////
    guard ensureUniqueCopy || c != self.c else {
      return self
    }
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(ensureUniqueCopy || c != self.c)
    // /////////////////////////////////////////////////////////////////////////
    return Self(
      self.a,
      self.b,
      c,
      self.d,
      self.e
    )
  }

}

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct5 - `with` Derivation - Equatable-D
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct5 where D:Equatable {

  @inlinable
  func with(
    d: D,
    ensureUniqueCopy: Bool) -> Self {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(isValidOrIndifferent(d))
    // /////////////////////////////////////////////////////////////////////////
    guard ensureUniqueCopy || d != self.d else {
      return self
    }
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(ensureUniqueCopy || d != self.d)
    // /////////////////////////////////////////////////////////////////////////
    return Self(
      self.a,
      self.b,
      self.c,
      d,
      self.e
    )
  }

}

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct5 - `with` Derivation - Equatable-E
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct5 where E:Equatable {

  @inlinable
  func with(
    e: E,
    ensureUniqueCopy: Bool) -> Self {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(isValidOrIndifferent(e))
    // /////////////////////////////////////////////////////////////////////////
    guard ensureUniqueCopy || e != self.e else {
      return self
    }
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(ensureUniqueCopy || e != self.e)
    // /////////////////////////////////////////////////////////////////////////
    return Self(
      self.a,
      self.b,
      self.c,
      self.d,
      e
    )
  }

}

