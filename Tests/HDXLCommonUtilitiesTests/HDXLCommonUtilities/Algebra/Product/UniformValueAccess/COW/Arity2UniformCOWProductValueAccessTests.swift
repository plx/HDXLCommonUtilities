//
//  Arity2UniformCOWProductValueAccessTests.swift
//

import Foundation
import XCTest
@testable import HDXLCommonUtilities
@testable import HDXLTestingUtilities

class Arity2UniformCOWProductValueAccessTests: XCTestCase {
  
  typealias P = UniformCOWProduct2<Int>
  
  let arity: Int = P.arity
  lazy var indices: Range<Int> = 0..<self.arity
  let positions: [P.ArityPosition] = P.ArityPosition.allCases
  
  let standardProbe: P = P(0,1)
  let allZero: P = P(bySplatting: 0)
  
  func testSetup() {
    XCTAssertEqual(
      self.indices.count,
      self.positions.count
    )
  }
  
  func testUniformValueGettersOnAllZeroProbe() {
    let probe = self.allZero
    for index in self.indices {
      XCTAssertEqual(
        0,
        probe.uniformValue(at: index)
      )
      XCTAssertEqual(
        0,
        probe[index]
      )
    }
    for (index,position) in zip(self.indices,self.positions) {
      XCTAssertEqual(
        0,
        probe.uniformValue(at: position)
      )
      XCTAssertEqual(
        0,
        probe[position]
      )
      XCTAssertEqual(
        probe[index],
        probe.uniformValue(at: position)
      )
      XCTAssertEqual(
        probe[index],
        probe[position]
      )
    }
  }
  
  func testUniformValueGettersOnStandardProbe() {
    let probe = self.standardProbe
    for index in self.indices {
      XCTAssertEqual(
        index,
        probe.uniformValue(at: index)
      )
      XCTAssertEqual(
        index,
        probe[index]
      )
    }
    for (index,position) in zip(self.indices,self.positions) {
      XCTAssertEqual(
        index,
        probe.uniformValue(at: position)
      )
      XCTAssertEqual(
        index,
        probe[position]
      )
      XCTAssertEqual(
        probe[index],
        probe.uniformValue(at: position)
      )
      XCTAssertEqual(
        probe[index],
        probe[position]
      )
    }
  }

  func testUniformValueSettersByIntegerIndex() {
    self.haltingOnFirstError {
      var probe = P(bySplatting: self.arity)
      for index in self.indices {
        
        // pre-update validation (yes, redundant; no, don't care):
        for i in self.indices {
          if i < index {
            XCTAssertEqual(
              i,
              probe.uniformValue(at: i)
            )
          } else {
            XCTAssertEqual(
              self.arity,
              probe.uniformValue(at: i)
            )
          }
        }
        
        probe.setUniformValue(
          index,
          at: index
        )
        XCTAssertEqual(
          index,
          probe.uniformValue(at: index)
        )

        // post-update validation (yes, redundant; no, don't care):
        for i in self.indices {
          if i <= index {
            XCTAssertEqual(
              i,
              probe.uniformValue(at: i)
            )
          } else {
            XCTAssertEqual(
              self.arity,
              probe.uniformValue(at: i)
            )
          }
        }

      }
      
      XCTAssertEqual(
        probe,
        self.standardProbe
      )
      
    }
  }

  func testUniformValueSettersByArityPosition() {
    self.haltingOnFirstError {
      var probe = P(bySplatting: self.arity)
      for (index,position) in zip(self.indices,self.positions) {
        
        // pre-update validation (yes, redundant; no, don't care):
        for (i,p) in zip(self.indices,self.positions) {
          if p < position {
            XCTAssertEqual(
              i,
              probe.uniformValue(at: p)
            )
          } else {
            XCTAssertEqual(
              self.arity,
              probe.uniformValue(at: p)
            )
          }
        }
        
        probe.setUniformValue(
          index,
          at: position
        )
        XCTAssertEqual(
          index,
          probe.uniformValue(at: position)
        )

        // post-update validation (yes, redundant; no, don't care):
        for (i,p) in zip(self.indices,self.positions) {
          if p <= position {
            XCTAssertEqual(
              i,
              probe.uniformValue(at: p)
            )
          } else {
            XCTAssertEqual(
              self.arity,
              probe.uniformValue(at: p)
            )
          }
        }

      }
      
      XCTAssertEqual(
        probe,
        self.standardProbe
      )
      
    }
  }
  
