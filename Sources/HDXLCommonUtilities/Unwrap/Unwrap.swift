//
//  Unwrap.swift
//

import Foundation

/// Unwraps all-or-none of its arguments.
///
/// - parameter a: The first possibly-nil value.
/// - parameter b: The second possibly-nil value.
///
/// - returns: A tuple with *all* of the unwrapped values, or `nil` if any unwrap fails.
///
/// - note: Generally just use `guard` with multiple-clauses, but occasionally `unwrap` is more-readable.
/// - note: Arguments are lazily-evaluated from left to right: `a` first, `b` next, and so on.
///
@inlinable
public func unwrap<
  A,
  B>(
  _ a: @autoclosure () -> A?,
  _ b: @autoclosure () -> B?) -> (A,B)? {
  guard
    let a = a(),
    let b = b() else {
      return nil
  }
  return (a,b)
}

/// Unwraps all-or-none of its arguments.
///
/// - parameter a: The first possibly-nil value.
/// - parameter b: The second possibly-nil value.
/// - parameter c: The third possibly-nil value.
///
/// - returns: A tuple with *all* of the unwrapped values, or `nil` if any unwrap fails.
///
/// - note: Generally just use `guard` with multiple-clauses, but occasionally `unwrap` is more-readable.
/// - note: Arguments are lazily-evaluated from left to right: `a` first, `b` next, and so on.
///
@inlinable
public func unwrap<
  A,
  B,
  C>(
  _ a: @autoclosure () -> A?,
  _ b: @autoclosure () -> B?,
  _ c: @autoclosure () -> C?) -> (A,B,C)? {
  guard
    let a = a(),
    let b = b(),
    let c = c() else {
      return nil
  }
  return (a,b,c)
}

/// Unwraps all-or-none of its arguments.
///
/// - parameter a: The first possibly-nil value.
/// - parameter b: The second possibly-nil value.
/// - parameter c: The third possibly-nil value.
/// - parameter d: The fourth possibly-nil value.
///
/// - returns: A tuple with *all* of the unwrapped values, or `nil` if any unwrap fails.
///
/// - note: Generally just use `guard` with multiple-clauses, but occasionally `unwrap` is more-readable.
/// - note: Arguments are lazily-evaluated from left to right: `a` first, `b` next, and so on.
///
@inlinable
public func unwrap<
  A,
  B,
  C,
  D>(
  _ a: @autoclosure () -> A?,
  _ b: @autoclosure () -> B?,
  _ c: @autoclosure () -> C?,
  _ d: @autoclosure () -> D?) -> (A,B,C,D)? {
  guard
    let a = a(),
    let b = b(),
    let c = c(),
    let d = d() else {
      return nil
  }
  return (a,b,c,d)
}

/// Unwraps all-or-none of its arguments.
///
/// - parameter a: The first possibly-nil value.
/// - parameter b: The second possibly-nil value.
/// - parameter c: The third possibly-nil value.
/// - parameter d: The fourth possibly-nil value.
/// - parameter e: The fifth possibly-nil value.
///
/// - returns: A tuple with *all* of the unwrapped values, or `nil` if any unwrap fails.
///
/// - note: Generally just use `guard` with multiple-clauses, but occasionally `unwrap` is more-readable.
/// - note: Arguments are lazily-evaluated from left to right: `a` first, `b` next, and so on.
///
@inlinable
public func unwrap<
  A,
  B,
  C,
  D,
  E>(
  _ a: @autoclosure () -> A?,
  _ b: @autoclosure () -> B?,
  _ c: @autoclosure () -> C?,
  _ d: @autoclosure () -> D?,
  _ e: @autoclosure () -> E?) -> (A,B,C,D,E)? {
  guard
    let a = a(),
    let b = b(),
    let c = c(),
    let d = d(),
    let e = e() else {
      return nil
  }
  return (a,b,c,d,e)
}

/// Unwraps all-or-none of its arguments.
///
/// - parameter a: The first possibly-nil value.
/// - parameter b: The second possibly-nil value.
/// - parameter c: The third possibly-nil value.
/// - parameter d: The fourth possibly-nil value.
/// - parameter e: The fifth possibly-nil value.
/// - parameter f: The six possibly-nil value.
///
/// - returns: A tuple with *all* of the unwrapped values, or `nil` if any unwrap fails.
///
/// - note: Generally just use `guard` with multiple-clauses, but occasionally `unwrap` is more-readable.
/// - note: Arguments are lazily-evaluated from left to right: `a` first, `b` next, and so on.
///
@inlinable
public func unwrap<
  A,
  B,
  C,
  D,
  E,
  F>(
  _ a: @autoclosure () -> A?,
  _ b: @autoclosure () -> B?,
  _ c: @autoclosure () -> C?,
  _ d: @autoclosure () -> D?,
  _ e: @autoclosure () -> E?,
  _ f: @autoclosure () -> F?) -> (A,B,C,D,E,F)? {
  guard
    let a = a(),
    let b = b(),
    let c = c(),
    let d = d(),
    let e = e(),
    let f = f() else {
      return nil
  }
  return (a,b,c,d,e,f)
}

