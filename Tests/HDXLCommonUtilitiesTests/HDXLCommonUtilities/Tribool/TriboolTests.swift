//
//  TriboolTests.swift
//

import XCTest
@testable import HDXLCommonUtilities

class TriboolTests: XCTestCase {
  
  func testTriboolCaseIterable() {
    
    XCTAssertEqual(
      3,
      Tribool.allCases.count
    )
    
    XCTAssertTrue(
      Tribool.allCases.contains(Tribool.yes)
    )
    XCTAssertTrue(
      Tribool.allCases.contains(Tribool.indefinite)
    )
    XCTAssertTrue(
      Tribool.allCases.contains(Tribool.no)
    )
    
  }

  func testEquality() {
    
    for (xIndex,x) in Tribool.allCases.enumerated() {
      for (yIndex,y) in Tribool.allCases.enumerated() {
        XCTAssertEqual(
          xIndex == yIndex,
          x == y
        )
        XCTAssertEqual(
          xIndex != yIndex,
          x != y
        )
      }
    }
    
  }
  
  func testTriboolEquality() {
    
    // .yes, _
    XCTAssertEqual(
      (Tribool.yes ?==? Tribool.yes),
      .yes
    )

    XCTAssertEqual(
      (Tribool.yes ?==? Tribool.indefinite),
      .indefinite
    )

    XCTAssertEqual(
      (Tribool.yes ?==? Tribool.no),
      .no
    )

    // .indefinite, _
    XCTAssertEqual(
      (Tribool.indefinite ?==? Tribool.yes),
      .indefinite
    )
    
    XCTAssertEqual(
      (Tribool.indefinite ?==? Tribool.indefinite),
      .indefinite
    )
    
    XCTAssertEqual(
      (Tribool.indefinite ?==? Tribool.no),
      .indefinite
    )

    // .no, _
    XCTAssertEqual(
      (Tribool.no ?==? Tribool.yes),
      .no
    )
    
    XCTAssertEqual(
      (Tribool.no ?==? Tribool.indefinite),
      .indefinite
    )
    
    XCTAssertEqual(
      (Tribool.no ?==? Tribool.no),
      .yes
    )

  }
  
  func testTriboolInequality() {
    
    // .yes, _
    XCTAssertEqual(
      (Tribool.yes ?!=? Tribool.yes),
      .no
    )
    
    XCTAssertEqual(
      (Tribool.yes ?!=? Tribool.indefinite),
      .indefinite
    )
    
    XCTAssertEqual(
      (Tribool.yes ?!=? Tribool.no),
      .yes
    )
    
    // .indefinite, _
    XCTAssertEqual(
      (Tribool.indefinite ?!=? Tribool.yes),
      .indefinite
    )
    
    XCTAssertEqual(
      (Tribool.indefinite ?!=? Tribool.indefinite),
      .indefinite
    )
    
    XCTAssertEqual(
      (Tribool.indefinite ?!=? Tribool.no),
      .indefinite
    )
    
    // .no, _
    XCTAssertEqual(
      (Tribool.no ?!=? Tribool.yes),
      .yes
    )
    
    XCTAssertEqual(
      (Tribool.no ?!=? Tribool.indefinite),
      .indefinite
    )
    
    XCTAssertEqual(
      (Tribool.no ?!=? Tribool.no),
      .no
    )
    
  }
  
  func testTriboolAnd() {
    
    // .yes, _
    XCTAssertEqual(
      (Tribool.yes ?&&? Tribool.yes),
      .yes
    )
    
    XCTAssertEqual(
      (Tribool.yes ?&&? Tribool.indefinite),
      .indefinite
    )
    
    XCTAssertEqual(
      (Tribool.yes ?&&? Tribool.no),
      .no
    )
    
    // .indefinite, _
    XCTAssertEqual(
      (Tribool.indefinite ?&&? Tribool.yes),
      .indefinite
    )
    
    XCTAssertEqual(
      (Tribool.indefinite ?&&? Tribool.indefinite),
      .indefinite
    )
    
    XCTAssertEqual(
      (Tribool.indefinite ?&&? Tribool.no),
      .no
    )
    
    // .no, _
    XCTAssertEqual(
      (Tribool.no ?&&? Tribool.yes),
      .no
    )
    
    XCTAssertEqual(
      (Tribool.no ?&&? Tribool.indefinite),
      .no
    )
    
    XCTAssertEqual(
      (Tribool.no ?&&? Tribool.no),
      .no
    )
    
  }

  func testTriboolOr() {
    
    // .yes, _
    XCTAssertEqual(
      (Tribool.yes ?||? Tribool.yes),
      .yes
    )
    
    XCTAssertEqual(
      (Tribool.yes ?||? Tribool.indefinite),
      .yes
    )
    
    XCTAssertEqual(
      (Tribool.yes ?||? Tribool.no),
      .yes
    )
    
    // .indefinite, _
    XCTAssertEqual(
      (Tribool.indefinite ?||? Tribool.yes),
      .yes
    )
    
    XCTAssertEqual(
      (Tribool.indefinite ?||? Tribool.indefinite),
      .indefinite
    )
    
    XCTAssertEqual(
      (Tribool.indefinite ?||? Tribool.no),
      .indefinite
    )
    
    // .no, _
    XCTAssertEqual(
      (Tribool.no ?||? Tribool.yes),
      .yes
    )
    
    XCTAssertEqual(
      (Tribool.no ?||? Tribool.indefinite),
      .indefinite
    )
    
    XCTAssertEqual(
      (Tribool.no ?||? Tribool.no),
      .no
    )
    
  }

