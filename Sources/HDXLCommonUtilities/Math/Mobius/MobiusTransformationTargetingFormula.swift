//
//  MobiusTransformationTargetingFormula.swift
//

import Foundation
import Numerics

@usableFromInline
internal enum MobiusTransformationTargetingFormulaZVariable : UInt8 {
  
  case z1 = 1
  case z2 = 2
  case z3 = 4
  
}

@usableFromInline
internal enum MobiusTransformationTargetingFormulaWVariable : UInt8 {
  
  case w1 = 8
  case w2 = 16
  case w3 = 32
  
}

@usableFromInline
internal struct MobiusTransformationTargetingFormulaVariablePresence : OptionSet, Hashable {
  
  @usableFromInline
  internal static let z1 = MobiusTransformationTargetingFormulaVariablePresence(.z1)

  @usableFromInline
  internal static let z2 = MobiusTransformationTargetingFormulaVariablePresence(.z2)

  @usableFromInline
  internal static let z3 = MobiusTransformationTargetingFormulaVariablePresence(.z3)

  @usableFromInline
  internal static let w1 = MobiusTransformationTargetingFormulaVariablePresence(.w1)

  @usableFromInline
  internal static let w2 = MobiusTransformationTargetingFormulaVariablePresence(.w2)

  @usableFromInline
  internal static let w3 = MobiusTransformationTargetingFormulaVariablePresence(.w3)
  
  @usableFromInline
  internal static let z1w1: MobiusTransformationTargetingFormulaVariablePresence = [.z1, .w1]

  @usableFromInline
  internal static let z2w2: MobiusTransformationTargetingFormulaVariablePresence = [.z2, .w2]

  @usableFromInline
  internal static let z3w3: MobiusTransformationTargetingFormulaVariablePresence = [.z3, .w3]

  @usableFromInline
  internal typealias RawValue = UInt8
  
  @usableFromInline
  internal var rawValue: RawValue
  
  @inlinable
  internal init(rawValue: RawValue) {
    self.rawValue = rawValue
  }

  @inlinable
  internal init(_ zVariable: MobiusTransformationTargetingFormulaZVariable) {
    self.init(
      rawValue: zVariable.rawValue
    )
  }

  @inlinable
  internal init(_ wVariable: MobiusTransformationTargetingFormulaWVariable) {
    self.init(
      rawValue: wVariable.rawValue
    )
  }
  
  @inlinable
  internal static func infiniteVariablesWithin<Representation:Real>(
    zs: (Complex<Representation>,Complex<Representation>,Complex<Representation>),
    ws: (Complex<Representation>,Complex<Representation>,Complex<Representation>)) -> MobiusTransformationTargetingFormulaVariablePresence {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(allArgumentsDistinct(zs.0,zs.1,zs.2))
    pedantic_assert(allArgumentsDistinct(ws.0,ws.1,ws.2))
    pedantic_assert(countOfInfinity(zs.0,zs.1,zs.2) <= 1)
    pedantic_assert(countOfInfinity(ws.0,ws.1,ws.2) <= 1)
    // ////////////////////////////////////////////////////////////////////////
    let (z1,z2,z3) = zs
    let infiniteZVariables: MobiusTransformationTargetingFormulaVariablePresence
    if !z1.isFinite {
      infiniteZVariables = .z1
    } else if !z2.isFinite {
      infiniteZVariables = .z2
    } else if !z3.isFinite {
      infiniteZVariables = .z3
    } else {
      infiniteZVariables = []
    }
    
    let (w1,w2,w3) = ws
    let infiniteWVariables: MobiusTransformationTargetingFormulaVariablePresence
    if !w1.isFinite {
      infiniteWVariables = .w1
    } else if !w2.isFinite {
      infiniteWVariables = .w2
    } else if !w3.isFinite {
      infiniteWVariables = .w3
    } else {
      infiniteWVariables = []
    }

    return infiniteZVariables.union(infiniteWVariables)
  }
  
}

extension MobiusTransformationTargetingFormulaVariablePresence : CustomStringConvertible {
  
