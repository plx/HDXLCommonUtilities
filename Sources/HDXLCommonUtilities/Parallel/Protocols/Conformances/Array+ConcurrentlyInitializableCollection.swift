//
//  Array+ConcurrentlyInitializableCollection.swift
//

import Foundation

extension Array : ConcurrentlyInitializableCollection {

  @inlinable
  public init<Source:ConcurrentlyVisitableCollection>(
    concurrentlyFromElements source: Source,
    using transformation: (Source.Element) -> Element) {
    guard !source.isEmpty else {
      self.init()
      return
    }
    let count = source.count
    self.init(unsafeUninitializedCapacity: count) {
      (buffer: inout UnsafeMutableBufferPointer<Element>, initializationCount: inout Int) -> Void
      in
      guard let baseAddress = buffer.baseAddress else {
        fatalError("Couldn't get a base address from the buffer inside \(#function), attempting to use with \(String(reflecting: source))!")
      }
      source.concurrentEnumeratedVisit() {
        (index: Int, element: Source.Element) -> Void
        in
        baseAddress[index] = transformation(
          element
        )
      }
    }
  }

  @inlinable
  public init<Source:ConcurrentlyVisitableCollection>(
    concurrentlyFromEnumeratedElements source: Source,
    using transformation: (Int,Source.Element) -> Element) {
    guard !source.isEmpty else {
      self.init()
      return
    }
    let count = source.count
    self.init(unsafeUninitializedCapacity: count) {
      (buffer: inout UnsafeMutableBufferPointer<Element>, initializationCount: inout Int) -> Void
      in
      guard let baseAddress = buffer.baseAddress else {
        fatalError("Couldn't get a base address from the buffer inside \(#function), attempting to use with \(String(reflecting: source))!")
      }
      source.concurrentEnumeratedVisit() {
        (index: Int, element: Source.Element) -> Void
        in
        baseAddress[index] = transformation(
          index,
          element
        )
      }
    }
  }

  @inlinable
  public init<Source:ConcurrentlyVisitableCollection>(
    fromElements source: Source,
    concurrentlyWithStride stride: Int,
    using transformation: (Source.Element) -> Element) {
    guard !source.isEmpty else {
      self.init()
      return
    }
    let count = source.count
    self.init(unsafeUninitializedCapacity: count) {
      (buffer: inout UnsafeMutableBufferPointer<Element>, initializationCount: inout Int) -> Void
      in
      guard let baseAddress = buffer.baseAddress else {
        fatalError("Couldn't get a base address from the buffer inside \(#function), attempting to use with \(String(reflecting: source))!")
      }
      source.stridedConcurrentEnumeratedVisit(stride: stride) {
        (index: Int, element: Source.Element) -> Void
        in
        baseAddress[index] = transformation(
          element
        )
      }
    }
  }

  @inlinable
  public init<Source:ConcurrentlyVisitableCollection>(
    fromEnumeratedElements source: Source,
    concurrentlyWithStride stride: Int,
    using transformation: (Int,Source.Element) -> Element) {
    guard !source.isEmpty else {
      self.init()
      return
    }
    let count = source.count
    self.init(unsafeUninitializedCapacity: count) {
      (buffer: inout UnsafeMutableBufferPointer<Element>, initializationCount: inout Int) -> Void
      in
      guard let baseAddress = buffer.baseAddress else {
        fatalError("Couldn't get a base address from the buffer inside \(#function), attempting to use with \(String(reflecting: source))!")
      }
      source.stridedConcurrentEnumeratedVisit(stride: stride) {
        (index: Int, element: Source.Element) -> Void
        in
        baseAddress[index] = transformation(
          index,
          element
        )
      }
    }
  }
  
}
