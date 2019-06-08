//
//  Tribool.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Tribool - Operators
// -------------------------------------------------------------------------- //

/// "Custom tribool-equals" operator; deliberately ugly to hopefully avoid conflicts.
///
/// Intended type is `(Tribool,Tribool) -> Tribool`.
///
infix operator ?==? : ComparisonPrecedence

/// "Custom tribool-not-equal" operator; deliberately ugly to hopefully avoid conflicts.
///
/// Intended type is `(Tribool,Tribool) -> Tribool`.
///
infix operator ?!=? : ComparisonPrecedence

/// "Custom tribool-and" operator; deliberately ugly to hopefully avoid conflicts.
///
/// - note: Deliberately avoiding use of `&&` because I think "confusing operator, wat do?" is *more-readable* than "familiar operator, except not really".
///
/// Intended type is `(Tribool,Tribool) -> Tribool`.
///
infix operator ?&&? : LogicalConjunctionPrecedence

/// "Custom tribool-or" operator; deliberately ugly to hopefully avoid conflicts.
///
/// - note: Deliberately avoiding use of `||` because I think "confusing operator, wat do?" is *more-readable* than "familiar operator, except not really".
///
/// Intended type is `(Tribool,Tribool) -> Tribool`.
///
infix operator ?||? : LogicalDisjunctionPrecedence

/// "Custom tribool-and-equal" operator; deliberately ugly to hopefully avoid conflicts.
///
/// - note: Deliberately avoiding use of `&&=` because I think "confusing operator, wat do?" is *more-readable* than "familiar operator, except not really".
///
/// Intended type is `(inout Tribool,Tribool) -> Void`.
///
infix operator ?&&?= : AssignmentPrecedence

/// "Custom tribool-or-equalr" operator; deliberately ugly to hopefully avoid conflicts.
///
/// - note: Deliberately avoiding use of `||=` because I think "confusing operator, wat do?" is *more-readable* than "familiar operator, except not really".
///
/// Intended type is `(inout Tribool,Tribool) -> Void`.
///
infix operator ?||?= : AssignmentPrecedence

// -------------------------------------------------------------------------- //
// MARK: Tribool - Definition
// -------------------------------------------------------------------------- //

/// Support for [three-valued logic](https://en.wikipedia.org/wiki/Three-valued_logic),
/// e.g. true/false/unknown. Can substitute for `Bool?` in places where you want it visible from Objective-C,
/// and includes support for performing three-valued-logic and, or, "equality", and "negation".
///
/// For a similar library, see [Boost's tribool implementation](https://www.boost.org/doc/libs/1_70_0/doc/html/tribool.html),
/// but be aware that whereas that used overloads of `==` for the tribool-equality (etc.), here I've avoided
/// crossing the streams between "acting like a boolean" and "acting like a tribool": `==` is equality, and
/// if you want tribool-equality there's `?==?`; `&&` isn't defined for `Tribool`, but `?&&?` gives you
/// tribool-and; and so on and so forth.
///
@objc(HDXLTribool)
public enum Tribool : Int8 {
  
  /// Case for "(known-)false".
  @objc(HDXLTriboolFalse)
  case no = -1
  
  /// Case for "unknown".
  @objc(HDXLTriboolIndefinite)
  case indefinite = 0
  
  /// Case for "(known-)true".
  @objc(HDXLTriboolTrue)
  case yes = 1
  
  /// Synonym for `.indefinite`
  public static let maybe: Tribool = .indefinite

  /// Synonym for `.indefinite`
  public static let unknown: Tribool = .indefinite

  /// Synonym for `.yes`
  public static let `true`: Tribool = .yes

  /// Synonym for `.no`
  public static let `false`: Tribool = .no

}

// -------------------------------------------------------------------------- //
// MARK: Tribool - Definiteness Conveniences
// -------------------------------------------------------------------------- //

public extension Tribool {

  /// Enumeration providing names for the definite-or-indefinite states.
  @objc(HDXLTriboolDefiniteness)
  enum Definiteness : Int8 {
    
    /// Corresponds to definite `Tribool` values
    case definite
    
    /// Corresponds to indefinite `Tribool` values.
    case indefinite
    
  }
  
  /// `true` iff `self` is definitely-false.
  @inlinable
  var isDefinitelyTrue: Bool {
    get {
      return self == .yes
    }
  }