  @inlinable
  internal var description: String {
    get {
      guard !self.isEmpty else {
        return "[]"
      }
      var elements: [String] = []
      if self.contains(.z1) {
        elements.append(".z1")
      }
      if self.contains(.z2) {
        elements.append(".z2")
      }
      if self.contains(.z3) {
        elements.append(".z3")
      }
      if self.contains(.w1) {
        elements.append(".w1")
      }
      if self.contains(.w2) {
        elements.append(".w2")
      }
      if self.contains(.w3) {
        elements.append(".w3")
      }
      return "[ \(elements.joined(separator: ", ")) ]"
    }
  }
  
}

extension MobiusTransformationTargetingFormulaVariablePresence : CustomDebugStringConvertible {
  
  @inlinable
  internal var debugDescription: String {
    get {
      return "MobiusTransformationTargetingFormulaVariablePresence(\(self.description))"
    }
  }
  
}

@usableFromInline
internal struct MobiusTransformationTargetingFormulaTerm<Representation:Real> {
  
  @usableFromInline
  internal var coefficient: Complex<Representation>
  
  @usableFromInline
  internal var variablePresence: MobiusTransformationTargetingFormulaVariablePresence
  
  @inlinable
  internal init(
    coefficient: Complex<Representation>,
    variablePresence: MobiusTransformationTargetingFormulaVariablePresence) {
    self.coefficient = coefficient
    self.variablePresence = variablePresence
  }
  
  @inlinable
  internal static var zero: MobiusTransformationTargetingFormulaTerm<Representation> {
    get {
      return MobiusTransformationTargetingFormulaTerm<Representation>(
        coefficient: Complex<Representation>.zero,
        variablePresence: []
      )
    }
  }
  
  @inlinable
  internal static var one: MobiusTransformationTargetingFormulaTerm<Representation> {
    get {
      return MobiusTransformationTargetingFormulaTerm<Representation>(
        coefficient: Complex<Representation>.one,
        variablePresence: []
      )
    }
  }
  
  @inlinable
  internal static var z1: MobiusTransformationTargetingFormulaTerm<Representation> {
    get {
      return MobiusTransformationTargetingFormulaTerm<Representation>(.z1)
    }
  }

  @inlinable
  internal static var z2: MobiusTransformationTargetingFormulaTerm<Representation> {
    get {
      return MobiusTransformationTargetingFormulaTerm<Representation>(.z2)
    }
  }

  @inlinable
  internal static var z3: MobiusTransformationTargetingFormulaTerm<Representation> {
    get {
      return MobiusTransformationTargetingFormulaTerm<Representation>(.z3)
    }
  }

  @inlinable
  internal static var w1: MobiusTransformationTargetingFormulaTerm<Representation> {
    get {
      return MobiusTransformationTargetingFormulaTerm<Representation>(.w1)
    }
  }

  @inlinable
  internal static var w2: MobiusTransformationTargetingFormulaTerm<Representation> {
    get {
      return MobiusTransformationTargetingFormulaTerm<Representation>(.w2)
    }
  }

  @inlinable
  internal static var w3: MobiusTransformationTargetingFormulaTerm<Representation> {
    get {
      return MobiusTransformationTargetingFormulaTerm<Representation>(.w3)
    }
  }

  @inlinable
  internal static var z1w1: MobiusTransformationTargetingFormulaTerm<Representation> {
    get {
      return MobiusTransformationTargetingFormulaTerm<Representation>([.z1,.w1])
    }
  }

  @inlinable
  internal static var z2w2: MobiusTransformationTargetingFormulaTerm<Representation> {
    get {
      return MobiusTransformationTargetingFormulaTerm<Representation>([.z2,.w2])
    }
  }

  @inlinable
  internal static var z3w3: MobiusTransformationTargetingFormulaTerm<Representation> {
    get {
      return MobiusTransformationTargetingFormulaTerm<Representation>([.z3,.w3])
    }
  }

  @inlinable
  internal static func zeroCoefficient(for variables: MobiusTransformationTargetingFormulaVariablePresence) -> MobiusTransformationTargetingFormulaTerm<Representation> {
    return MobiusTransformationTargetingFormulaTerm<Representation>(
      coefficient: .zero,
      variablePresence: variables
    )
  }
  
  @inlinable
  internal init(_ variables: MobiusTransformationTargetingFormulaVariablePresence) {
    self.init(
      coefficient: Complex<Representation>.one,
      variablePresence: variables
    )
  }
  
