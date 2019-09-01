//
//  Dictionary+ExtendedRemoval.swift
//

import Foundation

public extension Dictionary {
  
  /// Bulk-removes values for keys in `keys`, discardably-returning the count of values actually-removed.
  @inlinable
  @discardableResult
  mutating func removeValues<S:Sequence>(forKeys keys: S) -> Int
    where S.Element == Key {
    var removalCount = 0
    for key in keys {
      if let _ = self.removeValue(forKey: key) {
        removalCount += 1
      }
    }
    return removalCount
  }
  
  /// Bulk-remove all `(key,value)` entries for which `predicate(key,value) == true`;
  /// discardably-returns the removal count.
  @discardableResult
  mutating func removeEntriesSatisfying(predicate: (Key,Value) -> Bool) -> Int {
    return self.removeValues(
      forKeys: self.keysForEntriesSatisfying(predicate: predicate)
    )
  }
  
  /// Bulk-remove all `(key,value)` entries for which `predicate(key,value) == false`;
  /// discardably-returns the removal count.
  @discardableResult
  mutating func removeEntriesFailing(predicate: (Key,Value) -> Bool) -> Int {
    return self.removeValues(
      forKeys: self.keysForEntriesFailing(predicate: predicate)
    )
  }
  
  /// Bulk-remove all `(key,value)` entries for which `predicate(value) == true`;
  /// discardably-returns the removal count.
  @discardableResult
  mutating func removeEntriesForValuesSatisfying(predicate: (Value) -> Bool) -> Int {
    return self.removeValues(
      forKeys: self.keysForValuesSatisfying(predicate: predicate)
    )
  }

  /// Bulk-remove all `(key,value)` entries for which `predicate(value) == false`;
  /// discardably-returns the removal count.
  @discardableResult
  mutating func removeEntriesForValuesFailing(predicate: (Value) -> Bool) -> Int {
    return self.removeValues(
      forKeys: self.keysForValuesFailing(predicate: predicate)
    )
  }

  /// Bulk-remove all `(key,value)` entries for which `predicate(key) == true`;
  /// discardably-returns the removal count.
  @discardableResult
  mutating func removeEntriesForKeysSatisfying(predicate: (Key) -> Bool) -> Int {
    return self.removeValues(
      forKeys: self.keysSatisfying(predicate: predicate)
    )
  }
  
  /// Bulk-remove all `(key,value)` entries for which `predicate(key) == false`;
  /// discardably-returns the removal count.
  @discardableResult
  mutating func removeEntriesForKeysFailing(predicate: (Key) -> Bool) -> Int {
    return self.removeValues(
      forKeys: self.keysFailing(predicate: predicate)
    )
  }

}
