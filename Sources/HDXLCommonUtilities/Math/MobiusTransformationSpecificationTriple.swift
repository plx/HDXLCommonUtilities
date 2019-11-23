//
//  MobiusTransformationSpecificationTriple.swift
//

import Foundation
import Numerics

internal struct MobiusTransformationSpecificationTriple<Representation:Real> {
  
  @usableFromInline
  internal typealias MappedPair = MobiusTransformationMappedPair<Representation>

  @usableFromInline
  internal var _p1: MappedPair

  @usableFromInline
  internal var _p2: MappedPair

  @usableFromInline
  internal var _p3: MappedPair

  @inlinable
  internal var p1: MappedPair {
    get {
      return self._p1
    }
  }

  @inlinable
  internal var p2: MappedPair {
    get {
      return self._p2
    }
  }

  @inlinable
  internal var p3: MappedPair {
    get {
      return self._p3
    }
  }
  
  @inlinable
  internal var z1: Complex<Representation> {
    get {
      return self._p1.z
    }
  }

  @inlinable
  internal var z2: Complex<Representation> {
    get {
      return self._p2.z
    }
  }

  @inlinable
  internal var z3: Complex<Representation> {
    get {
      return self._p3.z
    }
  }

  @inlinable
  internal var w1: Complex<Representation> {
    get {
      return self._p1.w
    }
  }

  @inlinable
  internal var w2: Complex<Representation> {
    get {
      return self._p2.w
    }
  }

  @inlinable
  internal var w3: Complex<Representation> {
    get {
      return self._p3.w
    }
  }
  
  @inlinable
  internal var zs: (Complex<Representation>,Complex<Representation>,Complex<Representation>) {
    get {
      return (self.z1,self.z2,self.z3)
    }
  }

  @inlinable
  internal var ws: (Complex<Representation>,Complex<Representation>,Complex<Representation>) {
    get {
      return (self.w1,self.w2,self.w3)
    }
  }

  @inlinable
  internal init(
    p1: MappedPair,
    p2: MappedPair,
    p3: MappedPair) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(allArgumentsDistinct(p1.z,p2.z,p3.z))
    pedantic_assert(allArgumentsDistinct(p1.w,p2.w,p3.w))
    pedantic_assert(
      MappedPair.structuralComparison(
        p1,
        p2
      ) == .orderedAscending
    )
    pedantic_assert(
      MappedPair.structuralComparison(
        p2,
        p3
      ) == .orderedAscending
    )
    pedantic_assert(
      MappedPair.structuralComparison(
        p1,
        p3
      ) == .orderedAscending
    )
    defer { pedantic_assert(self.isValid)}
    // /////////////////////////////////////////////////////////////////////////
    self._p1 = p1
    self._p2 = p2
    self._p3 = p3
  }
  
  @inlinable
  internal init(
    unordered a: MappedPair,
    _ b: MappedPair,
    _ c: MappedPair) {
    let (p1,p2,p3) = customizedAscendingArrangement(a,b,c) {
      MappedPair.structuralComparison(
        $0,
        $1
      )
    }
    self.init(
      p1: p1,
      p2: p2,
      p3: p3
    )
  }
  
  @inlinable
  internal init(
    _ x: (Complex<Representation>,Complex<Representation>),
    _ y: (Complex<Representation>,Complex<Representation>),
    _ z: (Complex<Representation>,Complex<Representation>)) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(allArgumentsDistinct(x.0,y.0,z.0))
    pedantic_assert(allArgumentsDistinct(x.1,y.1,z.1))
    // /////////////////////////////////////////////////////////////////////////
    self.init(unordered:
      MappedPair(
        sending: x.0,
        to: x.1
      ),
      MappedPair(
        sending: y.0,
        to: y.1
      ),
      MappedPair(
        sending: z.0,
        to: z.1
      )
    )
  }

}

extension MobiusTransformationSpecificationTriple : Validatable {
  
  @inlinable
  internal var isValid: Bool {
    get {
      guard
        allArgumentsDistinct(
          self.z1,
          self.z2,
          self.z3
        ),
        allArgumentsDistinct(
          self.w1,
          self.w2,
          self.w3
        ),
        MappedPair.structuralComparison(
          self.p1,
          self.p2
        ) == .orderedAscending,
        MappedPair.structuralComparison(
          self.p2,
          self.p3
        ) == .orderedAscending,
        MappedPair.structuralComparison(
          self.p1,
          self.p3
          ) == .orderedAscending else {
            return false
      }
      return true
    }
  }
  
}

extension MobiusTransformationSpecificationTriple : Equatable {
  
  @inlinable
  internal static func ==(
    lhs: MobiusTransformationSpecificationTriple<Representation>,
    rhs: MobiusTransformationSpecificationTriple<Representation>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    guard
      lhs.p1 == rhs.p1,
      lhs.p2 == rhs.p2,
      lhs.p3 == rhs.p3 else {
        return false
    }
    return true
  }
  
  
}

extension MobiusTransformationSpecificationTriple : Hashable {
  
  @inlinable
  internal func hash(into hasher: inout Hasher) {
    self.p1.hash(into: &hasher)
    self.p2.hash(into: &hasher)
    self.p3.hash(into: &hasher)
  }

}

extension MobiusTransformationSpecificationTriple : CustomStringConvertible {
  
  @inlinable
  internal var description: String {
    get {
      return "(\(self.p1.description),\(self.p2.description),\(self.p3.description))"
    }
  }
  
}

extension MobiusTransformationSpecificationTriple : CustomDebugStringConvertible {
  
  @inlinable
  internal var debugDescription: String {
    get {
      return "MobiusTransformationSpecificationTriple<\(String(reflecting: Representation.self))>(p1: \(self.p1.debugDescription), p2: \(self.p2.debugDescription), p3: \(self.p3.debugDescription))"
    }
  }
  
}

extension MobiusTransformationSpecificationTriple : Codable where Representation : Codable {
  
}
