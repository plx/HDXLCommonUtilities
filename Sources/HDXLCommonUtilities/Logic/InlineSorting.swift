//
//  InlineSorting.swift
//

import Foundation

/// Given `Comparable` arguments `(a,b)`, returns a tuple with the values ordered
/// s.t. the lesser value is first and the greater value is second.
///
/// - note: Behavior when `a == b` is unspecified and shouldn't be relied-upon.
///
@inlinable
public func naturalAscendingArrangement<T:Comparable>(_ a: T, _ b: T) -> (T,T) {
  switch a <=> b {
  case .orderedAscending:
    return (a,b)
  case .orderedSame:
    return (a,b)
  case .orderedDescending:
    return (b,a)
  }
}

/// Given `Comparable` arguments `(a,b)`, returns a tuple with the values ordered
/// s.t. the greater value is first and the lesser value is second.
///
/// - note: Behavior when `a == b` is unspecified and shouldn't be relied-upon.
///
@inlinable
public func naturalDescendingArrangement<T:Comparable>(_ a: T, _ b: T) -> (T,T) {
  switch a <=> b {
  case .orderedAscending:
    return (b,a)
  case .orderedSame:
    return (a,b)
  case .orderedDescending:
    return (a,b)
  }
}

/// Given two arguments `(a,b)` and a `projection` to some `Comparable` type,
/// returns a tuple s.t. the argument with the lesser projection is first and
/// the argument with the greater projection is second.
///
/// - note: Behavior when `projection(a) == projection(b)` is unspecified and shouldn't be relied-upon.
///
@inlinable
public func projectedAscendingArrangement<T,K:Comparable>(_ a: T, _ b: T, using projection: (T) -> K) -> (T,T) {
  switch projection(a) <=> projection(b) {
  case .orderedAscending:
    return (a,b)
  case .orderedSame:
    return (a,b)
  case .orderedDescending:
    return (b,a)
  }
}

/// Given two arguments `(a,b)` and a `projection` to some `Comparable` type,
/// returns a tuple s.t. the argument with the greater projection is first and
/// the argument with the lesser projection is second.
///
/// - note: Behavior when `projection(a) == projection(b)` is unspecified and shouldn't be relied-upon.
///
@inlinable
public func projectedDescendingArrangement<T,K:Comparable>(_ a: T, _ b: T, using projection: (T) -> K) -> (T,T) {
  switch projection(a) <=> projection(b) {
  case .orderedAscending:
    return (b,a)
  case .orderedSame:
    return (a,b)
  case .orderedDescending:
    return (a,b)
  }
}

/// Given two arguments `(a,b)` and a `comparator` sending `(T,T)` to a `ComparisonResult`,
/// returns a tuple s.t. the arguments arranged ascendingly as-per `comparator`.
///
/// - note: Behavior when `comparator` is unspecified and shouldn't be relied-upon (and: shouldn't matter!).
///
@inlinable
public func customizedAscendingArrangement<T>(_ a: T, _ b: T, using comparator: (T,T) -> ComparisonResult) -> (T,T) {
  switch comparator(a,b) {
  case .orderedAscending:
    return (a,b)
  case .orderedSame:
    return (a,b)
  case .orderedDescending:
    return (b,a)
  }
}

/// Given three arguments `(a,b,c)` and a `comparator` sending `(T,T)` to a `ComparisonResult`,
/// returns a tuple s.t. the arguments arranged ascendingly as-per `comparator`.
///
/// - note: Behavior when `comparator` is unspecified and shouldn't be relied-upon (and: shouldn't matter!).
///
@inlinable
public func customizedAscendingArrangement<T>(_ a: T, _ b: T, _ c: T, using comparator: (T,T) -> ComparisonResult) -> (T,T,T) {
  return merge(
    value: c,
    into: customizedAscendingArrangement(
      a,
      b,
      using: comparator
    ),
    using: comparator
  )
}

/// Given two arguments `(a,b)` and a `comparator` sending `(T,T)` to a `ComparisonResult`,
/// returns a tuple s.t. the arguments arranged descendingly as-per `comparator`.
///
/// - note: Behavior when `comparator` is unspecified and shouldn't be relied-upon (and: shouldn't matter!).
///
@inlinable
public func customizedDescendingArrangement<T>(_ a: T, _ b: T, using comparator: (T,T) -> ComparisonResult) -> (T,T) {
  switch comparator(a,b) {
  case .orderedAscending:
    return (b,a)
  case .orderedSame:
    return (a,b)
  case .orderedDescending:
    return (a,b)
  }
}