  @inlinable
  internal var negated: MobiusTransformationTargetingFormulaTerm<Representation> {
    get {
      return MobiusTransformationTargetingFormulaTerm<Representation>(
        coefficient: -self.coefficient,
        variablePresence: self.variablePresence
      )
    }
  }
  
  @inlinable
  internal func isDisjoint(with other: MobiusTransformationTargetingFormulaVariablePresence) -> Bool {
    return self.variablePresence.isDisjoint(with: other)
  }
  
  @inlinable
  internal mutating func formAddition(of other: MobiusTransformationTargetingFormulaTerm<Representation>) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(self.isValid)
    pedantic_assert(other.isValid)
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    precondition(self.variablePresence == other.variablePresence)
    self.coefficient += other.coefficient
  }
  
  @inlinable
  internal static func product(
    of lhs: MobiusTransformationTargetingFormulaTerm<Representation>,
    with rhs: MobiusTransformationTargetingFormulaTerm<Representation>) -> MobiusTransformationTargetingFormulaTerm<Representation> {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    precondition(lhs.isDisjoint(with: rhs.variablePresence))
    return MobiusTransformationTargetingFormulaTerm<Representation>(
      coefficient: lhs.coefficient * rhs.coefficient,
      variablePresence: lhs.variablePresence.union(rhs.variablePresence)
    )
  }
  
  @inlinable
  internal static func *(
    lhs: MobiusTransformationTargetingFormulaTerm<Representation>,
    rhs: MobiusTransformationTargetingFormulaTerm<Representation>) -> MobiusTransformationTargetingFormulaTerm<Representation> {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return .product(
      of: lhs,
      with: rhs
    )
  }

  @inlinable
  internal static func +(
    lhs: MobiusTransformationTargetingFormulaTerm<Representation>,
    rhs: MobiusTransformationTargetingFormulaTerm<Representation>) -> MobiusTransformationTargetingFormula<Representation> {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    switch lhs.variablePresence == rhs.variablePresence {
    case true:
      return MobiusTransformationTargetingFormula<Representation>(
        term: MobiusTransformationTargetingFormulaTerm<Representation>(
          coefficient: lhs.coefficient + rhs.coefficient,
          variablePresence: lhs.variablePresence
        )
      )
    case false:
      return MobiusTransformationTargetingFormula<Representation>(
        terms: [lhs, rhs]
      )
    }
  }

  @inlinable
  internal static func -(
    lhs: MobiusTransformationTargetingFormulaTerm<Representation>,
    rhs: MobiusTransformationTargetingFormulaTerm<Representation>) -> MobiusTransformationTargetingFormula<Representation> {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    switch lhs.variablePresence == rhs.variablePresence {
    case true:
      return MobiusTransformationTargetingFormula<Representation>(
        term: MobiusTransformationTargetingFormulaTerm<Representation>(
          coefficient: lhs.coefficient - rhs.coefficient,
          variablePresence: lhs.variablePresence
        )
      )
    case false:
      return MobiusTransformationTargetingFormula<Representation>(
        terms: [lhs, rhs.negated]
      )
    }
  }

  @inlinable
  internal func limitAfterDivision(byVariablesGoingToInfinity variables: MobiusTransformationTargetingFormulaVariablePresence) -> MobiusTransformationTargetingFormulaTerm<Representation> {
    guard !variables.isEmpty else {
      return self
    }
    guard !variables.isDisjoint(with: self.variablePresence) else {
      return .zero
    }
    let commonVariables = variables.intersection(self.variablePresence)
    guard !commonVariables.isEmpty else {
      return .zero
    }
    let remainderInfiniteVariables = variables.subtracting(commonVariables)
    guard remainderInfiniteVariables.isEmpty else {
      return .zero
    }
    return MobiusTransformationTargetingFormulaTerm<Representation>(
      coefficient: self.coefficient,
      variablePresence: self.variablePresence.subtracting(variables)
    )
  }
  
  @usableFromInline
  internal typealias ComplexTriple = (Complex<Representation>,Complex<Representation>,Complex<Representation>)
  
  @inlinable
  internal var isZero: Bool {
    get {
      return self.coefficient.isZero
    }
  }

  @inlinable
  internal var isNonZero: Bool {
    get {
      return !self.coefficient.isZero
    }
  }
  
  @inlinable
  internal func realization(
    zs: ComplexTriple,
    ws: ComplexTriple) -> Complex<Representation> {
    guard self.isNonZero else {
      return .zero
    }
    return canonicalizing() {
      var result: Complex<Representation> = self.coefficient
      let (z1,z2,z3) = zs
      let (w1,w2,w3) = ws
      if self.variablePresence.contains(.z1) {
        result.formFiniteProduct(with: z1)
      }
      if self.variablePresence.contains(.z2) {
        result.formFiniteProduct(with: z2)
      }
      if self.variablePresence.contains(.z3) {
        result.formFiniteProduct(with: z3)
      }
      if self.variablePresence.contains(.w1) {
        result.formFiniteProduct(with: w1)
      }
      if self.variablePresence.contains(.w2) {
        result.formFiniteProduct(with: w2)
      }
      if self.variablePresence.contains(.w3) {
        result.formFiniteProduct(with: w3)
      }
      precondition(result.isFinite)
      return result
    }
  }
  
}

