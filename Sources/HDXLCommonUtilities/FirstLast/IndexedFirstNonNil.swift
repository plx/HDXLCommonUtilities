//
//  IndexedFirstNonNil.swift
//

import Foundation

/// Lazily-evaluates its arguments left-to-right, returning the first non-nil value and its zero-based index, if any).
///
/// - note: Exists *only* because it can make certain scenarios more-readable than having equivalent logic inlined directly into the call site.
///
@inlinable
public func indexedFirstNonNil<T>(
  _ a: @autoclosure () -> T?,
  _ b: @autoclosure () -> T?) -> (Int,T)? {
  if let a = a() {
    return (0,a)
  } else if let b = b() {
    return (1,b)
  } else {
    return nil
  }
}

/// Lazily-evaluates its arguments left-to-right, returning the first non-nil value and its zero-based index, if any).
///
/// - note: Exists *only* because it can make certain scenarios more-readable than having equivalent logic inlined directly into the call site.
///
@inlinable
public func indexedFirstNonNil<T>(
  _ a: @autoclosure () -> T?,
  _ b: @autoclosure () -> T?,
  _ c: @autoclosure () -> T?) -> (Int,T)? {
  if let a = a() {
    return (0,a)
  } else if let b = b() {
    return (1,b)
  } else if let c = c() {
    return (2,c)
  } else {
    return nil
  }
}

/// Lazily-evaluates its arguments left-to-right, returning the first non-nil value and its zero-based index, if any).
///
/// - note: Exists *only* because it can make certain scenarios more-readable than having equivalent logic inlined directly into the call site.
///
@inlinable
public func indexedFirstNonNil<T>(
  _ a: @autoclosure () -> T?,
  _ b: @autoclosure () -> T?,
  _ c: @autoclosure () -> T?,
  _ d: @autoclosure () -> T?) -> (Int,T)? {
  if let a = a() {
    return (0,a)
  } else if let b = b() {
    return (1,b)
  } else if let c = c() {
    return (2,c)
  } else if let d = d() {
    return (3,d)
  } else {
    return nil
  }
}

/// Lazily-evaluates its arguments left-to-right, returning the first non-nil value and its zero-based index, if any).
///
/// - note: Exists *only* because it can make certain scenarios more-readable than having equivalent logic inlined directly into the call site.
///
@inlinable
public func indexedFirstNonNil<T>(
  _ a: @autoclosure () -> T?,
  _ b: @autoclosure () -> T?,
  _ c: @autoclosure () -> T?,
  _ d: @autoclosure () -> T?,
  _ e: @autoclosure () -> T?) -> (Int,T)? {
  if let a = a() {
    return (0,a)
  } else if let b = b() {
    return (1,b)
  } else if let c = c() {
    return (2,c)
  } else if let d = d() {
    return (3,d)
  } else if let e = e() {
    return (4,e)
  } else {
    return nil
  }
}

/// Lazily-evaluates its arguments left-to-right, returning the first non-nil value and its zero-based index, if any).
///
/// - note: Exists *only* because it can make certain scenarios more-readable than having equivalent logic inlined directly into the call site.
///
@inlinable
public func indexedFirstNonNil<T>(
  _ a: @autoclosure () -> T?,
  _ b: @autoclosure () -> T?,
  _ c: @autoclosure () -> T?,
  _ d: @autoclosure () -> T?,
  _ e: @autoclosure () -> T?,
  _ f: @autoclosure () -> T?) -> (Int,T)? {
  if let a = a() {
    return (0,a)
  } else if let b = b() {
    return (1,b)
  } else if let c = c() {
    return (2,c)
  } else if let d = d() {
    return (3,d)
  } else if let e = e() {
    return (4,e)
  } else if let f = f() {
    return (5,f)
  } else {
    return nil
  }
}

/// Lazily-evaluates its arguments left-to-right, returning the first non-nil value and its zero-based index, if any).
///
/// - note: Exists *only* because it can make certain scenarios more-readable than having equivalent logic inlined directly into the call site.
///
@inlinable
public func indexedFirstNonNil<T>(
  _ a: @autoclosure () -> T?,
  _ b: @autoclosure () -> T?,
  _ c: @autoclosure () -> T?,
  _ d: @autoclosure () -> T?,
  _ e: @autoclosure () -> T?,
  _ f: @autoclosure () -> T?,
  _ g: @autoclosure () -> T?) -> (Int,T)? {
  if let a = a() {
    return (0,a)
  } else if let b = b() {
    return (1,b)
  } else if let c = c() {
    return (2,c)
  } else if let d = d() {
    return (3,d)
  } else if let e = e() {
    return (4,e)
  } else if let f = f() {
    return (5,f)
  } else if let g = g() {
    return (6,g)
  } else {
    return nil
  }
}

/// Lazily-evaluates its arguments left-to-right, returning the first non-nil value and its zero-based index, if any).
///
/// - note: Exists *only* because it can make certain scenarios more-readable than having equivalent logic inlined directly into the call site.
///
@inlinable
public func indexedFirstNonNil<T>(
  _ a: @autoclosure () -> T?,
  _ b: @autoclosure () -> T?,
  _ c: @autoclosure () -> T?,
  _ d: @autoclosure () -> T?,
  _ e: @autoclosure () -> T?,
  _ f: @autoclosure () -> T?,
  _ g: @autoclosure () -> T?,
  _ h: @autoclosure () -> T?) -> (Int,T)? {
  if let a = a() {
    return (0,a)
  } else if let b = b() {
    return (1,b)
  } else if let c = c() {
    return (2,c)
  } else if let d = d() {
    return (3,d)
  } else if let e = e() {
    return (4,e)
  } else if let f = f() {
    return (5,f)
  } else if let g = g() {
    return (6,g)
  } else if let h = h() {
    return (7,h)
  } else {
    return nil
  }
}

/// Lazily-evaluates its arguments left-to-right, returning the first non-nil value and its zero-based index, if any).
///
/// - note: Exists *only* because it can make certain scenarios more-readable than having equivalent logic inlined directly into the call site.
///
@inlinable
public func indexedFirstNonNil<T>(
  _ a: @autoclosure () -> T?,
  _ b: @autoclosure () -> T?,
  _ c: @autoclosure () -> T?,
  _ d: @autoclosure () -> T?,
  _ e: @autoclosure () -> T?,
  _ f: @autoclosure () -> T?,
  _ g: @autoclosure () -> T?,
  _ h: @autoclosure () -> T?,
  _ i: @autoclosure () -> T?) -> (Int,T)? {
  if let a = a() {
    return (0,a)
  } else if let b = b() {
    return (1,b)
  } else if let c = c() {
    return (2,c)
  } else if let d = d() {
    return (3,d)
  } else if let e = e() {
    return (4,e)
  } else if let f = f() {
    return (5,f)
  } else if let g = g() {
    return (6,g)
  } else if let h = h() {
    return (7,h)
  } else if let i = i() {
    return (8,i)
  } else {
    return nil
  }
}
