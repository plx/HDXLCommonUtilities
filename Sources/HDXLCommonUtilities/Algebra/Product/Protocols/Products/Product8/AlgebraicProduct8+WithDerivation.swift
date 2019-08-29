//
//  AlgebraicProduct8+WithDerivation.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct8 - `with` Derivation - Simple
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct8 {
  
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

  @inlinable
  func with(f: F) -> Self {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(isValidOrIndifferent(f))
    // /////////////////////////////////////////////////////////////////////////
    return self.with(
      f: f,
      ensureUniqueCopy: Self.withDerivationShouldEnsureUniqueCopyByDefault
    )
  }

  @inlinable
  func with(g: G) -> Self {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(isValidOrIndifferent(g))
    // /////////////////////////////////////////////////////////////////////////
    return self.with(
      g: g,
      ensureUniqueCopy: Self.withDerivationShouldEnsureUniqueCopyByDefault
    )
  }

  @inlinable
  func with(h: H) -> Self {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(isValidOrIndifferent(h))
    // /////////////////////////////////////////////////////////////////////////
    return self.with(
      h: h,
      ensureUniqueCopy: Self.withDerivationShouldEnsureUniqueCopyByDefault
    )
  }

}

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct8 - `with` Derivation - Complete - Baseline
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct8 {
  
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
      self.e,
      self.f,
      self.g,
      self.h
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
      self.e,
      self.f,
      self.g,
      self.h
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
      self.e,
      self.f,
      self.g,
      self.h
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
      self.e,
      self.f,
      self.g,
      self.h
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
      e,
      self.f,
      self.g,
      self.h
    )
  }

  @inlinable
  func with(
    f: F,
    ensureUniqueCopy: Bool) -> Self {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(isValidOrIndifferent(f))
    // /////////////////////////////////////////////////////////////////////////
    return Self(
      self.a,
      self.b,
      self.c,
      self.d,
      self.e,
      f,
      self.g,
      self.h
    )
  }

  @inlinable
  func with(
    g: G,
    ensureUniqueCopy: Bool) -> Self {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(isValidOrIndifferent(g))
    // /////////////////////////////////////////////////////////////////////////
    return Self(
      self.a,
      self.b,
      self.c,
      self.d,
      self.e,
      self.f,
      g,
      self.h
    )
  }

  @inlinable
  func with(
    h: H,
    ensureUniqueCopy: Bool) -> Self {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(isValidOrIndifferent(h))
    // /////////////////////////////////////////////////////////////////////////
    return Self(
      self.a,
      self.b,
      self.c,
      self.d,
      self.e,
      self.f,
      self.g,
      h
    )
  }

}

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct8 - `with` Derivation - Equatable-A
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct8 where A:Equatable {

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
      self.e,
      self.f,
      self.g,
      self.h
    )
  }

}

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct8 - `with` Derivation - Equatable-B
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct8 where B:Equatable {

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
      self.e,
      self.f,
      self.g,
      self.h
    )
  }

}

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct8 - `with` Derivation - Equatable-C
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct8 where C:Equatable {

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
      self.e,
      self.f,
      self.g,
      self.h
    )
  }

}

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct8 - `with` Derivation - Equatable-D
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct8 where D:Equatable {

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
      self.e,
      self.f,
      self.g,
      self.h
    )
  }

}

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct8 - `with` Derivation - Equatable-E
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct8 where E:Equatable {

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
      e,
      self.f,
      self.g,
      self.h
    )
  }

}

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct8 - `with` Derivation - Equatable-F
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct8 where F:Equatable {

  @inlinable
  func with(
    f: F,
    ensureUniqueCopy: Bool) -> Self {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(isValidOrIndifferent(f))
    // /////////////////////////////////////////////////////////////////////////
    guard ensureUniqueCopy || f != self.f else {
      return self
    }
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(ensureUniqueCopy || f != self.f)
    // /////////////////////////////////////////////////////////////////////////
    return Self(
      self.a,
      self.b,
      self.c,
      self.d,
      self.e,
      f,
      self.g,
      self.h
    )
  }

}

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct8 - `with` Derivation - Equatable-G
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct8 where G:Equatable {

  @inlinable
  func with(
    g: G,
    ensureUniqueCopy: Bool) -> Self {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(isValidOrIndifferent(g))
    // /////////////////////////////////////////////////////////////////////////
    guard ensureUniqueCopy || g != self.g else {
      return self
    }
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(ensureUniqueCopy || g != self.g)
    // /////////////////////////////////////////////////////////////////////////
    return Self(
      self.a,
      self.b,
      self.c,
      self.d,
      self.e,
      self.f,
      g,
      self.h
    )
  }

}

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct8 - `with` Derivation - Equatable-H
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct8 where H:Equatable {

  @inlinable
  func with(
    h: H,
    ensureUniqueCopy: Bool) -> Self {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(isValidOrIndifferent(h))
    // /////////////////////////////////////////////////////////////////////////
    guard ensureUniqueCopy || h != self.h else {
      return self
    }
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(ensureUniqueCopy || h != self.h)
    // /////////////////////////////////////////////////////////////////////////
    return Self(
      self.a,
      self.b,
      self.c,
      self.d,
      self.e,
      self.f,
      self.g,
      h
    )
  }

}