extension MobiusTransformationTargetingFormulaTerm : Validatable {
  
  @inlinable
  internal var isValid: Bool {
    get {
      return self.coefficient.isFinite
    }
  }
  
}

extension MobiusTransformationTargetingFormulaTerm : Equatable {
  
  @inlinable
  internal static func ==(
    lhs: MobiusTransformationTargetingFormulaTerm<Representation>,
    rhs: MobiusTransformationTargetingFormulaTerm<Representation>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    guard
      lhs.coefficient == rhs.coefficient,
      lhs.variablePresence == rhs.variablePresence else {
        return false
    }
    return true
  }
  
}

extension MobiusTransformationTargetingFormulaTerm : CustomStringConvertible {
  
  @inlinable
  internal var description: String {
    get {
      return "(\(self.coefficient) * \(self.variablePresence.description))"
    }
  }
  
}

extension MobiusTransformationTargetingFormulaTerm : CustomDebugStringConvertible {
  
  @inlinable
  internal var debugDescription: String {
    get {
      return "MobiusTransformationTargetingFormula<\(String(reflecting: Representation.self))>(coefficient: \(self.coefficient.debugDescription), variablePresence: \(self.variablePresence.debugDescription))"
    }
  }
  
}

@usableFromInline
internal struct MobiusTransformationTargetingFormula<Representation:Real> {
  
  @usableFromInline
  internal typealias Term = MobiusTransformationTargetingFormulaTerm<Representation>
  
  @usableFromInline
  internal var terms: [Term]
  
  @inlinable
  internal init(term: Term) {
    self.init(
      terms: [term]
    )
  }
  
  @inlinable
  internal init(terms: [Term]) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(!terms.isEmpty)
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self.terms = terms
  }
  
}

extension MobiusTransformationTargetingFormula : Validatable {
  
  @inlinable
  internal var isValid: Bool {
    get {
      guard
        !self.terms.isEmpty,
        self.terms.allElementsAreValidOrIndifferent else {
          return false
      }
      return true
    }
  }
  
}

internal extension MobiusTransformationTargetingFormula {
  
  @usableFromInline
  typealias ComplexTriple = (Complex<Representation>,Complex<Representation>,Complex<Representation>)
  
  @usableFromInline
  typealias MobiusParameters = (
    a: Complex<Representation>,
    b: Complex<Representation>,
    c: Complex<Representation>,
    d: Complex<Representation>
  )
  
  @inlinable
  static func calculateMobiusTransformationParameters(
    zs: ComplexTriple,
    ws: ComplexTriple) -> MobiusParameters {
    let infiniteVariables = MobiusTransformationTargetingFormulaVariablePresence.infiniteVariablesWithin(
      zs: zs,
      ws: ws
    )
    
    let a = self.aFormula
    let b = self.bFormula
    let c = self.cFormula
    let d = self.dFormula
        
    let aRealization = a.realization(
      zs: zs,
      ws: ws,
      infiniteVariables: infiniteVariables
    )
    let bRealization = b.realization(
      zs: zs,
      ws: ws,
      infiniteVariables: infiniteVariables
    )
    let cRealization = c.realization(
      zs: zs,
      ws: ws,
      infiniteVariables: infiniteVariables
    )
    let dRealization = d.realization(
      zs: zs,
      ws: ws,
      infiniteVariables: infiniteVariables
    )

    return (
      a: aRealization,
      b: bRealization,
      c: cRealization,
      d: dRealization
    )
  }
  
