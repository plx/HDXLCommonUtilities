//
//  DispatchSource+OptionSet.swift
//  
//
//  Created by prb on 11/9/20.
//

import Foundation
import Dispatch

public extension DispatchSourceUserDataOr {
  
  func or<T>(_ value: T)
    where
    T:OptionSet,
    T.RawValue: BinaryInteger & UnsignedInteger
  {
    if let data = UInt(exactly: value.rawValue) {
      self.or(data: data)
    }
  }

  func or<T>(_ value: T?)
    where
    T:OptionSet,
    T.RawValue: BinaryInteger & UnsignedInteger
  {
    if
      let value = value,
      let data = UInt(exactly: value.rawValue)
    {
      self.or(data: data)
    }
  }
  
  func data<T>(forInterpretation interpretation: T.Type) -> T
    where
    T:OptionSet,
    T.RawValue == UInt64 {
    guard let value = UInt64(exactly: self.data) else {
      preconditionFailure("Obtained non-`UInt64` representable `data` \(self.data) (attempted interpretation: \(String(reflecting: T.self))).")
    }
    return T(rawValue: value)
  }
  
  func setEventHandler<T>(
    interpretingDataAs dataType: T.Type,
    qos: DispatchQoS = .unspecified,
    flags: DispatchWorkItemFlags = [],
    handler: ((T) -> Void)?)
  where
  T:OptionSet,
  T.RawValue == UInt64 {
    switch handler {
    case .some(let work):
      self.setEventHandler(
        qos: qos,
        flags: flags) {
        [weak self]
        () -> Void
        in
        work(
          self?.data(forInterpretation: T.self) ?? []
        )
      }
    case .none:
      self.setEventHandler(
        qos: qos,
        flags: flags,
        handler: nil
      )
    }
  }

}
