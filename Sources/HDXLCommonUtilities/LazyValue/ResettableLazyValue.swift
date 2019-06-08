//
//  ResettableLazyValue.swift
//

import Foundation


public struct ResettableLazyValue<Value> {
  
  public typealias ValueSource = () -> Value
  
  @usableFromInline
  internal typealias Storage = ResettableLazyValueStorage<Value>
  
  @usableFromInline
  internal let storage: Storage
  
  @usableFromInline
  internal init(storage: Storage) {
    self.storage = storage
  }
  
  @inlinable
  public init(value: @autoclosure @escaping ValueSource) {
    self.init(
      storage: Storage(
        value: value()
      )
    )
  }
  
  @inlinable
  public var value: Value {
    get {
      return self.storage.obtainValue()
    }
  }
  
  @inlinable
  public func reset() {
    self.storage.resetValue()
  }
  
}

@usableFromInline
internal final class ResettableLazyValueStorage<Value> {
  
  @usableFromInline
  internal typealias ValueSource = () -> Value
  
  @usableFromInline
  internal let valueSource: ValueSource
  
  @usableFromInline
  internal fileprivate(set) var value: Value? = nil
  
  @usableFromInline
  internal func resetValue() {
    self.value = nil
  }
  
  @usableFromInline
  internal func obtainValue() -> Value {
    switch self.value {
    case .some(let value):
      return value
    case .none:
      let value = self.valueSource()
      self.value = .some(value)
      return value
    }
  }
  
  @usableFromInline
  internal required init(value: @autoclosure @escaping  ValueSource) {
    self.valueSource = value
  }
  
}
