//
//  FirstNonNilTests.swift
//

import XCTest
@testable import HDXLCommonUtilities

class FirstNonNilTests: XCTestCase {
  
  // ------------------------------------------------------------------------ //
  // MARK: Arity 2
  // ------------------------------------------------------------------------ //
  
  func testFirstNonNilArity2() {
    
    let a: Int? = 1
    let b: Int? = 2
    
    XCTAssertNil(
      firstNonNil(
        nil,
        nil
      )
    )
    
    XCTAssertEqual(
      1,
      firstNonNil(a, b)
    )
    XCTAssertEqual(
      1,
      firstNonNil(a, nil)
    )
    XCTAssertEqual(
      2,
      firstNonNil(nil, b)
    )
    
  }

  // ------------------------------------------------------------------------ //
  // MARK: Arity 3
  // ------------------------------------------------------------------------ //
  
  func testFirstNonNilArity3() {
    
    let a: Int? = 1
    let b: Int? = 2
    let c: Int? = 3
    
    XCTAssertNil(
      firstNonNil(
        nil,
        nil,
        nil
      )
    )
    
    XCTAssertEqual(
      1,
      firstNonNil(a, b, c)
    )
    XCTAssertEqual(
      2,
      firstNonNil(nil, b, c)
    )
    XCTAssertEqual(
      3,
      firstNonNil(nil, nil, c)
    )
    
    XCTAssertEqual(
      1,
      firstNonNil(a, nil, nil)
    )
    XCTAssertEqual(
      2,
      firstNonNil(nil, b, nil)
    )
    XCTAssertEqual(
      3,
      firstNonNil(nil, nil, c)
    )
    
  }

  // ------------------------------------------------------------------------ //
  // MARK: Arity 4
  // ------------------------------------------------------------------------ //
  
  func testFirstNonNilArity4() {
    
    let a: Int? = 1
    let b: Int? = 2
    let c: Int? = 3
    let d: Int? = 4
    
    XCTAssertNil(
      firstNonNil(
        nil,
        nil,
        nil,
        nil
      )
    )
    
    XCTAssertEqual(
      1,
      firstNonNil(a, b, c, d)
    )
    XCTAssertEqual(
      2,
      firstNonNil(nil, b, c, d)
    )
    XCTAssertEqual(
      3,
      firstNonNil(nil, nil, c, d)
    )
    XCTAssertEqual(
      4,
      firstNonNil(nil, nil, nil, d)
    )
    
    XCTAssertEqual(
      1,
      firstNonNil(a, nil, nil, nil)
    )
    XCTAssertEqual(
      2,
      firstNonNil(nil, b, nil, nil)
    )
    XCTAssertEqual(
      3,
      firstNonNil(nil, nil, c, nil)
    )
    XCTAssertEqual(
      4,
      firstNonNil(nil, nil, nil, d)
    )
    
  }

  // ------------------------------------------------------------------------ //
  // MARK: Arity 5
  // ------------------------------------------------------------------------ //
  
  func testFirstNonNilArity5() {
    
    let a: Int? = 1
    let b: Int? = 2
    let c: Int? = 3
    let d: Int? = 4
    let e: Int? = 5
    
    XCTAssertNil(
      firstNonNil(
        nil,
        nil,
        nil,
        nil,
        nil
      )
    )
    
    XCTAssertEqual(
      1,
      firstNonNil(a, b, c, d, e)
    )
    XCTAssertEqual(
      2,
      firstNonNil(nil, b, c, d, e)
    )
    XCTAssertEqual(
      3,
      firstNonNil(nil, nil, c, d, e)
    )
    XCTAssertEqual(
      4,
      firstNonNil(nil, nil, nil, d, e)
    )
    XCTAssertEqual(
      5,
      firstNonNil(nil, nil, nil, nil, e)
    )
    
    XCTAssertEqual(
      1,
      firstNonNil(a, nil, nil, nil, nil)
    )
    XCTAssertEqual(
      2,
      firstNonNil(nil, b, nil, nil, nil)
    )
    XCTAssertEqual(
      3,
      firstNonNil(nil, nil, c, nil, nil)
    )
    XCTAssertEqual(
      4,
      firstNonNil(nil, nil, nil, d, nil)
    )
    XCTAssertEqual(
      5,
      firstNonNil(nil, nil, nil, nil, e)
    )
    
  }

  // ------------------------------------------------------------------------ //
  // MARK: Arity 6
  // ------------------------------------------------------------------------ //
  
