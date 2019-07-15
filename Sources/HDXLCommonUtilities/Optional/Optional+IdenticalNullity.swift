//
//  Optional+IdenticalNullity.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Optional - Identical Nullity
// -------------------------------------------------------------------------- //

public extension Optional {
  
  /// Returns `true` iff `self` and `other` are either both `nil` or both non-`nil`.
  @inlinable
  func hasIdenticalNullity<T>(to other: T?) -> Bool {
    return identicalNullity(self, other)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Identical Nullity - Functions
// -------------------------------------------------------------------------- //

/// Returns `true` iff all arguments are either identically-nil or identically non-nil.
/// "Mixed nullity"--some nil, some not-nil--results in false.
///
/// - note: This is for "all nil OR all not-nil", not just "all nil".
///
@inlinable
public func identicalNullity<A,B>(
  _ a: A?,
  _ b: B?) -> Bool {
  switch (a, b) {
  case (.none, .none):
    return true
  case (.some(_), .some(_)):
    return true
  default:
    return false
  }
}

/// Returns `true` iff all arguments are either identically-nil or identically non-nil.
/// "Mixed nullity"--some nil, some not-nil--results in false.
///
/// - note: This is for "all nil OR all not-nil", not just "all nil".
///
@inlinable
public func identicalNullity<A,B,C>(
  _ a: A?,
  _ b: B?,
  _ c: C?) -> Bool {
  switch (a, b, c) {
  case (.none, .none, .none):
    return true
  case (.some(_), .some(_), .some(_)):
    return true
  default:
    return false
  }
}

/// Returns `true` iff all arguments are either identically-nil or identically non-nil.
/// "Mixed nullity"--some nil, some not-nil--results in false.
///
/// - note: This is for "all nil OR all not-nil", not just "all nil".
///
@inlinable
public func identicalNullity<A,B,C,D>(
  _ a: A?,
  _ b: B?,
  _ c: C?,
  _ d: D?) -> Bool {
  switch (a, b, c, d) {
  case (.none, .none, .none, .none):
    return true
  case (.some(_), .some(_), .some(_), .some(_)):
    return true
  default:
    return false
  }
}

/// Returns `true` iff all arguments are either identically-nil or identically non-nil.
/// "Mixed nullity"--some nil, some not-nil--results in false.
///
/// - note: This is for "all nil OR all not-nil", not just "all nil".
///
@inlinable
public func identicalNullity<A,B,C,D,E>(
  _ a: A?,
  _ b: B?,
  _ c: C?,
  _ d: D?,
  _ e: E?) -> Bool {
  switch (a, b, c, d, e) {
  case (.none, .none, .none, .none, .none):
    return true
  case (.some(_), .some(_), .some(_), .some(_), .some(_)):
    return true
  default:
    return false
  }
}


/// Returns `true` iff all arguments are either identically-nil or identically non-nil.
/// "Mixed nullity"--some nil, some not-nil--results in false.
///
/// - note: This is for "all nil OR all not-nil", not just "all nil".
///
@inlinable
public func identicalNullity<A,B,C,D,E,F>(
  _ a: A?,
  _ b: B?,
  _ c: C?,
  _ d: D?,
  _ e: E?,
  _ f: F?) -> Bool {
  switch (a, b, c, d, e, f) {
  case (.none, .none, .none, .none, .none, .none):
    return true
  case (.some(_), .some(_), .some(_), .some(_), .some(_), .some(_)):
    return true
  default:
    return false
  }
}

/// Returns `true` iff all arguments are either identically-nil or identically non-nil.
/// "Mixed nullity"--some nil, some not-nil--results in false.
///
/// - note: This is for "all nil OR all not-nil", not just "all nil".
///
@inlinable
public func identicalNullity<A,B,C,D,E,F,G>(
  _ a: A?,
  _ b: B?,
  _ c: C?,
  _ d: D?,
  _ e: E?,
  _ f: F?,
  _ g: G?) -> Bool {
  switch (a, b, c, d, e, f, g) {
  case (.none, .none, .none, .none, .none, .none, .none):
    return true
  case (.some(_), .some(_), .some(_), .some(_), .some(_), .some(_), .some(_)):
    return true
  default:
    return false
  }
}


/// Returns `true` iff all arguments are either identically-nil or identically non-nil.
/// "Mixed nullity"--some nil, some not-nil--results in false.
///
/// - note: This is for "all nil OR all not-nil", not just "all nil".
///
@inlinable
public func identicalNullity<A,B,C,D,E,F,G,H>(
  _ a: A?,
  _ b: B?,
  _ c: C?,
  _ d: D?,
  _ e: E?,
  _ f: F?,
  _ g: G?,
  _ h: H?) -> Bool {
  switch (a, b, c, d, e, f, g, h) {
  case (.none, .none, .none, .none, .none, .none, .none, .none):
    return true
  case (.some(_), .some(_), .some(_), .some(_), .some(_), .some(_), .some(_), .some(_)):
    return true
  default:
    return false
  }
}


/// Returns `true` iff all arguments are either identically-nil or identically non-nil.
/// "Mixed nullity"--some nil, some not-nil--results in false.
///
/// - note: This is for "all nil OR all not-nil", not just "all nil".
///
@inlinable
public func identicalNullity<A,B,C,D,E,F,G,H,I>(
  _ a: A?,
  _ b: B?,
  _ c: C?,
  _ d: D?,
  _ e: E?,
  _ f: F?,
  _ g: G?,
  _ h: H?,
  _ i: I?) -> Bool {
  switch (a, b, c, d, e, f, g, h, i) {
  case (.none, .none, .none, .none, .none, .none, .none, .none, .none):
    return true
  case (.some(_), .some(_), .some(_), .some(_), .some(_), .some(_), .some(_), .some(_), .some(_)):
    return true
  default:
    return false
  }
}

