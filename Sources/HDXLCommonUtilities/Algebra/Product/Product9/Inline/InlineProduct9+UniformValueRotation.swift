//
//  InlineProduct9+UniformValueRotation.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: InlineProduct9 - UniformValueRotation
// -------------------------------------------------------------------------- //

public extension InlineProduct9
  where
  A == B,
  A == C,
  A == D,
  A == E,
  A == F,
  A == G,
  A == H,
A == I {
  
  // ------------------------------------------------------------------------ //
  // MARK: Pushes
  // ------------------------------------------------------------------------ //
  
  /// Inserts `value` at `i`, and shifts pushes existing values leftward (`a <= b`, `b <= c`, etc.).
  @inlinable
  func pushedLeftward(byAppending value: A) -> UniformInlineProduct9<A> {
    return UniformInlineProduct9<A>(
      self.b,
      self.c,
      self.d,
      self.e,
      self.f,
      self.g,
      self.h,
      self.i,
      value
    )
  }
  
  /// Inserts `value` at `a`, and shifts pushes existing values rightward (`a => b`, `b => c`, etc.).
  @inlinable
  func pushedRightward(byPrepending value: A) -> UniformInlineProduct9<A> {
    return UniformInlineProduct9<A>(
      value,
      self.a,
      self.b,
      self.c,
      self.d,
      self.e,
      self.f,
      self.g,
      self.h
    )
  }
  
  // ------------------------------------------------------------------------ //
  // MARK: Weak Pushes
  // ------------------------------------------------------------------------ //
  
  /// Inserts non-`nil` `value` at `i`, and shifts pushes existing values leftward (`a <= b`, `b <= c`, etc.).
  /// When `value` is `nil` the result is just `nil`.
  @inlinable
  func weaklyPushedLeftward(byAppending value: A?) -> UniformInlineProduct9<A>? {
    guard let concreteValue = value else {
      return nil
    }
    return self.pushedLeftward(byAppending: concreteValue)
  }
  
  /// Inserts non-`nil` `value` at `a`, and shifts pushes existing values rightward (`a => b`, `b => c`, etc.).
  /// When `value` is `nil` the result is just `nil`.
  @inlinable
  func weaklyPushedRightward(byPrepending value: A?) -> UniformInlineProduct9<A>? {
    guard let concreteValue = value else {
      return nil
    }
    return self.pushedRightward(byPrepending: concreteValue)
  }
  
  // ------------------------------------------------------------------------ //
  // MARK: In-Place Pushes
  // ------------------------------------------------------------------------ //
  
  /// In-place inserts `value` at `i` and shifts remaining values leftward (`a <= b`, `b <= c`, etc.).
  @inlinable
  mutating func formLeftwardPush(byAppending value: A) {
    self.a = self.b
    self.b = self.c
    self.c = self.d
    self.d = self.e
    self.e = self.f
    self.g = self.h
    self.h = self.i
    self.i = value
  }
  
  /// In-place inserts `value` at `a` and shifts remaining values rightward (`a => b`, `b => c`, etc.).
  @inlinable
  mutating func formRightwardPush(byPrepending value: A) {
    self.i = self.h
    self.h = self.g
    self.g = self.f
    self.f = self.e
    self.e = self.d
    self.d = self.c
    self.c = self.b
    self.b = self.a
    self.a = value
  }
  
  // ------------------------------------------------------------------------ //
  // MARK: In-Place Weak Pushes
  // ------------------------------------------------------------------------ //
  
  /// In-place inserts `value` at `i` and shifts remaining values leftward (`a <= b`, `b <= c`, etc.).
  /// No-ops and returns `false` when `value` is `nil`.
  @inlinable
  mutating func formWeakLeftwardPush(byAppending value: A?) -> Bool {
    guard let concreteValue = value else {
      return false
    }
    self.formLeftwardPush(byAppending: concreteValue)
    return true
  }
  
  /// In-place inserts non-`nil `value` at `a` and shifts remaining values rightward (`a => b`, `b => c`, etc.).
  /// No-ops and returns `false` when `value` is `nil`.
  @inlinable
  mutating func formWeakRightwardPush(byPrepending value: A?) -> Bool {
    guard let concreteValue = value else {
      return false
    }
    self.formRightwardPush(byPrepending: concreteValue)
    return true
  }
  
}
