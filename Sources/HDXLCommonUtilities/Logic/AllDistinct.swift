//
//  AllDistinct.swift
//

import Foundation

/// Returns `true` iff all arguments are distinct (e.g. for any pair `x`, `y`
/// of arguments, `x == y` iff `x` and `y` correspond to the same argument).
@inlinable
public func allArgumentsDistinct<T:Equatable>(
  _ a: @autoclosure () -> T,
  _ b: @autoclosure () -> T) -> Bool {
  let aa = a()
  let bb = b()
  guard aa != bb else {
    return false
  }
  return true
}

/// Returns `true` iff all arguments are distinct (e.g. for any pair `x`, `y`
/// of arguments, `x == y` iff `x` and `y` correspond to the same argument).
@inlinable
public func allArgumentsDistinct<T:Equatable>(
  _ a: @autoclosure () -> T,
  _ b: @autoclosure () -> T,
  _ c: @autoclosure () -> T) -> Bool {
  let aa = a()
  let bb = b()
  guard aa != bb else {
    return false
  }
  let cc = c()
  guard
    aa != cc,
    bb != cc else {
      return false
  }
  return true
}

/// Returns `true` iff all arguments are distinct (e.g. for any pair `x`, `y`
/// of arguments, `x == y` iff `x` and `y` correspond to the same argument).
@inlinable
public func allArgumentsDistinct<T:Equatable>(
  _ a: @autoclosure () -> T,
  _ b: @autoclosure () -> T,
  _ c: @autoclosure () -> T,
  _ d: @autoclosure () -> T) -> Bool {
  let aa = a()
  let bb = b()
  guard aa != bb else {
    return false
  }
  let cc = c()
  guard
    aa != cc,
    bb != cc else {
      return false
  }
  let dd = d()
  guard
    aa != dd,
    bb != dd,
    cc != dd else {
      return false
  }
  return true
}

/// Returns `true` iff all arguments are distinct (e.g. for any pair `x`, `y`
/// of arguments, `x == y` iff `x` and `y` correspond to the same argument).
@inlinable
public func allArgumentsDistinct<T:Equatable>(
  _ a: @autoclosure () -> T,
  _ b: @autoclosure () -> T,
  _ c: @autoclosure () -> T,
  _ d: @autoclosure () -> T,
  _ e: @autoclosure () -> T) -> Bool {
  let aa = a()
  let bb = b()
  guard aa != bb else {
    return false
  }
  let cc = c()
  guard
    aa != cc,
    bb != cc else {
      return false
  }
  let dd = d()
  guard
    aa != dd,
    bb != dd,
    cc != dd else {
      return false
  }
  let ee = e()
  guard
    aa != ee,
    bb != ee,
    cc != ee,
    dd != ee else {
      return false
  }
  return true
}

/// Returns `true` iff all arguments are distinct (e.g. for any pair `x`, `y`
/// of arguments, `x == y` iff `x` and `y` correspond to the same argument).
@inlinable
public func allArgumentsDistinct<T:Equatable>(
  _ a: @autoclosure () -> T,
  _ b: @autoclosure () -> T,
  _ c: @autoclosure () -> T,
  _ d: @autoclosure () -> T,
  _ e: @autoclosure () -> T,
  _ f: @autoclosure () -> T) -> Bool {
  let aa = a()
  let bb = b()
  guard aa != bb else {
    return false
  }
  let cc = c()
  guard
    aa != cc,
    bb != cc else {
      return false
  }
  let dd = d()
  guard
    aa != dd,
    bb != dd,
    cc != dd else {
      return false
  }
  let ee = e()
  guard
    aa != ee,
    bb != ee,
    cc != ee,
    dd != ee else {
      return false
  }
  let ff = f()
  guard
    aa != ff,
    bb != ff,
    cc != ff,
    dd != ff,
    ee != ff else {
      return false
  }
  return true
}

