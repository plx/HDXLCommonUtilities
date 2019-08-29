//
//  InlineProduct8+SwiftConditionalConformances.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: InlineProduct8 - Equatable
// -------------------------------------------------------------------------- //

extension InlineProduct8 : Equatable
  where
  A:Equatable,
  B:Equatable,
  C:Equatable,
  D:Equatable,
  E:Equatable,
  F:Equatable,
  G:Equatable,
  H:Equatable {
    
}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct8 - Comparable
// -------------------------------------------------------------------------- //

extension InlineProduct8 : Comparable
  where
  A:Comparable,
  B:Comparable,
  C:Comparable,
  D:Comparable,
  E:Comparable,
  F:Comparable,
  G:Comparable,
  H:Comparable {
  
}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct8 - Hashable
// -------------------------------------------------------------------------- //

extension InlineProduct8 : Hashable
  where
  A:Hashable,
  B:Hashable,
  C:Hashable,
  D:Hashable,
  E:Hashable,
  F:Hashable,
  G:Hashable,
  H:Hashable {
  
}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct8 - Codable
// -------------------------------------------------------------------------- //

extension InlineProduct8 : Codable
  where
  A:Codable,
  B:Codable,
  C:Codable,
  D:Codable,
  E:Codable,
  F:Codable,
  G:Codable,
  H:Codable {
  
  public typealias CodingKeys = Arity8ProductCodingKeys
  
  @inlinable
  public func encode(to encoder: Encoder) throws {
    var values = encoder.container(keyedBy: CodingKeys.self)
    try values.encode(
      self.a,
      forKey: .a
    )
    try values.encode(
      self.b,
      forKey: .b
    )
    try values.encode(
      self.c,
      forKey: .c
    )
    try values.encode(
      self.d,
      forKey: .d
    )
    try values.encode(
      self.e,
      forKey: .e
    )
    try values.encode(
      self.f,
      forKey: .f
    )
    try values.encode(
      self.g,
      forKey: .g
    )
    try values.encode(
      self.h,
      forKey: .h
    )
  }
  
  @inlinable
  public init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    let a = try values.decode(
      A.self,
      forKey: .a
    )
    let b = try values.decode(
      B.self,
      forKey: .b
    )
    let c = try values.decode(
      C.self,
      forKey: .c
    )
    let d = try values.decode(
      D.self,
      forKey: .d
    )
    let e = try values.decode(
      E.self,
      forKey: .e
    )
    let f = try values.decode(
      F.self,
      forKey: .f
    )
    let g = try values.decode(
      G.self,
      forKey: .g
    )
    let h = try values.decode(
      H.self,
      forKey: .h
    )
    self.init(
      a,
      b,
      c,
      d,
      e,
      f,
      g,
      h
    )
  }

}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct8 - CaseIterable
// -------------------------------------------------------------------------- //

extension InlineProduct8 : CaseIterable
  where
  A:CaseIterable,
  B:CaseIterable,
  C:CaseIterable,
  D:CaseIterable,
  E:CaseIterable,
  F:CaseIterable,
  G:CaseIterable,
  H:CaseIterable {
  
  public typealias AllCases = Product8Collection<
    A.AllCases,
    B.AllCases,
    C.AllCases,
    D.AllCases,
    E.AllCases,
    F.AllCases,
    G.AllCases,
    H.AllCases,
    InlineProduct8<
      A.AllCases.Index,
      B.AllCases.Index,
      C.AllCases.Index,
      D.AllCases.Index,
      E.AllCases.Index,
      F.AllCases.Index,
      G.AllCases.Index,
      H.AllCases.Index
    >,
    InlineProduct8<
      A,
      B,
      C,
      D,
      E,
      F,
      G,
      H
    >
  >

  @inlinable
  public static var allCases: AllCases {
    get {
      return AllCases(
        A.allCases,
        B.allCases,
        C.allCases,
        D.allCases,
        E.allCases,
        F.allCases,
        G.allCases,
        H.allCases
      )
    }
  }

}