  @inlinable
  static func for2x2Determinant(
    _ x11: Term, _ x12: Term,
    _ x21: Term, _ x22: Term) -> MobiusTransformationTargetingFormula<Representation> {
    return (x11 * x22) - (x12 * x21)
  }

  @inlinable
  static func for3x3Determinant(
    _ x11: Term, _ x12: Term, _ x13: Term,
    _ x21: Term, _ x22: Term, _ x23: Term,
    _ x31: Term, _ x32: Term, _ x33: Term) -> MobiusTransformationTargetingFormula<Representation> {
    let x11Contribution = x11 * .for2x2Determinant(
      x22, x23,
      x32, x33
    )
    let x12Contribution = x12 * .for2x2Determinant(
      x21, x23,
      x31, x33
    )
    let x13Contribution = x13 * .for2x2Determinant(
      x21, x22,
      x31, x32
    )
    return (
      x11Contribution
      -
      x12Contribution
      +
      x13Contribution
    )
  }
  
  /*
   let a:Complex<Representation> = threeXThreeDeterminant(
     SC(z1, w1), SC(w1), SC(.one),
     SC(z2, w2), SC(w2), SC(.one),
     SC(z3, w3), SC(w3), SC(.one),
     afterDivisionByInfinityCount: infinityCount
   )

   let b:Complex<Representation> = threeXThreeDeterminant(
     SC(z1, w1), SC(z1), SC(w1),
     SC(z2, w2), SC(z2), SC(w2),
     SC(z3, w3), SC(z3), SC(w3),
     afterDivisionByInfinityCount: infinityCount
   )

   let c:Complex<Representation> = threeXThreeDeterminant(
     SC(z1), SC(w1), SC(.one),
     SC(z2), SC(w2), SC(.one),
     SC(z3), SC(w3), SC(.one),
     afterDivisionByInfinityCount: infinityCount
   )

   let d:Complex<Representation> = threeXThreeDeterminant(
     SC(z1, w1), SC(z1), SC(.one),
     SC(z2, w2), SC(z2), SC(.one),
     SC(z3, w3), SC(z3), SC(.one),
     afterDivisionByInfinityCount: infinityCount
   )

   */
  
  @inlinable
  static var aFormula: MobiusTransformationTargetingFormula<Representation> {
    get {
      return .for3x3Determinant(
        .z1w1, .w1, .one,
        .z2w2, .w2, .one,
        .z3w3, .w3, .one
      )
    }
  }

  @inlinable
  static var bFormula: MobiusTransformationTargetingFormula<Representation> {
    get {
      return .for3x3Determinant(
        .z1w1, .z1, .w1,
        .z2w2, .z2, .w2,
        .z3w3, .z3, .w3
      )
    }
  }

  @inlinable
  static var cFormula: MobiusTransformationTargetingFormula<Representation> {
    get {
      return .for3x3Determinant(
        .z1, .w1, .one,
        .z2, .w2, .one,
        .z3, .w3, .one
      )
    }
  }

  @inlinable
  static var dFormula: MobiusTransformationTargetingFormula<Representation> {
    get {
      return .for3x3Determinant(
        .z1w1, .z1, .one,
        .z2w2, .z2, .one,
        .z3w3, .z3, .one
      )
    }
  }
  
  

  @inlinable
  var negated: MobiusTransformationTargetingFormula<Representation> {
    get {
      return MobiusTransformationTargetingFormula<Representation>(
        terms: self.terms.map() {
          $0.negated
        }
      )
    }
  }
  
  @inlinable
  static func +(
    lhs: Term,
    rhs: MobiusTransformationTargetingFormula<Representation>) -> MobiusTransformationTargetingFormula<Representation> {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return MobiusTransformationTargetingFormula<Representation>(
      terms: [lhs].appending(
        contentsOf: rhs.terms
      )
    )
  }

  @inlinable
  static func +(
    lhs: MobiusTransformationTargetingFormula<Representation>,
    rhs: Term) -> MobiusTransformationTargetingFormula<Representation> {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return MobiusTransformationTargetingFormula<Representation>(
      terms: lhs.terms.appending(rhs)
    )
  }

