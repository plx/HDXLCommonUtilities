//
//  DirectorySearchParameters.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: DirectorySearchParameters - Definition
// -------------------------------------------------------------------------- //

/// Type that packages the parameters used to ask `FileManager` to (attempt to)
/// locate one of the "well-known, standard" directories (like `Documents`, etc.).
///
/// This exists b/c I don't like having one weird multi-payload case in my `enum`s.
public struct DirectorySearchParameters {
  
  /// Shorthand for the target directory.
  public typealias SearchPathDirectory = FileManager.SearchPathDirectory
  
  /// Shorthand for the domain mask.
  public typealias SearchPathDomainMask = FileManager.SearchPathDomainMask
  
  /// The directory for-which we'll be searching.
  public var directory: SearchPathDirectory
  
  /// A mask of "domains" within-which we'll search for `directory`.
  public var mask: SearchPathDomainMask
  
  /// Componentwise initializer for `DirectorySearchParameters.
  ///
  /// - parameter directory: The directory for-which we'll be searching.
  /// - parameter mask: A mask of "domains" within-which we'll search for `directory`.
  ///
  /// - note: `mask` *cannot be empty*!.
  ///
  @inlinable
  public init(
    directory: SearchPathDirectory,
    mask: SearchPathDomainMask) {
    self.directory = directory
    self.mask = mask
  }
  
}

extension DirectorySearchParameters : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      return !self.mask.isEmpty
    }
  }
  
}

extension DirectorySearchParameters : Equatable {
  
  @inlinable
  public static func ==(
    lhs: DirectorySearchParameters,
    rhs: DirectorySearchParameters) -> Bool {
    guard
      lhs.directory.rawValue == rhs.directory.rawValue,
      lhs.mask.rawValue == rhs.mask.rawValue else {
        return false
    }
    return true
  }

}

extension DirectorySearchParameters : Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.directory.rawValue.hash(into: &hasher)
    self.mask.rawValue.hash(into: &hasher)
  }
  
}

extension DirectorySearchParameters : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "searching-for \(self.directory.readableStringification), w/mask: \(self.mask.readableStringification)"
    }
  }
  
}

extension DirectorySearchParameters : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "DirectorySearchParameters(directory: \(self.directory.debugStringification), mask: \(self.mask.debugStringification))"
    }
  }
  
}

extension DirectorySearchParameters : Codable {
  
  public enum CodingKeys : String, CodingKey {
  
    case directory = "directory"
    case mask = "mask"
    
    @inlinable
    public var intValue: Int? {
      get {
        switch self {
        case .directory:
          return 0
        case .mask:
          return 1
        }
      }
    }
    
    @inlinable
    public init?(intValue: Int) {
      switch intValue {
      case 0:
        self = .directory
      case 1:
        self = .mask
      default:
        return nil
      }
    }
  
  }
  
  @inlinable
  public func encode(to encoder: Encoder) throws {
    var container = encoder.container(
      keyedBy: CodingKeys.self
    )
    try container.encode(
      self.directory.rawValue,
      forKey: .directory
    )
    try container.encode(
      self.mask.rawValue,
      forKey: .mask
    )
  }
  
  @inlinable
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(
      keyedBy: CodingKeys.self
    )
    let rawDirectory = try container.decode(
      SearchPathDirectory.RawValue.self,
      forKey: .directory
    )
    let rawMask = try container.decode(
      SearchPathDomainMask.RawValue.self,
      forKey: .mask
    )
    guard let directory = SearchPathDirectory(rawValue: rawDirectory) else {
      throw DecodingError.dataCorruptedError(
        forKey: .directory,
        in: container,
        debugDescription: "Decoded raw value \(rawDirectory) for `NSFileManager.SearchPathDomain`, but it doesn't correspond to any known search-path directory."
      )
    }
    self.directory = directory
    self.mask = SearchPathDomainMask(rawValue: rawMask)
    // ^ the `mask` is an `OptionSet` and thus not too picky about what it wants.
  }
  
}
