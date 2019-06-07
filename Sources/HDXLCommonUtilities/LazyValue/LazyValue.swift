//
//  LazyValue.swift
//

import Foundation

public struct LazyValue<Value> {

  public typealias ValueSource = () -> Value
  
  @usableFromInline
  internal typealias Storage = LazyValueStorage<Value>
  
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

}



@usableFromInline
internal final class LazyValueStorage<Value> {
  
  @usableFromInline
  internal typealias ValueSource = () -> Value
  
  @usableFromInline
  internal enum State {
    case pending(ValueSource)
    case acquired(Value)
  }
  
  @usableFromInline
  internal fileprivate(set) var state: State
  
  @usableFromInline
  internal func obtainValue() -> Value {
    switch self.state {
    case .pending(let source):
      let value = source()
      self.state = .acquired(value)
      return value
    case .acquired(let value):
      return value
    }
  }
  
  @usableFromInline
  internal required init(value: @autoclosure @escaping  ValueSource) {
    self.state = .pending(value)
  }
  
}