  func testLeftwardPushes() {
    self.haltingOnFirstError {
      var inPlaceProbe = self.standardProbe
      var outOfPlaceProbe = self.standardProbe
      XCTAssertEqual(
        inPlaceProbe,
        outOfPlaceProbe
      )
      for iteration in self.indices {
        XCTAssertEqual(
          inPlaceProbe,
          outOfPlaceProbe
        )
        XCTAssertEqual(
          iteration,
          inPlaceProbe.firstValue
        )
        XCTAssertEqual(
          iteration,
          outOfPlaceProbe.firstValue
        )
        XCTAssertNotEqual(
          iteration,
          inPlaceProbe.lastValue
        )
        XCTAssertNotEqual(
          iteration,
          outOfPlaceProbe.lastValue
        )
        inPlaceProbe.formLeftwardPush(byAppending: iteration)
        XCTAssertNotEqual(
          inPlaceProbe,
          outOfPlaceProbe
        )
        outOfPlaceProbe = outOfPlaceProbe.pushedLeftward(byAppending: iteration)
        XCTAssertEqual(
          inPlaceProbe,
          outOfPlaceProbe
        )
        XCTAssertNotEqual(
          iteration,
          inPlaceProbe.firstValue
        )
        XCTAssertNotEqual(
          iteration,
          outOfPlaceProbe.firstValue
        )
        XCTAssertEqual(
          iteration,
          inPlaceProbe.lastValue
        )
        XCTAssertEqual(
          iteration,
          outOfPlaceProbe.lastValue
        )
        for i in self.indices.dropLast() {
          XCTAssertNotEqual(
            iteration,
            inPlaceProbe.uniformValue(at: i)
          )
          XCTAssertNotEqual(
            iteration,
            outOfPlaceProbe.uniformValue(at: i)
          )
        }
      }
      XCTAssertEqual(
        inPlaceProbe,
        outOfPlaceProbe
      )
      XCTAssertEqual(
        inPlaceProbe,
        self.standardProbe
      )
      XCTAssertEqual(
        outOfPlaceProbe,
        self.standardProbe
      )
    }
  }

  func testRightwardPushes() {
    self.haltingOnFirstError {
      var inPlaceProbe = self.standardProbe
      var outOfPlaceProbe = self.standardProbe
      XCTAssertEqual(
        inPlaceProbe,
        outOfPlaceProbe
      )
      for (iteration,target) in zip(self.indices,self.indices.reversed()) {
        XCTAssertEqual(
          iteration,
          (self.arity - (1 + target))
        )
        XCTAssertEqual(
          inPlaceProbe,
          outOfPlaceProbe
        )
        XCTAssertNotEqual(
          target,
          inPlaceProbe.firstValue
        )
        XCTAssertNotEqual(
          target,
          outOfPlaceProbe.firstValue
        )
        XCTAssertEqual(
          target,
          inPlaceProbe.lastValue
        )
        XCTAssertEqual(
          target,
          outOfPlaceProbe.lastValue
        )
        inPlaceProbe.formRightwardPush(byPrepending: target)
        XCTAssertNotEqual(
          inPlaceProbe,
          outOfPlaceProbe
        )
        outOfPlaceProbe = outOfPlaceProbe.pushedRightward(byPrepending: target)
        XCTAssertEqual(
          inPlaceProbe,
          outOfPlaceProbe
        )
        XCTAssertEqual(
          target,
          inPlaceProbe.firstValue
        )
        XCTAssertEqual(
          target,
          outOfPlaceProbe.firstValue
        )
        XCTAssertNotEqual(
          target,
          inPlaceProbe.lastValue
        )
        XCTAssertNotEqual(
          target,
          outOfPlaceProbe.lastValue
        )
        for i in self.indices.dropFirst() {
          XCTAssertNotEqual(
            target,
            inPlaceProbe.uniformValue(at: i)
          )
          XCTAssertNotEqual(
            target,
            outOfPlaceProbe.uniformValue(at: i)
          )
        }
      }
      XCTAssertEqual(
        inPlaceProbe,
        outOfPlaceProbe
      )
    }
  }

}

