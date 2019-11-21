//
//  MobiusTransformationSpecification.swift
//

import Foundation
import Numerics

public struct MobiusTransformationSpecification<Representation:Real> {
  
  @usableFromInline
  internal typealias Storage = MobiusTransformationSpecificationStorage<Representation>
  
  @usableFromInline
  internal typealias MappedPair = MobiusTransformationMappedPair<Representation>

  public typealias ComplexPair = (Complex<Representation>,Complex<Representation>)
  public typealias ComplexTriple = (Complex<Representation>,Complex<Representation>,Complex<Representation>)

  @usableFromInline
  internal var storage: Storage
  
  @inlinable
  internal init(storage: Storage) {
    self.storage = storage
  }
  
}

@usableFromInline
internal final class MobiusTransformationSpecificationStorage<Representation:Real> {

  @usableFromInline
  internal typealias MappedPair = MobiusTransformationMappedPair<Representation>

  @usableFromInline
  internal typealias ComplexPair = (Complex<Representation>,Complex<Representation>)

  @usableFromInline
  internal typealias ComplexTriple = (Complex<Representation>,Complex<Representation>,Complex<Representation>)
    
  @usableFromInline
  internal var p1: Pair {
    willSet {
      // ///////////////////////////////////////////////////////////////////////
      pedantic_assert(newValue.isValid)
      pedantic_assert(self.isValid)
      // ///////////////////////////////////////////////////////////////////////
    }
    didSet {
      // ///////////////////////////////////////////////////////////////////////
      pedantic_assert(self.isValid)
      // ///////////////////////////////////////////////////////////////////////
      self.conditionallyResetCachedProperties(
        when: oldValue != self.p1
      )
    }
  }

  @usableFromInline
  internal var p2: Pair {
    willSet {
      // ///////////////////////////////////////////////////////////////////////
      pedantic_assert(newValue.isValid)
      pedantic_assert(self.isValid)
      // ///////////////////////////////////////////////////////////////////////
    }
    didSet {
      // ///////////////////////////////////////////////////////////////////////
      pedantic_assert(self.isValid)
      // ///////////////////////////////////////////////////////////////////////
      self.conditionallyResetCachedProperties(
        when: oldValue != self.p2
      )
    }
  }

  @usableFromInline
  internal var p3: Pair {
    willSet {
      // ///////////////////////////////////////////////////////////////////////
      pedantic_assert(newValue.isValid)
      pedantic_assert(self.isValid)
      // ///////////////////////////////////////////////////////////////////////
    }
    didSet {
      // ///////////////////////////////////////////////////////////////////////
      pedantic_assert(self.isValid)
      // ///////////////////////////////////////////////////////////////////////
      self.conditionallyResetCachedProperties(
        when: oldValue != self.p3
      )
    }
  }
  
  @inlinable
  internal var z1: Complex<Representation> {
    get {
      return self.p1.z
    }
    set {
      self.p1.z = newValue
    }
  }

  @inlinable
  internal var z2: Complex<Representation> {
    get {
      return self.p2.z
    }
    set {
      self.p2.z = newValue
    }
  }

  @inlinable
  internal var z3: Complex<Representation> {
    get {
      return self.p3.z
    }
    set {
      self.p3.z = newValue
    }
  }

  @inlinable
  internal var w1: Complex<Representation> {
    get {
      return self.p1.w
    }
    set {
      self.p1.w = newValue
    }
  }

  @inlinable
  internal var w2: Complex<Representation> {
    get {
      return self.p2.w
    }
    set {
      self.p2.w = newValue
    }
  }

  @inlinable
  internal var w3: Complex<Representation> {
    get {
      return self.p3.w
    }
    set {
      self.p3.w = newValue
    }
  }

  @inlinable
  internal func conditionallyResetCachedProperties(when condition: @autoclosure () -> Bool) {
    guard
      self.hasCachedPropertyValues,
      condition() else {
      return
    }
    self.actuallyResetCachedProperties()
  }
  
  @inlinable
  internal func actuallyResetCachedProperties() {
    self._zs = nil
    self._ws = nil
  }
  
  @usableFromInline
  internal var _zs: ComplexTriple? = nil
  
  @usableFromInline
  internal var _ws: ComplexTriple? = nil
  
  @inlinable
  internal var zs: ComplexTriple {
    get {
      return self._zs.obtainAssuredValue(
        fallingBackUpon: (
          self.z1,
          self.z2,
          self.z3
        )
      )
    }
  }

