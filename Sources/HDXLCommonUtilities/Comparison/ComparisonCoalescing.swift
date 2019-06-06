//
//  Coalescing.swift
//  

import Foundation

// -------------------------------------------------------------------------- //
// MARK: ComparisonResult - Coalescing Sequences
// -------------------------------------------------------------------------- //

public extension ComparisonResult {

  /// Constructs a `ComparisonResult` by coalescing the comparison result from a sequence.
  ///
  /// - parameter comparisonResults: A sequence of comparison results to coalesce.
  ///
  /// - returns: The coalesced comparison result, e.g. first non-`.orderedSame` if any is encountered, and `.orderedSame` otherwise.
  ///
  /// - note: Halts at first non-`.orderedSame` found, thus may not fully-consume `S`.
  ///
  @inlinable
  init<S:Sequence>(coalescing comparisonResults: S) where S.Element == ComparisonResult {
    self = .orderedSame
    for candidate in comparisonResults {
      guard candidate == .orderedSame else {
        self = candidate
        break
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ComparisonResult - 2-Way Coalescing
// -------------------------------------------------------------------------- //

public extension ComparisonResult {
  
  /// Constructs a `ComparisonResult` by lazily-coalescing the supplied arguments.
  /// Intended as a primitive for implementing lexicographic comparison.
  ///
  /// - parameter a: The first comparison result to examine.
  /// - parameter b: The second comparison result to examine.
  ///
  /// - returns: The coalesced comparison result, e.g. first non-`.orderedSame` if any is encountered, and `.orderedSame` otherwise.
  ///
  /// - note: Would be nice to make this an `init` but the lack of named inits gets in the way.
  ///
  @inlinable
  static func coalescing(
    _ a: @autoclosure () -> ComparisonResult,
    _ b: @autoclosure () -> ComparisonResult) -> ComparisonResult {
    
    let a = a()
    guard a == .orderedSame else {
      return a
    }
    
    let b = b()
    guard b == .orderedSame else {
      return b
    }
    
    // preceding value could just be returned but this is easier for copy-and-paste.
    return .orderedSame
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ComparisonResult - 3-Way Coalescing
// -------------------------------------------------------------------------- //

public extension ComparisonResult {
  
  /// Constructs a `ComparisonResult` by lazily-coalescing the supplied arguments.
  /// Intended as a primitive for implementing lexicographic comparison.
  ///
  /// - parameter a: The first comparison result to examine.
  /// - parameter b: The second comparison result to examine.
  /// - parameter c: The third comparison result to examine.
  ///
  /// - returns: The coalesced comparison result, e.g. first non-`.orderedSame` if any is encountered, and `.orderedSame` otherwise.
  ///
  /// - note: Would be nice to make this an `init` but the lack of named inits gets in the way.
  ///
  @inlinable
  static func coalescing(
    _ a: @autoclosure () -> ComparisonResult,
    _ b: @autoclosure () -> ComparisonResult,
    _ c: @autoclosure () -> ComparisonResult) -> ComparisonResult {
    
    let a = a()
    guard a == .orderedSame else {
      return a
    }
    
    let b = b()
    guard b == .orderedSame else {
      return b
    }
    
    let c = c()
    guard c == .orderedSame else {
      return c
    }
    
    // preceding value could just be returned but this is easier for copy-and-paste.
    return .orderedSame
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ComparisonResult - 4-Way Coalescing
// -------------------------------------------------------------------------- //

public extension ComparisonResult {
  
  /// Constructs a `ComparisonResult` by lazily-coalescing the supplied arguments.
  /// Intended as a primitive for implementing lexicographic comparison.
  ///
  /// - parameter a: The first comparison result to examine.
  /// - parameter b: The second comparison result to examine.
  /// - parameter c: The third comparison result to examine.
  /// - parameter d: The fourth comparison result to examine.
  ///
  /// - returns: The coalesced comparison result, e.g. first non-`.orderedSame` if any is encountered, and `.orderedSame` otherwise.
  ///
  /// - note: Would be nice to make this an `init` but the lack of named inits gets in the way.
  ///
  @inlinable
  static func coalescing(
    _ a: @autoclosure () -> ComparisonResult,
    _ b: @autoclosure () -> ComparisonResult,
    _ c: @autoclosure () -> ComparisonResult,
    _ d: @autoclosure () -> ComparisonResult) -> ComparisonResult {
    
    let a = a()
    guard a == .orderedSame else {
      return a
    }
    
    let b = b()
    guard b == .orderedSame else {
      return b
    }
    
    let c = c()
    guard c == .orderedSame else {
      return c
    }
    
    let d = d()
    guard d == .orderedSame else {
      return d
    }
    
    // preceding value could just be returned but this is easier for copy-and-paste.
    return .orderedSame
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ComparisonResult - 5-Way Coalescing
// -------------------------------------------------------------------------- //

public extension ComparisonResult {
  
  /// Constructs a `ComparisonResult` by lazily-coalescing the supplied arguments.
  /// Intended as a primitive for implementing lexicographic comparison.
  ///
  /// - parameter a: The first comparison result to examine.
  /// - parameter b: The second comparison result to examine.
  /// - parameter c: The third comparison result to examine.
  /// - parameter d: The fourth comparison result to examine.
  /// - parameter e: The fifth comparison result to examine.
  ///
  /// - returns: The coalesced comparison result, e.g. first non-`.orderedSame` if any is encountered, and `.orderedSame` otherwise.
  ///
  /// - note: Would be nice to make this an `init` but the lack of named inits gets in the way.
  ///
  @inlinable
  static func coalescing(
    _ a: @autoclosure () -> ComparisonResult,
    _ b: @autoclosure () -> ComparisonResult,
    _ c: @autoclosure () -> ComparisonResult,
    _ d: @autoclosure () -> ComparisonResult,
    _ e: @autoclosure () -> ComparisonResult) -> ComparisonResult {
    
    let a = a()
    guard a == .orderedSame else {
      return a
    }
    
    let b = b()
    guard b == .orderedSame else {
      return b
    }
    
    let c = c()
    guard c == .orderedSame else {
      return c
    }
    
    let d = d()
    guard d == .orderedSame else {
      return d
    }
    
    let e = e()
    guard e == .orderedSame else {
      return e
    }
    
    // preceding value could just be returned but this is easier for copy-and-paste.
    return .orderedSame
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ComparisonResult - 6-Way Coalescing
// -------------------------------------------------------------------------- //

public extension ComparisonResult {
  
  /// Constructs a `ComparisonResult` by lazily-coalescing the supplied arguments.
  /// Intended as a primitive for implementing lexicographic comparison.
  ///
  /// - parameter a: The first comparison result to examine.
  /// - parameter b: The second comparison result to examine.
  /// - parameter c: The third comparison result to examine.
  /// - parameter d: The fourth comparison result to examine.
  /// - parameter e: The fifth comparison result to examine.
  /// - parameter f: The sixth comparison result to examine.
  ///
  /// - returns: The coalesced comparison result, e.g. first non-`.orderedSame` if any is encountered, and `.orderedSame` otherwise.
  ///
  /// - note: Would be nice to make this an `init` but the lack of named inits gets in the way.
  ///
  @inlinable
  static func coalescing(
    _ a: @autoclosure () -> ComparisonResult,
    _ b: @autoclosure () -> ComparisonResult,
    _ c: @autoclosure () -> ComparisonResult,
    _ d: @autoclosure () -> ComparisonResult,
    _ e: @autoclosure () -> ComparisonResult,
    _ f: @autoclosure () -> ComparisonResult) -> ComparisonResult {
    
    let a = a()
    guard a == .orderedSame else {
      return a
    }
    
    let b = b()
    guard b == .orderedSame else {
      return b
    }
    
    let c = c()
    guard c == .orderedSame else {
      return c
    }
    
    let d = d()
    guard d == .orderedSame else {
      return d
    }
    
    let e = e()
    guard e == .orderedSame else {
      return e
    }
    
    let f = f()
    guard f == .orderedSame else {
      return f
    }
    
    // preceding value could just be returned but this is easier for copy-and-paste.
    return .orderedSame
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ComparisonResult - 7-Way Coalescing
// -------------------------------------------------------------------------- //

public extension ComparisonResult {
  
  /// Constructs a `ComparisonResult` by lazily-coalescing the supplied arguments.
  /// Intended as a primitive for implementing lexicographic comparison.
  ///
  /// - parameter a: The first comparison result to examine.
  /// - parameter b: The second comparison result to examine.
  /// - parameter c: The third comparison result to examine.
  /// - parameter d: The fourth comparison result to examine.
  /// - parameter e: The fifth comparison result to examine.
  /// - parameter f: The sixth comparison result to examine.
  /// - parameter g: The seventh comparison result to examine.
  ///
  /// - returns: The coalesced comparison result, e.g. first non-`.orderedSame` if any is encountered, and `.orderedSame` otherwise.
  ///
  /// - note: Would be nice to make this an `init` but the lack of named inits gets in the way.
  ///
  @inlinable
  static func coalescing(
    _ a: @autoclosure () -> ComparisonResult,
    _ b: @autoclosure () -> ComparisonResult,
    _ c: @autoclosure () -> ComparisonResult,
    _ d: @autoclosure () -> ComparisonResult,
    _ e: @autoclosure () -> ComparisonResult,
    _ f: @autoclosure () -> ComparisonResult,
    _ g: @autoclosure () -> ComparisonResult) -> ComparisonResult {
    
    let a = a()
    guard a == .orderedSame else {
      return a
    }
    
    let b = b()
    guard b == .orderedSame else {
      return b
    }
    
    let c = c()
    guard c == .orderedSame else {
      return c
    }
    
    let d = d()
    guard d == .orderedSame else {
      return d
    }
    
    let e = e()
    guard e == .orderedSame else {
      return e
    }
    
    let f = f()
    guard f == .orderedSame else {
      return f
    }
    
    let g = g()
    guard g == .orderedSame else {
      return g
    }
    
    // preceding value could just be returned but this is easier for copy-and-paste.
    return .orderedSame
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ComparisonResult - 8-Way Coalescing
// -------------------------------------------------------------------------- //

public extension ComparisonResult {
  
  /// Constructs a `ComparisonResult` by lazily-coalescing the supplied arguments.
  /// Intended as a primitive for implementing lexicographic comparison.
  ///
  /// - parameter a: The first comparison result to examine.
  /// - parameter b: The second comparison result to examine.
  /// - parameter c: The third comparison result to examine.
  /// - parameter d: The fourth comparison result to examine.
  /// - parameter e: The fifth comparison result to examine.
  /// - parameter f: The sixth comparison result to examine.
  /// - parameter g: The seventh comparison result to examine.
  /// - parameter h: The eigth comparison result to examine.
  ///
  /// - returns: The coalesced comparison result, e.g. first non-`.orderedSame` if any is encountered, and `.orderedSame` otherwise.
  ///
  /// - note: Would be nice to make this an `init` but the lack of named inits gets in the way.
  ///
  @inlinable
  static func coalescing(
    _ a: @autoclosure () -> ComparisonResult,
    _ b: @autoclosure () -> ComparisonResult,
    _ c: @autoclosure () -> ComparisonResult,
    _ d: @autoclosure () -> ComparisonResult,
    _ e: @autoclosure () -> ComparisonResult,
    _ f: @autoclosure () -> ComparisonResult,
    _ g: @autoclosure () -> ComparisonResult,
    _ h: @autoclosure () -> ComparisonResult) -> ComparisonResult {
    
    let a = a()
    guard a == .orderedSame else {
      return a
    }
    
    let b = b()
    guard b == .orderedSame else {
      return b
    }
    
    let c = c()
    guard c == .orderedSame else {
      return c
    }
    
    let d = d()
    guard d == .orderedSame else {
      return d
    }
    
    let e = e()
    guard e == .orderedSame else {
      return e
    }
    
    let f = f()
    guard f == .orderedSame else {
      return f
    }
    
    let g = g()
    guard g == .orderedSame else {
      return g
    }
    
    let h = h()
    guard h == .orderedSame else {
      return h
    }
    
    // preceding value could just be returned but this is easier for copy-and-paste.
    return .orderedSame
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ComparisonResult - 9-Way Coalescing
// -------------------------------------------------------------------------- //

public extension ComparisonResult {

  /// Constructs a `ComparisonResult` by lazily-coalescing the supplied arguments.
  /// Intended as a primitive for implementing lexicographic comparison.
  ///
  /// - parameter a: The first comparison result to examine.
  /// - parameter b: The second comparison result to examine.
  /// - parameter c: The third comparison result to examine.
  /// - parameter d: The fourth comparison result to examine.
  /// - parameter e: The fifth comparison result to examine.
  /// - parameter f: The sixth comparison result to examine.
  /// - parameter g: The seventh comparison result to examine.
  /// - parameter h: The eigth comparison result to examine.
  /// - parameter i: The ninth comparison result to examine.
  ///
  /// - returns: The coalesced comparison result, e.g. first non-`.orderedSame` if any is encountered, and `.orderedSame` otherwise.
  ///
  /// - note: Would be nice to make this an `init` but the lack of named inits gets in the way.
  ///
  @inlinable
  static func coalescing(
    _ a: @autoclosure () -> ComparisonResult,
    _ b: @autoclosure () -> ComparisonResult,
    _ c: @autoclosure () -> ComparisonResult,
    _ d: @autoclosure () -> ComparisonResult,
    _ e: @autoclosure () -> ComparisonResult,
    _ f: @autoclosure () -> ComparisonResult,
    _ g: @autoclosure () -> ComparisonResult,
    _ h: @autoclosure () -> ComparisonResult,
    _ i: @autoclosure () -> ComparisonResult) -> ComparisonResult {
    
    let a = a()
    guard a == .orderedSame else {
      return a
    }
    
    let b = b()
    guard b == .orderedSame else {
      return b
    }
    
    let c = c()
    guard c == .orderedSame else {
      return c
    }
    
    let d = d()
    guard d == .orderedSame else {
      return d
    }
    
    let e = e()
    guard e == .orderedSame else {
      return e
    }
    
    let f = f()
    guard f == .orderedSame else {
      return f
    }
    
    let g = g()
    guard g == .orderedSame else {
      return g
    }
    
    let h = h()
    guard h == .orderedSame else {
      return h
    }
    
    let i = i()
    guard i == .orderedSame else {
      return i
    }
    
    // preceding value could just be returned but this is easier for copy-and-paste.
    return .orderedSame
  }
  
}