/// Returns `true` iff all arguments are distinct (e.g. for any pair `x`, `y`
/// of arguments, `x == y` iff `x` and `y` correspond to the same argument).
@inlinable
public func allArgumentsDistinct<T:Equatable>(
  _ a: @autoclosure () -> T,
  _ b: @autoclosure () -> T,
  _ c: @autoclosure () -> T,
  _ d: @autoclosure () -> T,
  _ e: @autoclosure () -> T,
  _ f: @autoclosure () -> T,
  _ g: @autoclosure () -> T) -> Bool {
  let aa = a()
  let bb = b()
  guard aa != bb else {
    return false
  }
  let cc = c()
  guard
    aa != cc,
    bb != cc else {
      return false
  }
  let dd = d()
  guard
    aa != dd,
    bb != dd,
    cc != dd else {
      return false
  }
  let ee = e()
  guard
    aa != ee,
    bb != ee,
    cc != ee,
    dd != ee else {
      return false
  }
  let ff = f()
  guard
    aa != ff,
    bb != ff,
    cc != ff,
    dd != ff,
    ee != ff else {
      return false
  }
  let gg = g()
  guard
    aa != gg,
    bb != gg,
    cc != gg,
    dd != gg,
    ee != gg,
    ff != gg else {
      return false
  }
  return true
}

/// Returns `true` iff all arguments are distinct (e.g. for any pair `x`, `y`
/// of arguments, `x == y` iff `x` and `y` correspond to the same argument).
@inlinable
public func allArgumentsDistinct<T:Equatable>(
  _ a: @autoclosure () -> T,
  _ b: @autoclosure () -> T,
  _ c: @autoclosure () -> T,
  _ d: @autoclosure () -> T,
  _ e: @autoclosure () -> T,
  _ f: @autoclosure () -> T,
  _ g: @autoclosure () -> T,
  _ h: @autoclosure () -> T) -> Bool {
  let aa = a()
  let bb = b()
  guard aa != bb else {
    return false
  }
  let cc = c()
  guard
    aa != cc,
    bb != cc else {
      return false
  }
  let dd = d()
  guard
    aa != dd,
    bb != dd,
    cc != dd else {
      return false
  }
  let ee = e()
  guard
    aa != ee,
    bb != ee,
    cc != ee,
    dd != ee else {
      return false
  }
  let ff = f()
  guard
    aa != ff,
    bb != ff,
    cc != ff,
    dd != ff,
    ee != ff else {
      return false
  }
  let gg = g()
  guard
    aa != gg,
    bb != gg,
    cc != gg,
    dd != gg,
    ee != gg,
    ff != gg else {
      return false
  }
  let hh = h()
  guard
    aa != hh,
    bb != hh,
    cc != hh,
    dd != hh,
    ee != hh,
    ff != hh,
    gg != hh else {
      return false
  }
  return true
}

/// Returns `true` iff all arguments are distinct (e.g. for any pair `x`, `y`
/// of arguments, `x == y` iff `x` and `y` correspond to the same argument).
@inlinable
public func allArgumentsDistinct<T:Equatable>(
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
  let bb = b()
  guard aa != bb else {
    return false
  }
  let cc = c()
  guard
    aa != cc,
    bb != cc else {
      return false
  }
  let dd = d()
  guard
    aa != dd,
    bb != dd,
    cc != dd else {
      return false
  }
  let ee = e()
  guard
    aa != ee,
    bb != ee,
    cc != ee,
    dd != ee else {
      return false
  }
  let ff = f()
  guard
    aa != ff,
    bb != ff,
    cc != ff,
    dd != ff,
    ee != ff else {
      return false
  }
  let gg = g()
  guard
    aa != gg,
    bb != gg,
    cc != gg,
    dd != gg,
    ee != gg,
    ff != gg else {
      return false
  }
  let hh = h()
  guard
    aa != hh,
    bb != hh,
    cc != hh,
    dd != hh,
    ee != hh,
    ff != hh,
    gg != hh else {
      return false
  }
  let ii = i()
  guard
    aa != ii,
    bb != ii,
    cc != ii,
    dd != ii,
    ee != ii,
    ff != ii,
    gg != ii,
    hh != ii else {
      return false
  }
  return true
}