  func testFirstNonNilArity6() {
    
    let a: Int? = 1
    let b: Int? = 2
    let c: Int? = 3
    let d: Int? = 4
    let e: Int? = 5
    let f: Int? = 6
    
    XCTAssertNil(
      firstNonNil(
        nil,
        nil,
        nil,
        nil,
        nil,
        nil
      )
    )
    
    XCTAssertEqual(
      1,
      firstNonNil(a, b, c, d, e, f)
    )
    XCTAssertEqual(
      2,
      firstNonNil(nil, b, c, d, e, f)
    )
    XCTAssertEqual(
      3,
      firstNonNil(nil, nil, c, d, e, f)
    )
    XCTAssertEqual(
      4,
      firstNonNil(nil, nil, nil, d, e, f)
    )
    XCTAssertEqual(
      5,
      firstNonNil(nil, nil, nil, nil, e, f)
    )
    XCTAssertEqual(
      6,
      firstNonNil(nil, nil, nil, nil, nil, f)
    )
    
    XCTAssertEqual(
      1,
      firstNonNil(a, nil, nil, nil, nil, nil)
    )
    XCTAssertEqual(
      2,
      firstNonNil(nil, b, nil, nil, nil, nil)
    )
    XCTAssertEqual(
      3,
      firstNonNil(nil, nil, c, nil, nil, nil)
    )
    XCTAssertEqual(
      4,
      firstNonNil(nil, nil, nil, d, nil, nil)
    )
    XCTAssertEqual(
      5,
      firstNonNil(nil, nil, nil, nil, e, nil)
    )
    XCTAssertEqual(
      6,
      firstNonNil(nil, nil, nil, nil, nil, f)
    )
    
  }

  // ------------------------------------------------------------------------ //
  // MARK: Arity 7
  // ------------------------------------------------------------------------ //

  func testFirstNonNilArity7() {
    
    let a: Int? = 1
    let b: Int? = 2
    let c: Int? = 3
    let d: Int? = 4
    let e: Int? = 5
    let f: Int? = 6
    let g: Int? = 7
    
    XCTAssertNil(
      firstNonNil(
        nil,
        nil,
        nil,
        nil,
        nil,
        nil,
        nil
      )
    )
    
    XCTAssertEqual(
      1,
      firstNonNil(a, b, c, d, e, f, g)
    )
    XCTAssertEqual(
      2,
      firstNonNil(nil, b, c, d, e, f, g)
    )
    XCTAssertEqual(
      3,
      firstNonNil(nil, nil, c, d, e, f, g)
    )
    XCTAssertEqual(
      4,
      firstNonNil(nil, nil, nil, d, e, f, g)
    )
    XCTAssertEqual(
      5,
      firstNonNil(nil, nil, nil, nil, e, f, g)
    )
    XCTAssertEqual(
      6,
      firstNonNil(nil, nil, nil, nil, nil, f, g)
    )
    XCTAssertEqual(
      7,
      firstNonNil(nil, nil, nil, nil, nil, nil, g)
    )
    
    XCTAssertEqual(
      1,
      firstNonNil(a, nil, nil, nil, nil, nil, nil)
    )
    XCTAssertEqual(
      2,
      firstNonNil(nil, b, nil, nil, nil, nil, nil)
    )
    XCTAssertEqual(
      3,
      firstNonNil(nil, nil, c, nil, nil, nil, nil)
    )
    XCTAssertEqual(
      4,
      firstNonNil(nil, nil, nil, d, nil, nil, nil)
    )
    XCTAssertEqual(
      5,
      firstNonNil(nil, nil, nil, nil, e, nil, nil)
    )
    XCTAssertEqual(
      6,
      firstNonNil(nil, nil, nil, nil, nil, f, nil)
    )
    XCTAssertEqual(
      7,
      firstNonNil(nil, nil, nil, nil, nil, nil, g)
    )
    
  }

  // ------------------------------------------------------------------------ //
  // MARK: Arity 8
  // ------------------------------------------------------------------------ //