  func testTriboolNegation() {
    XCTAssertEqual(
      Tribool.yes.negated(),
      Tribool.no
    )
    XCTAssertEqual(
      Tribool.indefinite.negated(),
      Tribool.indefinite
    )
    XCTAssertEqual(
      Tribool.no.negated(),
      Tribool.yes
    )
  }
  

  func testTriboolAndAndEqualEquivalence() {
    for reference in Tribool.allCases {
      for other in Tribool.allCases {
        let andResult = reference ?&&? other
        var andEqualResult = reference
        andEqualResult ?&&?= other
        XCTAssertEqual(
          andResult,
          andEqualResult
        )
      }
    }
  }
  
  func testTriboolOrOrEqualEquivalence() {
    for reference in Tribool.allCases {
      for other in Tribool.allCases {
        let orResult = reference ?||? other
        var orEqualResult = reference
        orEqualResult ?||?= other
        XCTAssertEqual(
          orResult,
          orEqualResult
        )
      }
    }
  }

  func testTriboolNegationFormNegationEquivalence() {
    for reference in Tribool.allCases {
      let negationResult = reference.negated()
      var formNegationResult = reference
      formNegationResult.formNegation()
      XCTAssertEqual(
        negationResult,
        formNegationResult
      )
    }
  }
  
  func testTriboolFromComponents() {
    
    XCTAssertEqual(
      Tribool.yes,
      Tribool(
        boolValue: true,
        definite: true
      )
    )
    XCTAssertEqual(
      Tribool.indefinite,
      Tribool(
        boolValue: true,
        definite: false
      )
    )

    XCTAssertEqual(
      Tribool.no,
      Tribool(
        boolValue: false,
        definite: true
      )
    )
    XCTAssertEqual(
      Tribool.indefinite,
      Tribool(
        boolValue: false,
        definite: false
      )
    )

  }
  
  func testTrueness() {
    
    XCTAssertTrue(
      Tribool.yes.isDefinitelyTrue
    )
    XCTAssertFalse(
      Tribool.indefinite.isDefinitelyTrue
    )
    XCTAssertFalse(
      Tribool.no.isDefinitelyTrue
    )

    XCTAssertFalse(
      Tribool.yes.isNotTrue
    )
    XCTAssertTrue(
      Tribool.indefinite.isNotTrue
    )
    XCTAssertTrue(
      Tribool.no.isNotTrue
    )

  }

  func testFalseness() {
    
    XCTAssertFalse(
      Tribool.yes.isDefinitelyFalse
    )
    XCTAssertFalse(
      Tribool.indefinite.isDefinitelyFalse
    )
    XCTAssertTrue(
      Tribool.no.isDefinitelyFalse
    )
    
    XCTAssertTrue(
      Tribool.yes.isNotFalse
    )
    XCTAssertTrue(
      Tribool.indefinite.isNotFalse
    )
    XCTAssertFalse(
      Tribool.no.isNotFalse
    )
    
  }

  func testDefiniteness() {
    
    for probe in Tribool.allCases {
      XCTAssertNotEqual(
        probe.isDefinite,
        probe.isIndefinite
      )
    }
    
    XCTAssertTrue(
      Tribool.yes.isDefinite
    )
    XCTAssertFalse(
      Tribool.indefinite.isDefinite
    )
    XCTAssertTrue(
      Tribool.no.isDefinite
    )

    XCTAssertFalse(
      Tribool.yes.isIndefinite
    )
    XCTAssertTrue(
      Tribool.indefinite.isIndefinite
    )
    XCTAssertFalse(
      Tribool.no.isIndefinite
    )

  }
  
  func testTriboolFromBool() {
    XCTAssertEqual(
      Tribool.yes,
      Tribool(true)
    )
    XCTAssertEqual(
      Tribool.no,
      Tribool(false)
    )
  }

  func testTriboolFromOptionalBool() {
    let yes: Bool? = true
    let indefinite: Bool? = nil
    let no: Bool? = false
    XCTAssertEqual(
      Tribool.yes,
      Tribool(yes)
    )
    XCTAssertEqual(
      Tribool.indefinite,
      Tribool(indefinite)
    )
    XCTAssertEqual(
      Tribool.no,
      Tribool(no)
    )
  }

  func testTriboolBoolValue() {
    
    XCTAssertEqual(
      Tribool.yes.boolValue,
      true
    )
    XCTAssertEqual(
      Tribool.indefinite.boolValue,
      nil
    )
    XCTAssertEqual(
      Tribool.no.boolValue,
      false
    )

  }

  func testSynonyms() {
    
    XCTAssertEqual(
      Tribool.yes,
      Tribool.true
    )
    
    XCTAssertEqual(
      Tribool.no,
      Tribool.false
    )

    XCTAssertEqual(
      Tribool.indefinite,
      Tribool.maybe
    )

    XCTAssertEqual(
      Tribool.indefinite,
      Tribool.unknown
    )
    
  }

}