  /// `true` iff `self` is definitely-false.
  @inlinable
  var isDefinitelyFalse: Bool {
    get {
      return self == .no
    }
  }
  
  /// `true` iff `self` is either false or indefinite.
  @inlinable
  var isNotTrue: Bool {
    get {
      return self != .yes
    }
  }

  /// `true` iff `self` is either true or indefinite.
  @inlinable
  var isNotFalse: Bool {
    get {
      return self != .no
    }
  }

  /// `true` iff `self` is not-indefinite.
  @inlinable
  var isDefinite: Bool {
    get {
      return self != .indefinite
    }
  }

  /// `true` iff `self` is indefinite.
  @inlinable
  var isIndefinite: Bool {
    get {
      return self == .indefinite
    }
  }

  /// Check for definiteness-or-indefiniteness.
  @inlinable
  var definiteness: Definiteness {
    get {
      switch self {
      case .yes:
        return .definite
      case .indefinite:
        return .indefinite
      case .no:
        return .definite
      }
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: Tribool - Boolean Conveniences
// -------------------------------------------------------------------------- //

public extension Tribool {
  
  @inlinable
  init(boolValue: @autoclosure () -> Bool, definite: Bool) {
    switch definite {
    case true:
      switch boolValue() {
      case true:
        self = .yes
      case false:
        self = .no
      }
    case false:
      self = .indefinite
    }
  }
  
  @inlinable
  init(_ boolean: Bool) {
    switch boolean {
    case true:
      self = .yes
    case false:
      self = .no
    }
  }

  @inlinable
  init(_ boolean: Bool?) {
    if let boolean = boolean {
      switch boolean {
      case true:
        self = .yes
      case false:
        self = .no
      }
    } else {
      self = .indefinite
    }
  }
  
  @inlinable
  var boolValue: Bool? {
    get {
      switch self {
      case .yes:
        return true
      case .indefinite:
        return nil
      case .no:
        return false
      }
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: Tribool - Logic Operations - Negation
// -------------------------------------------------------------------------- //

public extension Tribool {
  
  @inlinable
  func negated() -> Tribool {
    switch self {
    case .yes:
      return .no
    case .indefinite:
      return .indefinite
    case .no:
      return .yes
    }
  }
  
  @inlinable
  mutating func formNegation() {
    switch self {
    case .yes:
      self = .no
    case .indefinite:
      self = .indefinite
    case .no:
      self = .yes
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Tribool - Logic Operations - Tribool-Equality
// -------------------------------------------------------------------------- //

public extension Tribool {
  
  @inlinable
  static func ?==?(
    lhs: Tribool,
    rhs: Tribool) -> Tribool {
    switch (lhs, rhs) {
      
    // yes, _
    case (.yes, .yes):
      return .yes
    case (.yes, .indefinite):
      return .indefinite
    case (.yes, .no):
      return .no

    // indefinite, _
    case (.indefinite, .yes):
      return .indefinite
    case (.indefinite, .indefinite):
      return .indefinite
    case (.indefinite, .no):
      return .indefinite

    // no, _
    case (.no, .yes):
      return .no
    case (.no, .indefinite):
      return .indefinite
    case (.no, .no):
      return .yes
    }
  }

  @inlinable
  static func ?!=?(
    lhs: Tribool,
    rhs: Tribool) -> Tribool {
    switch (lhs, rhs) {
      
    // yes, _
    case (.yes, .yes):
      return .no
    case (.yes, .indefinite):
      return .indefinite
    case (.yes, .no):
      return .yes
      
    // indefinite, _
    case (.indefinite, .yes):
      return .indefinite
    case (.indefinite, .indefinite):
      return .indefinite
    case (.indefinite, .no):
      return .indefinite
      
    // no, _
    case (.no, .yes):
      return .yes
    case (.no, .indefinite):
      return .indefinite
    case (.no, .no):
      return .no
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: Tribool - Logic Operations - Tribool-And
// -------------------------------------------------------------------------- //

public extension Tribool {
  
  @inlinable
  static func ?&&?(
    lhs: Tribool,
    rhs: Tribool) -> Tribool {
    switch (lhs, rhs) {
    case (.yes, .yes):
      return .yes
    case (.no, _):
      return .no
    case (_, .no):
      return .no
    default:
      return .indefinite
    }
  }

  @inlinable
  static func ?&&?=(
    lhs: inout Tribool,
    rhs: Tribool) {
    switch (lhs, rhs) {
    case (.yes, .yes):
      lhs = .yes
    case (.no, _):
      lhs = .no
    case (_, .no):
      lhs = .no
    default:
      lhs = .indefinite
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: Tribool - Logic Operations - Tribool-Or
// -------------------------------------------------------------------------- //

public extension Tribool {
  
  @inlinable
  static func ?||?(
    lhs: Tribool,
    rhs: Tribool) -> Tribool {
    switch (lhs, rhs) {
    case (.yes, _):
      return .yes
    case (_, .yes):
      return .yes
    case (.no, _):
      return .no
    case (_, .no):
      return .no
    default:
      return .indefinite
    }
  }
  
  @inlinable
  static func ?||?=(
    lhs: inout Tribool,
    rhs: Tribool) {
    switch (lhs, rhs) {
    case (.yes, _):
      lhs = .yes
    case (_, .yes):
      lhs = .yes
    case (.no, _):
      lhs = .no
    case (_, .no):
      lhs = .no
    default:
      lhs = .indefinite
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: Tribool - Equatable
// -------------------------------------------------------------------------- //

extension Tribool : Equatable {
  
  @inlinable
  public static func ==(
    lhs: Tribool,
    rhs: Tribool) -> Bool {
    return lhs.rawValue == rhs.rawValue
  }

  @inlinable
  public static func !=(
    lhs: Tribool,
    rhs: Tribool) -> Bool {
    return lhs.rawValue != rhs.rawValue
  }

}

// -------------------------------------------------------------------------- //
// MARK: Tribool - Hashable
// -------------------------------------------------------------------------- //

extension Tribool : Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.rawValue.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Tribool - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension Tribool : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      switch self {
      case .yes:
        return ".yes"
      case .indefinite:
        return ".indefinite"
      case .no:
        return ".no"
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Tribool - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension Tribool : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      switch self {
      case .yes:
        return "Tribool.yes"
      case .indefinite:
        return "Tribool.indefinite"
      case .no:
        return "Tribool.no"
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Tribool - Codable
// -------------------------------------------------------------------------- //

extension Tribool : Codable {
  
  // synthesized ok
  
}

// -------------------------------------------------------------------------- //
// MARK: Tribool - CaseIterable
// -------------------------------------------------------------------------- //

extension Tribool : CaseIterable {
  
  public typealias AllCases = [Tribool]
  
  public static let allCases: AllCases = [
    .no,
    .indefinite,
    .yes
  ]
  
}

// -------------------------------------------------------------------------- //
// MARK: Tribool.Definiteness - Equatable
// -------------------------------------------------------------------------- //

extension Tribool.Definiteness : Equatable {
  
  @inlinable
  public static func ==(
    lhs: Tribool.Definiteness,
    rhs: Tribool.Definiteness) -> Bool {
    return lhs.rawValue == rhs.rawValue
  }

  @inlinable
  public static func !=(
    lhs: Tribool.Definiteness,
    rhs: Tribool.Definiteness) -> Bool {
    return lhs.rawValue != rhs.rawValue
  }

}


// -------------------------------------------------------------------------- //
// MARK: Tribool.Definiteness - Hashable
// -------------------------------------------------------------------------- //

extension Tribool.Definiteness : Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.rawValue.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Tribool.Definiteness - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension Tribool.Definiteness : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      switch self {
      case .definite:
        return ".definite"
      case .indefinite:
        return ".indefinite"
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Tribool.Definiteness - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension Tribool.Definiteness : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      switch self {
      case .definite:
        return "Tribool.Definiteness.definite"
      case .indefinite:
        return "Tribool.Definiteness.indefinite"
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Tribool.Definiteness - Codable
// -------------------------------------------------------------------------- //

extension Tribool.Definiteness : Codable {
  
}

// -------------------------------------------------------------------------- //
// MARK: Tribool.Definiteness - CaseIterable
// -------------------------------------------------------------------------- //

extension Tribool.Definiteness : CaseIterable {
  
  /// - todo: Bring fixed-size collections here and use them instead of array?
  public typealias AllCases = [Tribool.Definiteness]
  
  public static let allCases: AllCases = [
    .definite,
    .indefinite
  ]
  
}
