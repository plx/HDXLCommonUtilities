//
//  Validatable+Dictionary.swift
//  
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Validatable - Dictionary - Keys
// -------------------------------------------------------------------------- //

public extension Dictionary {
  
  @inlinable
  var allKeysAreValidOrIndifferent: Bool {
    get {
      return self.keys.allElementsAreValidOrIndifferent
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Validatable - Dictionary - Validatable Keys
// -------------------------------------------------------------------------- //

public extension Dictionary where Key:Validatable {
  
  /// `true` iff `self` is empty *or* all *keys* are valid.
  @inlinable
  var allKeysAreValid: Bool {
    get {
      return self.keys.allElementsAreValid
    }
  }
  
  @inlinable
  var allKeysAreValidOrIndifferent: Bool {
    get {
      // TODO: selectable *probable API misuse* warning.
      return self.allKeysAreValid
    }
  }
}

// -------------------------------------------------------------------------- //
// MARK: Validatable - Dictionary - Values
// -------------------------------------------------------------------------- //

public extension Dictionary {

  @inlinable
  var allValuesAreValidOrIndifferent: Bool {
    get {
      return self.values.allElementsAreValidOrIndifferent
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Validatable - Dictionary - Validatable Values
// -------------------------------------------------------------------------- //

public extension Dictionary where Value:Validatable {
  
  /// `true` iff `self` is empty *or* all *values* are valid.
  @inlinable
  var allValuesAreValid: Bool {
    get {
      return self.values.allElementsAreValid
    }
  }
  
  @inlinable
  var allValuesAreValidOrIndifferent: Bool {
    get {
      // TODO: selectable *probable API misuse* warning.
      return self.values.allElementsAreValid
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Validatable - Dictionary - Entries
// -------------------------------------------------------------------------- //

public extension Dictionary {
  
  @inlinable
  var allEntriesAreValidOrIndifferent: Bool {
    get {
      // TODO: again, consider micro-benchmarking against manual loop.
      return self.allSatisfy() {
        (key,value) -> Bool
        in
        isValidOrIndifferent(key) && isValidOrIndifferent(value)
      }
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: Validatable - Dictionary - Entries w. Validatable Keys
// -------------------------------------------------------------------------- //

public extension Dictionary where Key:Validatable {
  
  @inlinable
  var allEntriesAreValidOrIndifferent: Bool {
    get {
      // TODO: again, consider micro-benchmarking against manual loop.
      return self.allSatisfy() {
        (key,value) -> Bool
        in
        key.isValid && isValidOrIndifferent(value)
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Validatable - Dictionary - Entries w. Validatable Values
// -------------------------------------------------------------------------- //

public extension Dictionary where Value:Validatable {
  
  @inlinable
  var allEntriesAreValidOrIndifferent: Bool {
    get {
      // TODO: again, consider micro-benchmarking against manual loop.
      return self.allSatisfy() {
        (key,value) -> Bool
        in
        isValidOrIndifferent(key) && value.isValid
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Validatable - Dictionary - Validatable Entries
// -------------------------------------------------------------------------- //

public extension Dictionary where Key:Validatable, Value:Validatable {
  
  /// `true` iff `self` is empty *or* all *keys* and *values* are valid.
  @inlinable
  var allEntriesAreValid: Bool {
    get {
      // TODO: again, consider micro-benchmarking against manual loop.
      return self.allSatisfy() {
        (key,value) -> Bool
        in
        key.isValid && value.isValid
      }
    }
  }
  
  @inlinable
  var allEntriesAreValidOrIndifferent: Bool {
    get {
      // TODO: selectable *probable API misuse* warning.
      return self.allEntriesAreValid
    }
  }
  
}