/// Unwraps all-or-none of its arguments.
///
/// - parameter a: The first possibly-nil value.
/// - parameter b: The second possibly-nil value.
/// - parameter c: The third possibly-nil value.
/// - parameter d: The fourth possibly-nil value.
/// - parameter e: The fifth possibly-nil value.
/// - parameter f: The six possibly-nil value.
/// - parameter g: The seventh possibly-nil value.
///
/// - returns: A tuple with *all* of the unwrapped values, or `nil` if any unwrap fails.
///
/// - note: Generally just use `guard` with multiple-clauses, but occasionally `unwrap` is more-readable.
/// - note: Arguments are lazily-evaluated from left to right: `a` first, `b` next, and so on.
///
@inlinable
public func unwrap<
  A,
  B,
  C,
  D,
  E,
  F,
  G>(
  _ a: @autoclosure () -> A?,
  _ b: @autoclosure () -> B?,
  _ c: @autoclosure () -> C?,
  _ d: @autoclosure () -> D?,
  _ e: @autoclosure () -> E?,
  _ f: @autoclosure () -> F?,
  _ g: @autoclosure () -> G?) -> (A,B,C,D,E,F,G)? {
  guard
    let a = a(),
    let b = b(),
    let c = c(),
    let d = d(),
    let e = e(),
    let f = f(),
    let g = g() else {
      return nil
  }
  return (a,b,c,d,e,f,g)
}

/// Unwraps all-or-none of its arguments.
///
/// - parameter a: The first possibly-nil value.
/// - parameter b: The second possibly-nil value.
/// - parameter c: The third possibly-nil value.
/// - parameter d: The fourth possibly-nil value.
/// - parameter e: The fifth possibly-nil value.
/// - parameter f: The six possibly-nil value.
/// - parameter g: The seventh possibly-nil value.
/// - parameter h: The eighth possibly-nil value.
///
/// - returns: A tuple with *all* of the unwrapped values, or `nil` if any unwrap fails.
///
/// - note: Generally just use `guard` with multiple-clauses, but occasionally `unwrap` is more-readable.
/// - note: Arguments are lazily-evaluated from left to right: `a` first, `b` next, and so on.
///
@inlinable
public func unwrap<
  A,
  B,
  C,
  D,
  E,
  F,
  G,
  H>(
  _ a: @autoclosure () -> A?,
  _ b: @autoclosure () -> B?,
  _ c: @autoclosure () -> C?,
  _ d: @autoclosure () -> D?,
  _ e: @autoclosure () -> E?,
  _ f: @autoclosure () -> F?,
  _ g: @autoclosure () -> G?,
  _ h: @autoclosure () -> H?) -> (A,B,C,D,E,F,G,H)? {
  guard
    let a = a(),
    let b = b(),
    let c = c(),
    let d = d(),
    let e = e(),
    let f = f(),
    let g = g(),
    let h = h() else {
      return nil
  }
  return (a,b,c,d,e,f,g,h)
}

/// Unwraps all-or-none of its arguments.
///
/// - parameter a: The first possibly-nil value.
/// - parameter b: The second possibly-nil value.
/// - parameter c: The third possibly-nil value.
/// - parameter d: The fourth possibly-nil value.
/// - parameter e: The fifth possibly-nil value.
/// - parameter f: The six possibly-nil value.
/// - parameter g: The seventh possibly-nil value.
/// - parameter h: The eighth possibly-nil value.
/// - parameter i: The ninth possibly-nil value.
///
/// - returns: A tuple with *all* of the unwrapped values, or `nil` if any unwrap fails.
///
/// - note: Generally just use `guard` with multiple-clauses, but occasionally `unwrap` is more-readable.
/// - note: Arguments are lazily-evaluated from left to right: `a` first, `b` next, and so on.
///
@inlinable
public func unwrap<
  A,
  B,
  C,
  D,
  E,
  F,
  G,
  H,
  I>(
  _ a: @autoclosure () -> A?,
  _ b: @autoclosure () -> B?,
  _ c: @autoclosure () -> C?,
  _ d: @autoclosure () -> D?,
  _ e: @autoclosure () -> E?,
  _ f: @autoclosure () -> F?,
  _ g: @autoclosure () -> G?,
  _ h: @autoclosure () -> H?,
  _ i: @autoclosure () -> I?) -> (A,B,C,D,E,F,G,H,I)? {
  guard
    let a = a(),
    let b = b(),
    let c = c(),
    let d = d(),
    let e = e(),
    let f = f(),
    let g = g(),
    let h = h(),
    let i = i() else {
    return nil
  }
  return (a,b,c,d,e,f,g,h,i)
}

