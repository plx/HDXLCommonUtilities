//
//  DirectoryOrigin.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: DirectoryOrigin - Definition
// -------------------------------------------------------------------------- //

/// `DirectoryOrigin` models the concept of a possibly-dynamically-determined
/// "base directory" relative-to-which we position our own directories.
///
/// This emerges from an interest in doing a low-key, informal form of dependency
/// injection specifically for "where are my files?": the *logic* for finding various
/// "standard" Apple-platform directories can be messy--and different flavors of
/// standard directories need different code--and this is an attempt to abstract
/// that away for the cases I specifically care about.
/// Apple-platform direc
public enum DirectoryOrigin {
  
  /// Case for when the base URL should be an explicitly-supplied directory.
  case explicit(URL)
  
  /// Case for when the base URL should be located via `FileManager`'s directory-search parameters.
  case search(DirectorySearchParameters)
  
  /// Case for when the base URL should be the (root of) a presumably-shared `appGroup`.
  case appGroup(String)
  
  /// Case for when the base URL should be a (dynamically-generated) temporary directory.
  case temporary
  
}

// -------------------------------------------------------------------------- //
// MARK: DirectoryOrigin - Support
// -------------------------------------------------------------------------- //

public extension DirectoryOrigin {
  
  /// Dynamically-determine the origin directory.
  ///
  /// - note:
  @inlinable
  func generateOriginURL(fileManager: FileManager = .default) -> URL {
    switch self {
    case .explicit(let url):
      return url
    case .search(let parameters):
      // TODO: make robust?
      do {
        return try fileManager.existingDirectoryURL(
          forSearchParameters: parameters
        )
      }
      catch let e {
        preconditionFailure("Couldn't find anything for `parameters` \(String(reflecting: parameters))! Error: \(String(reflecting: e))")
      }
    case .appGroup(let identifier):
      guard let containerURL = fileManager.url(forUbiquityContainerIdentifier: identifier) else {
        preconditionFailure("Couldn't get a `containerURL` from `FileManager.default.url(forUbiquityContainerIdentifier: \(identifier))`!")
      }
      return containerURL
    case .temporary:
      return fileManager.temporaryDirectory
    }
  }
  
  @inlinable
  var directoryOriginType: DirectoryOriginType {
    get {
      switch self {
      case .explicit(_):
        return .explicit
      case .search(_):
        return .search
      case .appGroup(_):
        return .appGroup
      case .temporary:
        return .temporary
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: DirectoryOrigin - Validatable
// -------------------------------------------------------------------------- //

extension DirectoryOrigin : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      switch self {
      case .explicit(let url):
        return url.isFileURL && url.hasDirectoryPath
      case .search(let parameters):
        return parameters.isValid
      case .appGroup(let identifier):
        // can't do better than this, I think, at least not w/out trying to parse the entitlements just to check for it
        return !identifier.isEmpty
      case .temporary:
        return true
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: DirectoryOrigin - Equatable
// -------------------------------------------------------------------------- //

extension DirectoryOrigin : Equatable {
  
  @inlinable
  public static func ==(
    lhs: DirectoryOrigin,
    rhs: DirectoryOrigin) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    switch (lhs, rhs) {
    case (.explicit(let l), .explicit(let r)):
      return l == r
    case (.search(let l), .search(let r)):
      return l == r
    case (.appGroup(let l), .appGroup(let r)):
      return l == r
    case (.temporary, .explicit):
      return true
    default:
      return false
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: DirectoryOrigin - Hashable
// -------------------------------------------------------------------------- //

extension DirectoryOrigin : Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.directoryOriginType.hash(into: &hasher)
    switch self {
    case .explicit(let url):
      url.hash(into: &hasher)
    case .search(let parameters):
      parameters.hash(into: &hasher)
    case .appGroup(let identifier):
      identifier.hash(into: &hasher)
    case .temporary:
      ();
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: DirectoryOrigin - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension DirectoryOrigin : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      switch self {
      case .explicit(let url):
        return ".explicit(\(url.description))"
      case .search(let parameters):
        return ".search(\(parameters.description))"
      case .appGroup(let identifier):
        return ".appGroup('\(identifier)')"
      case .temporary:
        return ".temporary"
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: DirectoryOrigin - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension DirectoryOrigin : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      switch self {
      case .explicit(let url):
        return "DirectoryOrigin.explicit(\(url.debugDescription))"
      case .search(let parameters):
        return "DirectoryOrigin.search(\(parameters.debugDescription))"
      case .appGroup(let identifier):
        return "DirectoryOrigin.appGroup('\(identifier)')"
      case .temporary:
        return "DirectoryOrigin.temporary"
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: DirectoryOrigin - Codable
// -------------------------------------------------------------------------- //

extension DirectoryOrigin : Codable {
  
  public enum CodingKeys : String, CodingKey {
  
    case type = "type"
    case value = "value"
    
    @inlinable
    public var intValue: Int {
      get {
        switch self {
        case .type:
          return 0
        case .value:
          return 1
        }
      }
    }
    
    @inlinable
    public init?(intValue: Int) {
      switch intValue {
      case 0:
        self = .type
      case 1:
        self = .value
      default:
        return nil
      }
    }
  
  }
  
  @inlinable
  public func encode(to encoder: Encoder) throws {
    var values = encoder.container(keyedBy: CodingKeys.self)
    try values.encode(
      self.directoryOriginType,
      forKey: .type
    )
    switch self {
    case .explicit(let url):
      try values.encode(
        url,
        forKey: .value
      )
    case .appGroup(let identifier):
      try values.encode(
        identifier,
        forKey: .value
      )
    case .search(let parameters):
      try values.encode(
        parameters,
        forKey: .value
      )
    case .temporary:
      ();
    }
  }
  
  @inlinable
  public init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    switch try values.decode(DirectoryOriginType.self, forKey: .type) {
    case .explicit:
      self = .explicit(
        try values.decode(
          URL.self,
          forKey: .value
        )
      )
    case .appGroup:
      self = .appGroup(
        try values.decode(
          String.self,
          forKey: .value
        )
      )
    case .search:
      self = .search(
        try values.decode(
          DirectorySearchParameters.self,
          forKey: .value
        )
      )
    case .temporary:
      self = .temporary
    }
  }
  
}
