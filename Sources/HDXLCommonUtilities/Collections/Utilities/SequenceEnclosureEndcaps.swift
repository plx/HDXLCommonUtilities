//
//  SequenceEnclosureEndcaps.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: SequenceEnclosureEndcaps - Definition
// -------------------------------------------------------------------------- //

/// Utility struct used to define a matching set of open/close brackets, like
/// `(` and `)` or `[` and `]`.
public struct SequenceEnclosureEndcaps {
  
  /// The opening bracket.
  public var initial: String
  
  /// The closing bracket.
  public var terminal: String
  
  /// Componentwise-constructor.
  @inlinable
  public init(initial: String, terminal: String) {
    self.initial = initial
    self.terminal = terminal
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SequenceEnclosureEndcaps - Stringification
// -------------------------------------------------------------------------- //

public extension SequenceEnclosureEndcaps {
  
  /// Encloses `string` within the endcaps.
  ///
  /// - parameter string: The string to enclose within `self`'s endcaps.
  /// - parameter includeSpace: If `true`, insert empty space between `string` and each endcap; if `false`, do not.
  ///
  /// - returns: `string` interpolated-between `self.initial` and `self.terminal`.
  ///
  @inlinable
  func string(
    enclosing string: String,
    includeSpace: Bool = true) -> String {
    switch includeSpace {
    case true:
      return "\(self.initial) \(string) \(self.terminal)"
    case false:
      return "\(self.initial)\(string)\(self.terminal)"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SequenceEnclosureEndcaps - Well-Known Values
// -------------------------------------------------------------------------- //

public extension SequenceEnclosureEndcaps {

  /// Enclosure like `| ... | `
  static let singleBar: SequenceEnclosureEndcaps = SequenceEnclosureEndcaps(
    initial: "|",
    terminal: "|"
  )

  /// Enclosure like `|| ... ||`
  static let doubleBar: SequenceEnclosureEndcaps = SequenceEnclosureEndcaps(
    initial: "||",
    terminal: "||"
  )

  /// Enclosure like `( ... )`
  static let parentheses: SequenceEnclosureEndcaps = SequenceEnclosureEndcaps(
    initial: "(",
    terminal: ")"
  )

  /// Enclosure like `(| ... |)`
  static let barredParentheses: SequenceEnclosureEndcaps = SequenceEnclosureEndcaps(
    initial: "(|",
    terminal: "|)"
  )

  /// Enclosure like `[ ... ]`
  static let squareBrackets: SequenceEnclosureEndcaps = SequenceEnclosureEndcaps(
    initial: "[",
    terminal: "]"
  )

  /// Enclosure like `[| ... |]`
  static let barredSquareBrackets: SequenceEnclosureEndcaps = SequenceEnclosureEndcaps(
    initial: "[|",
    terminal: "|]"
  )

  /// Enclosure like `{ ... }`
  static let squigglyBrackets: SequenceEnclosureEndcaps = SequenceEnclosureEndcaps(
    initial: "{",
    terminal: "}"
  )

  /// Enclosure like `{| ... |}`
  static let barredSquigglyBrackets: SequenceEnclosureEndcaps = SequenceEnclosureEndcaps(
    initial: "{|",
    terminal: "|}"
  )

  /// Enclosure like `< ... >`
  static let angleBrackets: SequenceEnclosureEndcaps = SequenceEnclosureEndcaps(
    initial: "<",
    terminal: ">"
  )
  
  /// Enclosure like `<| ... |>`
  static let braket: SequenceEnclosureEndcaps = SequenceEnclosureEndcaps(
    initial: "<|",
    terminal: "|>"
  )
  
}

// -------------------------------------------------------------------------- //
// MARK: SequenceEnclosureEndcaps - Equatable
// -------------------------------------------------------------------------- //

extension SequenceEnclosureEndcaps : Equatable {
  
  @inlinable
  public static func ==(
    lhs: SequenceEnclosureEndcaps,
    rhs: SequenceEnclosureEndcaps) -> Bool {
    guard
      lhs.initial == rhs.initial,
      lhs.terminal == rhs.terminal else {
        return false
    }
    return true
  }

}

// -------------------------------------------------------------------------- //
// MARK: SequenceEnclosureEndcaps - Hashable
// -------------------------------------------------------------------------- //

extension SequenceEnclosureEndcaps : Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.initial.hash(into: &hasher)
    self.terminal.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SequenceEnclosureEndcaps - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension SequenceEnclosureEndcaps : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "\(self.initial) ... \(self.terminal)"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SequenceEnclosureEndcaps - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension SequenceEnclosureEndcaps : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "SequenceEnclosureEndcaps(initial: \"\(self.initial)\", terminal: \"\(self.terminal)\")"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SequenceEnclosureEndcaps - Codable
// -------------------------------------------------------------------------- //

extension SequenceEnclosureEndcaps : Codable {
  
  // synthesized ok
  
}

// -------------------------------------------------------------------------- //
// MARK: SequenceEnclosureEndcaps - ExpressibleByArrayLiteral
// -------------------------------------------------------------------------- //

extension SequenceEnclosureEndcaps : ExpressibleByArrayLiteral {
  
  public typealias ArrayLiteralElement = String
  
  @inlinable
  public init(arrayLiteral elements: ArrayLiteralElement...) {
    guard elements.count == 2 else {
      fatalError("Improper `SequenceEnclosureEndcaps` array literal \(elements.debugDescription)!")
    }
    self.init(
      initial: elements[0],
      terminal: elements[1]
    )
  }
  
}

