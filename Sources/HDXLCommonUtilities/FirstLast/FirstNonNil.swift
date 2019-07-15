//
//  FirstNonNil.swift
//

import Foundation

/// Lazily-evaluates its arguments left-to-right, returning the first non-nil value (if any).
///
/// - note: Exists *only* because it can make certain scenarios more-readable than having equivalent logic inlined directly into the call site.
///
@inlinable
public func firstNonNil<T>(
  _ a: @autoclosure () -> T?,
  _ b: @autoclosure () -> T?) -> T? {
  if let a = a() {
    return a
  } else if let b = b() {
    return b
  } else {
    return nil
  }
}

/// Lazily-evaluates its arguments left-to-right, returning the first non-nil value (if any).
///
/// - note: Exists *only* because it can make certain scenarios more-readable than having equivalent logic inlined directly into the call site.
///
@inlinable
public func firstNonNil<T>(
  _ a: @autoclosure () -> T?,
  _ b: @autoclosure () -> T?,
  _ c: @autoclosure () -> T?) -> T? {
  if let a = a() {
    return a
  } else if let b = b() {
    return b
  } else if let c = c() {
    return c
  } else {
    return nil
  }
}

/// Lazily-evaluates its arguments left-to-right, returning the first non-nil value (if any).
///
/// - note: Exists *only* because it can make certain scenarios more-readable than having equivalent logic inlined directly into the call site.
///
@inlinable
public func firstNonNil<T>(
  _ a: @autoclosure () -> T?,
  _ b: @autoclosure () -> T?,
  _ c: @autoclosure () -> T?,
  _ d: @autoclosure () -> T?) -> T? {
  if let a = a() {
    return a
  } else if let b = b() {
    return b
  } else if let c = c() {
    return c
  } else if let d = d() {
    return d
  } else {
    return nil
  }
}

/// Lazily-evaluates its arguments left-to-right, returning the first non-nil value (if any).
///
/// - note: Exists *only* because it can make certain scenarios more-readable than having equivalent logic inlined directly into the call site.
///
@inlinable
public func firstNonNil<T>(
  _ a: @autoclosure () -> T?,
  _ b: @autoclosure () -> T?,
  _ c: @autoclosure () -> T?,
  _ d: @autoclosure () -> T?,
  _ e: @autoclosure () -> T?) -> T? {
  if let a = a() {
    return a
  } else if let b = b() {
    return b
  } else if let c = c() {
    return c
  } else if let d = d() {
    return d
  } else if let e = e() {
    return e
  } else {
    return nil
  }
}

/// Lazily-evaluates its arguments left-to-right, returning the first non-nil value (if any).
///
/// - note: Exists *only* because it can make certain scenarios more-readable than having equivalent logic inlined directly into the call site.
///
@inlinable
public func firstNonNil<T>(
  _ a: @autoclosure () -> T?,
  _ b: @autoclosure () -> T?,
  _ c: @autoclosure () -> T?,
  _ d: @autoclosure () -> T?,
  _ e: @autoclosure () -> T?,
  _ f: @autoclosure () -> T?) -> T? {
  if let a = a() {
    return a
  } else if let b = b() {
    return b
  } else if let c = c() {
    return c
  } else if let d = d() {
    return d
  } else if let e = e() {
    return e
  } else if let f = f() {
    return f
  } else {
    return nil
  }
}

/// Lazily-evaluates its arguments left-to-right, returning the first non-nil value (if any).
///
/// - note: Exists *only* because it can make certain scenarios more-readable than having equivalent logic inlined directly into the call site.
///
@inlinable
public func firstNonNil<T>(
  _ a: @autoclosure () -> T?,
  _ b: @autoclosure () -> T?,
  _ c: @autoclosure () -> T?,
  _ d: @autoclosure () -> T?,
  _ e: @autoclosure () -> T?,
  _ f: @autoclosure () -> T?,
  _ g: @autoclosure () -> T?) -> T? {
  if let a = a() {
    return a
  } else if let b = b() {
    return b
  } else if let c = c() {
    return c
  } else if let d = d() {
    return d
  } else if let e = e() {
    return e
  } else if let f = f() {
    return f
  } else if let g = g() {
    return g
  } else {
    return nil
  }
}

/// Lazily-evaluates its arguments left-to-right, returning the first non-nil value (if any).
///
/// - note: Exists *only* because it can make certain scenarios more-readable than having equivalent logic inlined directly into the call site.
///
@inlinable
public func firstNonNil<T>(
  _ a: @autoclosure () -> T?,
  _ b: @autoclosure () -> T?,
  _ c: @autoclosure () -> T?,
  _ d: @autoclosure () -> T?,
  _ e: @autoclosure () -> T?,
  _ f: @autoclosure () -> T?,
  _ g: @autoclosure () -> T?,
  _ h: @autoclosure () -> T?) -> T? {
  if let a = a() {
    return a
  } else if let b = b() {
    return b
  } else if let c = c() {
    return c
  } else if let d = d() {
    return d
  } else if let e = e() {
    return e
  } else if let f = f() {
    return f
  } else if let g = g() {
    return g
  } else if let h = h() {
    return h
  } else {
    return nil
  }
}

/// Lazily-evaluates its arguments left-to-right, returning the first non-nil value (if any).
///
/// - note: Exists *only* because it can make certain scenarios more-readable than having equivalent logic inlined directly into the call site.
///
@inlinable
public func firstNonNil<T>(
  _ a: @autoclosure () -> T?,
  _ b: @autoclosure () -> T?,
  _ c: @autoclosure () -> T?,
  _ d: @autoclosure () -> T?,
  _ e: @autoclosure () -> T?,
  _ f: @autoclosure () -> T?,
  _ g: @autoclosure () -> T?,
  _ h: @autoclosure () -> T?,
  _ i: @autoclosure () -> T?) -> T? {
  if let a = a() {
    return a
  } else if let b = b() {
    return b
  } else if let c = c() {
    return c
  } else if let d = d() {
    return d
  } else if let e = e() {
    return e
  } else if let f = f() {
    return f
  } else if let g = g() {
    return g
  } else if let h = h() {
    return h
  } else if let i = i() {
    return i
  } else {
    return nil
  }
}
