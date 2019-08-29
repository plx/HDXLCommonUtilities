//
//  UniformEquality.swift
//

import Foundation

/// Lazily-evaluates its arguments from left-to-right, checking for equality
/// after each evaluation (e.g. a == b, a == c, a == d, ...); bails-out if it
/// finds a non-equal pair--returning `false`--and otherwise returns `true`.
///
/// - note: Exists to condense the syntax in certain cases; not widely-useful.
@inlinable
public func allArgumentsMutuallyEqual<T:Equatable>(
  _ a: @autoclosure () -> T,
  _ b: @autoclosure () -> T) -> Bool {
  return a() == b()
}

/// Lazily-evaluates its arguments from left-to-right, checking for equality
/// after each evaluation (e.g. a == b, a == c, a == d, ...); bails-out if it
/// finds a non-equal pair--returning `false`--and otherwise returns `true`.
///
/// - note: Exists to condense the syntax in certain cases; not widely-useful.
@inlinable
public func allArgumentsMutuallyEqual<T:Equatable>(
  _ a: @autoclosure () -> T,
  _ b: @autoclosure () -> T,
  _ c: @autoclosure () -> T) -> Bool {
  let aa = a()
  guard
    aa == b(),
    aa == c() else {
    return false
  }
  return true
}

/// Lazily-evaluates its arguments from left-to-right, checking for equality
/// after each evaluation (e.g. a == b, a == c, a == d, ...); bails-out if it
/// finds a non-equal pair--returning `false`--and otherwise returns `true`.
///
/// - note: Exists to condense the syntax in certain cases; not widely-useful.
@inlinable
public func allArgumentsMutuallyEqual<T:Equatable>(
  _ a: @autoclosure () -> T,
  _ b: @autoclosure () -> T,
  _ c: @autoclosure () -> T,
  _ d: @autoclosure () -> T) -> Bool {
  let aa = a()
  guard
    aa == b(),
    aa == c(),
    aa == d() else {
    return false
  }
  return true
}

/// Lazily-evaluates its arguments from left-to-right, checking for equality
/// after each evaluation (e.g. a == b, a == c, a == d, ...); bails-out if it
/// finds a non-equal pair--returning `false`--and otherwise returns `true`.
///
/// - note: Exists to condense the syntax in certain cases; not widely-useful.
@inlinable
public func allArgumentsMutuallyEqual<T:Equatable>(
  _ a: @autoclosure () -> T,
  _ b: @autoclosure () -> T,
  _ c: @autoclosure () -> T,
  _ d: @autoclosure () -> T,
  _ e: @autoclosure () -> T) -> Bool {
  let aa = a()
  guard
    aa == b(),
    aa == c(),
    aa == d(),
    aa == e() else {
    return false
  }
  return true
}

/// Lazily-evaluates its arguments from left-to-right, checking for equality
/// after each evaluation (e.g. a == b, a == c, a == d, ...); bails-out if it
/// finds a non-equal pair--returning `false`--and otherwise returns `true`.
///
/// - note: Exists to condense the syntax in certain cases; not widely-useful.
@inlinable
public func allArgumentsMutuallyEqual<T:Equatable>(
  _ a: @autoclosure () -> T,
  _ b: @autoclosure () -> T,
  _ c: @autoclosure () -> T,
  _ d: @autoclosure () -> T,
  _ e: @autoclosure () -> T,
  _ f: @autoclosure () -> T) -> Bool {
  let aa = a()
  guard
    aa == b(),
    aa == c(),
    aa == d(),
    aa == e(),
    aa == f() else {
    return false
  }
  return true
}

/// Lazily-evaluates its arguments from left-to-right, checking for equality
/// after each evaluation (e.g. a == b, a == c, a == d, ...); bails-out if it
/// finds a non-equal pair--returning `false`--and otherwise returns `true`.
///
/// - note: Exists to condense the syntax in certain cases; not widely-useful.
@inlinable
public func allArgumentsMutuallyEqual<T:Equatable>(
  _ a: @autoclosure () -> T,
  _ b: @autoclosure () -> T,
  _ c: @autoclosure () -> T,
  _ d: @autoclosure () -> T,
  _ e: @autoclosure () -> T,
  _ f: @autoclosure () -> T,
  _ g: @autoclosure () -> T) -> Bool {
  let aa = a()
  guard
    aa == b(),
    aa == c(),
    aa == d(),
    aa == e(),
    aa == f(),
    aa == g() else {
    return false
  }
  return true
}

/// Lazily-evaluates its arguments from left-to-right, checking for equality
/// after each evaluation (e.g. a == b, a == c, a == d, ...); bails-out if it
/// finds a non-equal pair--returning `false`--and otherwise returns `true`.
///
/// - note: Exists to condense the syntax in certain cases; not widely-useful.
@inlinable
public func allArgumentsMutuallyEqual<T:Equatable>(
  _ a: @autoclosure () -> T,
  _ b: @autoclosure () -> T,
  _ c: @autoclosure () -> T,
  _ d: @autoclosure () -> T,
  _ e: @autoclosure () -> T,
  _ f: @autoclosure () -> T,
  _ g: @autoclosure () -> T,
  _ h: @autoclosure () -> T) -> Bool {
  let aa = a()
  guard
    aa == b(),
    aa == c(),
    aa == d(),
    aa == e(),
    aa == f(),
    aa == g(),
    aa == h() else {
    return false
  }
  return true
}

/// Lazily-evaluates its arguments from left-to-right, checking for equality
/// after each evaluation (e.g. a == b, a == c, a == d, ...); bails-out if it
/// finds a non-equal pair--returning `false`--and otherwise returns `true`.
///
/// - note: Exists to condense the syntax in certain cases; not widely-useful.
@inlinable
public func allArgumentsMutuallyEqual<T:Equatable>(
  _ a: @autoclosure () -> T,
  _ b: @autoclosure () -> T,
  _ c: @autoclosure () -> T,
  _ d: @autoclosure () -> T,
  _ e: @autoclosure () -> T,
  _ f: @autoclosure () -> T,
  _ g: @autoclosure () -> T,
  _ h: @autoclosure () -> T,
  _ i: @autoclosure () -> T) -> Bool {
  let aa = a()
  guard
    aa == b(),
    aa == c(),
    aa == d(),
    aa == e(),
    aa == f(),
    aa == g(),
    aa == h(),
    aa == i() else {
    return false
  }
  return true
}