  func testFirstNonNilArity8() {
    
    let a: Int? = 1
    let b: Int? = 2
    let c: Int? = 3
    let d: Int? = 4
    let e: Int? = 5
    let f: Int? = 6
    let g: Int? = 7
    let h: Int? = 8
    
    XCTAssertNil(
      firstNonNil(
        nil,
        nil,
        nil,
        nil,
        nil,
        nil,
        nil,
        nil
      )
    )
    
    XCTAssertEqual(
      1,
      firstNonNil(a, b, c, d, e, f, g, h)
    )
    XCTAssertEqual(
      2,
      firstNonNil(nil, b, c, d, e, f, g, h)
    )
    XCTAssertEqual(
      3,
      firstNonNil(nil, nil, c, d, e, f, g, h)
    )
    XCTAssertEqual(
      4,
      firstNonNil(nil, nil, nil, d, e, f, g, h)
    )
    XCTAssertEqual(
      5,
      firstNonNil(nil, nil, nil, nil, e, f, g, h)
    )
    XCTAssertEqual(
      6,
      firstNonNil(nil, nil, nil, nil, nil, f, g, h)
    )
    XCTAssertEqual(
      7,
      firstNonNil(nil, nil, nil, nil, nil, nil, g, h)
    )
    XCTAssertEqual(
      8,
      firstNonNil(nil, nil, nil, nil, nil, nil, nil, h)
    )
    XCTAssertNil(
      firstNonNil(nil, nil, nil, nil, nil, nil, nil, nil)
    )
    
    XCTAssertEqual(
      1,
      firstNonNil(a, nil, nil, nil, nil, nil, nil, nil)
    )
    XCTAssertEqual(
      2,
      firstNonNil(nil, b, nil, nil, nil, nil, nil, nil)
    )
    XCTAssertEqual(
      3,
      firstNonNil(nil, nil, c, nil, nil, nil, nil, nil)
    )
    XCTAssertEqual(
      4,
      firstNonNil(nil, nil, nil, d, nil, nil, nil, nil)
    )
    XCTAssertEqual(
      5,
      firstNonNil(nil, nil, nil, nil, e, nil, nil, nil)
    )
    XCTAssertEqual(
      6,
      firstNonNil(nil, nil, nil, nil, nil, f, nil, nil)
    )
    XCTAssertEqual(
      7,
      firstNonNil(nil, nil, nil, nil, nil, nil, g, nil)
    )
    XCTAssertEqual(
      8,
      firstNonNil(nil, nil, nil, nil, nil, nil, nil, h)
    )
    
  }

  // ------------------------------------------------------------------------ //
  // MARK: Arity 9
  // ------------------------------------------------------------------------ //

  func testFirstNonNilArity9() {
    
    let a: Int? = 1
    let b: Int? = 2
    let c: Int? = 3
    let d: Int? = 4
    let e: Int? = 5
    let f: Int? = 6
    let g: Int? = 7
    let h: Int? = 8
    let i: Int? = 9

    XCTAssertNil(
      firstNonNil(
        nil,
        nil,
        nil,
        nil,
        nil,
        nil,
        nil,
        nil,
        nil
      )
    )
    
    XCTAssertEqual(
      1,
      firstNonNil(a, b, c, d, e, f, g, h, i)
    )
    XCTAssertEqual(
      2,
      firstNonNil(nil, b, c, d, e, f, g, h, i)
    )
    XCTAssertEqual(
      3,
      firstNonNil(nil, nil, c, d, e, f, g, h, i)
    )
    XCTAssertEqual(
      4,
      firstNonNil(nil, nil, nil, d, e, f, g, h, i)
    )
    XCTAssertEqual(
      5,
      firstNonNil(nil, nil, nil, nil, e, f, g, h, i)
    )
    XCTAssertEqual(
      6,
      firstNonNil(nil, nil, nil, nil, nil, f, g, h, i)
    )
    XCTAssertEqual(
      7,
      firstNonNil(nil, nil, nil, nil, nil, nil, g, h, i)
    )
    XCTAssertEqual(
      8,
      firstNonNil(nil, nil, nil, nil, nil, nil, nil, h, i)
    )
    XCTAssertEqual(
      9,
      firstNonNil(nil, nil, nil, nil, nil, nil, nil, nil, i)
    )
    XCTAssertNil(
      firstNonNil(nil, nil, nil, nil, nil, nil, nil, nil, nil)
    )

    XCTAssertEqual(
      1,
      firstNonNil(a, nil, nil, nil, nil, nil, nil, nil, nil)
    )
    XCTAssertEqual(
      2,
      firstNonNil(nil, b, nil, nil, nil, nil, nil, nil, nil)
    )
    XCTAssertEqual(
      3,
      firstNonNil(nil, nil, c, nil, nil, nil, nil, nil, nil)
    )
    XCTAssertEqual(
      4,
      firstNonNil(nil, nil, nil, d, nil, nil, nil, nil, nil)
    )
    XCTAssertEqual(
      5,
      firstNonNil(nil, nil, nil, nil, e, nil, nil, nil, nil)
    )
    XCTAssertEqual(
      6,
      firstNonNil(nil, nil, nil, nil, nil, f, nil, nil, nil)
    )
    XCTAssertEqual(
      7,
      firstNonNil(nil, nil, nil, nil, nil, nil, g, nil, nil)
    )
    XCTAssertEqual(
      8,
      firstNonNil(nil, nil, nil, nil, nil, nil, nil, h, nil)
    )
    XCTAssertEqual(
      9,
      firstNonNil(nil, nil, nil, nil, nil, nil, nil, nil, i)
    )

  }

  
}
