//
//  FinalNonNil.swift
//

import Foundation

/// Lazily-evaluates its arguments right-to-left, returning the first non-nil value (if any).
///
/// - note: Exists *only* because it can make certain scenarios more-readable than having equivalent logic inlined directly into the call site.
///
@inlinable
public func finalNonNil<T>(
  _ a: @autoclosure () -> T?,
  _ b: @autoclosure () -> T?) -> T? {
  return firstNonNil(
    b(),
    a()
  )
}

/// Lazily-evaluates its arguments right-to-left, returning the first non-nil value (if any).
///
/// - note: Exists *only* because it can make certain scenarios more-readable than having equivalent logic inlined directly into the call site.
///
@inlinable
public func finalNonNil<T>(
  _ a: @autoclosure () -> T?,
  _ b: @autoclosure () -> T?,
  _ c: @autoclosure () -> T?) -> T? {
  return firstNonNil(
    c(),
    b(),
    a()
  )
}

/// Lazily-evaluates its arguments right-to-left, returning the first non-nil value (if any).
///
/// - note: Exists *only* because it can make certain scenarios more-readable than having equivalent logic inlined directly into the call site.
///
@inlinable
public func finalNonNil<T>(
  _ a: @autoclosure () -> T?,
  _ b: @autoclosure () -> T?,
  _ c: @autoclosure () -> T?,
  _ d: @autoclosure () -> T?) -> T? {
  return firstNonNil(
    d(),
    c(),
    b(),
    a()
  )
}

/// Lazily-evaluates its arguments right-to-left, returning the first non-nil value (if any).
///
/// - note: Exists *only* because it can make certain scenarios more-readable than having equivalent logic inlined directly into the call site.
///
@inlinable
public func finalNonNil<T>(
  _ a: @autoclosure () -> T?,
  _ b: @autoclosure () -> T?,
  _ c: @autoclosure () -> T?,
  _ d: @autoclosure () -> T?,
  _ e: @autoclosure () -> T?) -> T? {
  return firstNonNil(
    e(),
    d(),
    c(),
    b(),
    a()
  )
}

/// Lazily-evaluates its arguments right-to-left, returning the first non-nil value (if any).
///
/// - note: Exists *only* because it can make certain scenarios more-readable than having equivalent logic inlined directly into the call site.
///
@inlinable
public func finalNonNil<T>(
  _ a: @autoclosure () -> T?,
  _ b: @autoclosure () -> T?,
  _ c: @autoclosure () -> T?,
  _ d: @autoclosure () -> T?,
  _ e: @autoclosure () -> T?,
  _ f: @autoclosure () -> T?) -> T? {
  return firstNonNil(
    f(),
    e(),
    d(),
    c(),
    b(),
    a()
  )
}

/// Lazily-evaluates its arguments right-to-left, returning the first non-nil value (if any).
///
/// - note: Exists *only* because it can make certain scenarios more-readable than having equivalent logic inlined directly into the call site.
///
@inlinable
public func finalNonNil<T>(
  _ a: @autoclosure () -> T?,
  _ b: @autoclosure () -> T?,
  _ c: @autoclosure () -> T?,
  _ d: @autoclosure () -> T?,
  _ e: @autoclosure () -> T?,
  _ f: @autoclosure () -> T?,
  _ g: @autoclosure () -> T?) -> T? {
  return firstNonNil(
    g(),
    f(),
    e(),
    d(),
    c(),
    b(),
    a()
  )
}

/// Lazily-evaluates its arguments right-to-left, returning the first non-nil value (if any).
///
/// - note: Exists *only* because it can make certain scenarios more-readable than having equivalent logic inlined directly into the call site.
///
@inlinable
public func finalNonNil<T>(
  _ a: @autoclosure () -> T?,
  _ b: @autoclosure () -> T?,
  _ c: @autoclosure () -> T?,
  _ d: @autoclosure () -> T?,
  _ e: @autoclosure () -> T?,
  _ f: @autoclosure () -> T?,
  _ g: @autoclosure () -> T?,
  _ h: @autoclosure () -> T?) -> T? {
  return firstNonNil(
    h(),
    g(),
    f(),
    e(),
    d(),
    c(),
    b(),
    a()
  )
}

/// Lazily-evaluates its arguments right-to-left, returning the first non-nil value (if any).
///
/// - note: Exists *only* because it can make certain scenarios more-readable than having equivalent logic inlined directly into the call site.
///
@inlinable
public func finalNonNil<T>(
  _ a: @autoclosure () -> T?,
  _ b: @autoclosure () -> T?,
  _ c: @autoclosure () -> T?,
  _ d: @autoclosure () -> T?,
  _ e: @autoclosure () -> T?,
  _ f: @autoclosure () -> T?,
  _ g: @autoclosure () -> T?,
  _ h: @autoclosure () -> T?,
  _ i: @autoclosure () -> T?) -> T? {
  return firstNonNil(
    i(),
    h(),
    g(),
    f(),
    e(),
    d(),
    c(),
    b(),
    a()
  )
}
