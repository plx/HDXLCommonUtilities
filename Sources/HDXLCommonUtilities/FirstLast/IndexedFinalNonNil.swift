//
//  IndexedFinalNonNil.swift
//

import Foundation

/// Lazily-evaluates its arguments right-to-left, returning the first non-nil value and its zero-based index (if any).
///
/// - note: Exists *only* because it can make certain scenarios more-readable than having equivalent logic inlined directly into the call site.
///
@inlinable
public func indexedFinalNonNil<T>(
  _ a: @autoclosure () -> T?,
  _ b: @autoclosure () -> T?) -> (Int,T)? {
  guard
    let (index,value) = indexedFirstNonNil(
      b(),
      a()) else {
        return nil
  }
  return (1 - index, value)
}

/// Lazily-evaluates its arguments right-to-left, returning the first non-nil value and its zero-based index (if any).
///
/// - note: Exists *only* because it can make certain scenarios more-readable than having equivalent logic inlined directly into the call site.
///
@inlinable
public func indexedFinalNonNil<T>(
  _ a: @autoclosure () -> T?,
  _ b: @autoclosure () -> T?,
  _ c: @autoclosure () -> T?) -> (Int,T)? {
  guard
    let (index,value) = indexedFirstNonNil(
      c(),
      b(),
      a()) else {
        return nil
  }
  return (2 - index, value)
}

/// Lazily-evaluates its arguments right-to-left, returning the first non-nil value and its zero-based index (if any).
///
/// - note: Exists *only* because it can make certain scenarios more-readable than having equivalent logic inlined directly into the call site.
///
@inlinable
public func indexedFinalNonNil<T>(
  _ a: @autoclosure () -> T?,
  _ b: @autoclosure () -> T?,
  _ c: @autoclosure () -> T?,
  _ d: @autoclosure () -> T?) -> (Int,T)? {
  guard
    let (index,value) = indexedFirstNonNil(
      d(),
      c(),
      b(),
      a()) else {
        return nil
  }
  return (3 - index, value)
}

/// Lazily-evaluates its arguments right-to-left, returning the first non-nil value and its zero-based index (if any).
///
/// - note: Exists *only* because it can make certain scenarios more-readable than having equivalent logic inlined directly into the call site.
///
@inlinable
public func indexedFinalNonNil<T>(
  _ a: @autoclosure () -> T?,
  _ b: @autoclosure () -> T?,
  _ c: @autoclosure () -> T?,
  _ d: @autoclosure () -> T?,
  _ e: @autoclosure () -> T?) -> (Int,T)? {
  guard
    let (index,value) = indexedFirstNonNil(
      e(),
      d(),
      c(),
      b(),
      a()) else {
        return nil
  }
  return (4 - index, value)
}

/// Lazily-evaluates its arguments right-to-left, returning the first non-nil value and its zero-based index (if any).
///
/// - note: Exists *only* because it can make certain scenarios more-readable than having equivalent logic inlined directly into the call site.
///
@inlinable
public func indexedFinalNonNil<T>(
  _ a: @autoclosure () -> T?,
  _ b: @autoclosure () -> T?,
  _ c: @autoclosure () -> T?,
  _ d: @autoclosure () -> T?,
  _ e: @autoclosure () -> T?,
  _ f: @autoclosure () -> T?) -> (Int,T)? {
  guard
    let (index,value) = indexedFirstNonNil(
      f(),
      e(),
      d(),
      c(),
      b(),
      a()) else {
        return nil
  }
  return (5 - index, value)
}

/// Lazily-evaluates its arguments right-to-left, returning the first non-nil value and its zero-based index (if any).
///
/// - note: Exists *only* because it can make certain scenarios more-readable than having equivalent logic inlined directly into the call site.
///
@inlinable
public func indexedFinalNonNil<T>(
  _ a: @autoclosure () -> T?,
  _ b: @autoclosure () -> T?,
  _ c: @autoclosure () -> T?,
  _ d: @autoclosure () -> T?,
  _ e: @autoclosure () -> T?,
  _ f: @autoclosure () -> T?,
  _ g: @autoclosure () -> T?) -> (Int,T)? {
  guard
    let (index,value) = indexedFirstNonNil(
      g(),
      f(),
      e(),
      d(),
      c(),
      b(),
      a()) else {
        return nil
  }
  return (6 - index, value)
}

/// Lazily-evaluates its arguments right-to-left, returning the first non-nil value and its zero-based index (if any).
///
/// - note: Exists *only* because it can make certain scenarios more-readable than having equivalent logic inlined directly into the call site.
///
@inlinable
public func indexedFinalNonNil<T>(
  _ a: @autoclosure () -> T?,
  _ b: @autoclosure () -> T?,
  _ c: @autoclosure () -> T?,
  _ d: @autoclosure () -> T?,
  _ e: @autoclosure () -> T?,
  _ f: @autoclosure () -> T?,
  _ g: @autoclosure () -> T?,
  _ h: @autoclosure () -> T?) -> (Int,T)? {
  guard
    let (index,value) = indexedFirstNonNil(
      h(),
      g(),
      f(),
      e(),
      d(),
      c(),
      b(),
      a()) else {
        return nil
  }
  return (7 - index, value)
}

/// Lazily-evaluates its arguments right-to-left, returning the first non-nil value and its zero-based index (if any).
///
/// - note: Exists *only* because it can make certain scenarios more-readable than having equivalent logic inlined directly into the call site.
///
@inlinable
public func indexedFinalNonNil<T>(
  _ a: @autoclosure () -> T?,
  _ b: @autoclosure () -> T?,
  _ c: @autoclosure () -> T?,
  _ d: @autoclosure () -> T?,
  _ e: @autoclosure () -> T?,
  _ f: @autoclosure () -> T?,
  _ g: @autoclosure () -> T?,
  _ h: @autoclosure () -> T?,
  _ i: @autoclosure () -> T?) -> (Int,T)? {
  guard
    let (index,value) = indexedFirstNonNil(
      i(),
      h(),
      g(),
      f(),
      e(),
      d(),
      c(),
      b(),
      a()) else {
        return nil
  }
  return (8 - index, value)
}