  @inlinable
  internal var ws: ComplexTriple {
    get {
      return self._ws.obtainAssuredValue(
        fallingBackUpon: (
          self.w1,
          self.w2,
          self.w3
        )
      )
    }
  }
  
  @inlinable
  internal init(
    p1: MappedPair,
    p2: MappedPair,
    p3: MappedPair) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(p1.isValid)
    pedantic_assert(p2.isValid)
    pedantic_assert(p3.isValid)
    pedantic_assert(
      allArgumentsDistinct(p1.z,p2.z,p3.z)
    )
    pedantic_assert(
      allArgumentsDistinct(p1.w,p2.w,p3.w)
    )
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
  }

  @inlinable
  internal init(
    sending zs: ComplexTriple
    to ws: ComplexTriple) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(
      allArgumentsDistinct(zs.0,zs.1,zs.2)
    )
    pedantic_assert(
      allArgumentsDistinct(zs.0,zs.1,zs.2)
    )
    // /////////////////////////////////////////////////////////////////////////
    self.init(
      p1: MappedPair(
        sending: zs.0,
        to: ws.0
      ),
      p2: MappedPair(
        sending: zs.1,
        to: ws.1
      ),
      p3: MappedPair(
        sending: zs.2,
        to: ws.2
      )
    )
  }
  
  @inlinable
  internal init(
    forMappings p1: ComplexPair,
    _ p2: ComplexPair,
    _ p3: ComplexPair) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(
      allArgumentsDistinct(p1.0,p2.0,p3.0)
    )
    pedantic_assert(
      allArgumentsDistinct(p1.1,p2.1,p3.1)
    )
    // /////////////////////////////////////////////////////////////////////////
    self.init(
      p1: MappedPair(
        sending: p1.0,
        to: p1.1
      ),
      p2: MappedPair(
        sending: p2.0,
        to: p2.1
      ),
      p3: MappedPair(
        sending: p3.0,
        to: p3.1
      )
    )
  }
  
}

extension MobiusTransformationSpecificationStorage : Validatable {
  
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
        ) else {
          return false
      }
      return true
    }
  }
  
}

extension MobiusTransformationSpecificationStorage : Equatable {
  
  @inlinable
  internal static func ==(
    lhs: MobiusTransformationSpecificationStorage<Representation>,
    rhs: MobiusTransformationSpecificationStorage<Representation>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    guard lhs !== rhs else {
      return true
    }
    guard
      lhs.p1 == rhs.p1,
      lhs.p2 == rhs.p2,
      lhs.p3 == rhs.p3 else {
        return false
    }
    return true
  }
  
}

extension MobiusTransformationSpecificationStorage : Hashable {
  
  @inlinable
  internal func hash(into hasher: inout Hasher) {
    self.p1.hash(into: &hasher)
    self.p2.hash(into: &hasher)
    self.p3.hash(into: &hasher)
  }
  
}

extension MobiusTransformationSpecificationStorage : Codable where Representation:Codable {
  
  @usableFromInline
  internal enum CodingKeys : String, CodingKey {
    case p1 = "p1"
    case p2 = "p2"
    case p3 = "p3"
    
    @inlinable
    internal var intValue: Int? {
      get {
        switch self {
        case .p1:
          return 0
        case .p2:
          return 1
        case .p3:
          return 2
        }
      }
    }
    
    @inlinable
    internal init?(intValue: Int) {
      switch intValue {
      case 0:
        self = .p1
      case 1:
        self = .p2
      case 2:
        self = .p3
      default:
        return nil
      }
    }

  }
  
  @inlinable
  internal func encode(to encoder: Encoder) throws {
    var values = encoder.container(keyedBy: CodingKeys.self)
    try values.encode(
      self.p1,
      forKey: .p1
    )
    try values.encode(
      self.p2,
      forKey: .p2
    )
    try values.encode(
      self.p3,
      forKey: .p3
    )
  }
  
  @inlinable
  internal init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    let p1 = try values.decode(
      MappedPair.self,
      forKey: .p1
    )
    let p2 = try values.decode(
      MappedPair.self,
      forKey: .p2
    )
    let p3 = try values.decode(
      MappedPair.self,
      forKey: .p3
    )
    self.init(
      p1: p1,
      p2: p2,
      p3: p3
    )
  }

}