  @inlinable
  static func +(
    lhs: MobiusTransformationTargetingFormula<Representation>,
    rhs: MobiusTransformationTargetingFormula<Representation>) -> MobiusTransformationTargetingFormula<Representation> {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return MobiusTransformationTargetingFormula<Representation>(
      terms: lhs.terms.appending(
        contentsOf: rhs.terms
      )
    )
  }

  @inlinable
  static func -(
    lhs: Term,
    rhs: MobiusTransformationTargetingFormula<Representation>) -> MobiusTransformationTargetingFormula<Representation> {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return MobiusTransformationTargetingFormula<Representation>(
      terms: [lhs].appending(
        contentsOf: rhs.negated.terms
      )
    )
  }

  @inlinable
  static func -(
    lhs: MobiusTransformationTargetingFormula<Representation>,
    rhs: Term) -> MobiusTransformationTargetingFormula<Representation> {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return MobiusTransformationTargetingFormula<Representation>(
      terms: lhs.terms.appending(rhs.negated)
    )
  }

  @inlinable
  static func -(
    lhs: MobiusTransformationTargetingFormula<Representation>,
    rhs: MobiusTransformationTargetingFormula<Representation>) -> MobiusTransformationTargetingFormula<Representation> {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return MobiusTransformationTargetingFormula<Representation>(
      terms: lhs.terms.appending(
        contentsOf: rhs.negated.terms
      )
    )
  }

  @inlinable
  static func *(
    lhs: Term,
    rhs: MobiusTransformationTargetingFormula<Representation>) -> MobiusTransformationTargetingFormula<Representation> {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    //
    // The below doesn't gather terms with common variable presences, but for now
    // I don't really care...
    return MobiusTransformationTargetingFormula<Representation>(
      terms: rhs.terms.map() {
        Term.product(
          of: lhs,
          with: $0
        )
      }
    )
  }

  @inlinable
  static func *(
    lhs: MobiusTransformationTargetingFormula<Representation>,
    rhs: Term) -> MobiusTransformationTargetingFormula<Representation> {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    //
    // The below doesn't gather terms with common variable presences, but for now
    // I don't really care...
    return MobiusTransformationTargetingFormula<Representation>(
      terms: lhs.terms.map() {
        Term.product(
          of: $0,
          with: rhs
        )
      }
    )
  }

  @inlinable
  static func *(
    lhs: MobiusTransformationTargetingFormula<Representation>,
    rhs: MobiusTransformationTargetingFormula<Representation>) -> MobiusTransformationTargetingFormula<Representation> {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    //
    // The below doesn't gather terms with common variable presences, but for now
    // I don't really care...
    var uniquedTerms: [MobiusTransformationTargetingFormulaVariablePresence:Term] = [:]
    for (l,r) in CartesianProduct(lhs.terms,rhs.terms).asTuples() {
      // looks backwards
      let lr = Term.product(
        of: l,
        with: r
      )
      uniquedTerms[
        lr.variablePresence,
        default: Term.zeroCoefficient(for: lr.variablePresence)].formAddition(of: lr)      
    }
    return MobiusTransformationTargetingFormula<Representation>(
      terms: uniquedTerms.values.filter() {
        $0.isNonZero
      }
    )
  }
  
  @inlinable
  func realization(
    zs: ComplexTriple,
    ws: ComplexTriple,
    infiniteVariables: MobiusTransformationTargetingFormulaVariablePresence) -> Complex<Representation> {
    return canonicalizing() {
      var result: Complex<Representation> = .zero
      for term in terms {
        result += term.limitAfterDivision(
          byVariablesGoingToInfinity: infiniteVariables
        ).realization(
          zs: zs,
          ws: ws
        )
      }
      return result
    }
  }

}

extension MobiusTransformationTargetingFormula : CustomStringConvertible {
  
  @inlinable
  internal var description: String {
    get {
      return self.terms
        .lazy
        .map({$0.description})
        .joined(separator: " + ")
    }
  }
  
}

extension MobiusTransformationTargetingFormula : CustomDebugStringConvertible {
  
  @inlinable
  internal var debugDescription: String {
    get {
      return "MobiusTransformationTargetingFormula<\(String(reflecting: Representation.self))>(terms: \(self.terms.debugDescription))"
    }
  }
  
}
