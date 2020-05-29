//
//  LazyCharacterSplitSequenceTests.swift
//

import XCTest
import Foundation
import HDXLTestingUtilities
@testable import HDXLCommonUtilities

class LazyCharacterSplitSequenceTests : XCTestCase {
  
  lazy var simpleProgrammaticExamples: [String] = self.prepareSimpleProgrammaticExamples()
  
  func testSimpleProgrammaticExamples() {
    let separators: [Character] = [",", ":", "."]
    for probe in self.simpleProgrammaticExamples {
      for separator in separators {
        self.confirmEquivalentSplits(
          forTarget: probe,
          separator: separator
        )
      }
    }
  }
    
  func testManualSanityChecks() {
    self.confirmLazySplit(
      of: "a,b,c",
      on: ",",
      yields: [
        "a","b","c"
      ]
    )
    self.confirmLazySplit(
      of: ",a,b,c",
      on: ",",
      yields: [
        "", "a", "b", "c"
      ]
    )
  }
  
}

fileprivate extension LazyCharacterSplitSequenceTests {
  
  func prepareSimpleProgrammaticExamples() -> [String] {
    let sources: [String] = ["a", "b", "c", "d", "e", "f", "g", "h"]
    let joiners: [String] = ["", ":", "::", ",", ",,", ",,,", ",,,,"]
    let probes: [String] = sources.smallPowerSet()
      .map() {
        (components: [String]) -> [String]
        in
        let joined = joiners.map() {
          (joiner) -> String
          in
          components.joined(separator: joiner)
        }
        var results: [String] = []
        results.append(contentsOf: joined)
        for joiner in joiners {
          for joined in joined {
            results.append(
              joined + joiner
            )
            results.append(
              joiner + joined
            )
          }
        }
        return results
    }.flatMap() {
      return $0
    }
    return probes
  }
  
}


fileprivate extension LazyCharacterSplitSequenceTests {
  
  func confirmLazySplit(
    of target: String,
    on character: Character,
    yields expectation: [String]) {
    XCTAssertEqual(
      Array(target.lazySplit(separator: character)),
      expectation,
      """
      Expected lazily-split-on '\(character)' applied-to "\(target)" would yield \(expectation), but got \(Array(target.lazySplit(separator: character))) instead!
      """
    )
  }
  
  func confirmEquivalentSplits(
    forTarget target: String,
    separator: Character) {
    let eager = target.split(separator: separator).map() {
      String($0)
    }
    let lazy = Array(target.lazySplit(separator: separator))
    // I could just assert-equal, here, but I want more-granular messages
    // in the event I have a failing test:
    XCTAssertEqual(
      eager.count,
      lazy.count,
      """
      Expected identical counts, but got `eager.count` == \(eager.count) and `lazy.count` == \(lazy.count) on:
      - separator: '\(separator)'
      -    target: "\(target)"
      -     eager: \(eager.enclosedJoin(endcaps: .squareBrackets, separator: ", "))
      -      lazy: \(lazy.enclosedJoin(endcaps: .squareBrackets, separator: ", "))
      """
    )
    // we only want granular detail if the counts are right--no point
    // bogging Xcode down with *unnecessary* minutia about failed-tests:
    if eager.count == lazy.count {
      let count = eager.count
      for (index, (e,l)) in zip(eager, lazy).enumerated() {
        XCTAssertEqual(
          e,
          l,
          """
          At index \(index) (in `0..<\(count)`), got non-identical split with `eager[\(index)]` => "\(e)", `lazy[\(index)]` => "\(l)":
          -    separator: '\(separator)'
          -       target: "\(target)"
          - eager.before: \(eager[0..<index].enclosedJoin(endcaps: .squareBrackets, separator: ", ")) ...
          -   eager.here: \(e)
          -  eager.after: ... \(eager[(index+1)..<count].enclosedJoin(endcaps: .squareBrackets, separator: ", "))
          -  lazy.before: \(lazy[0..<index].enclosedJoin(endcaps: .squareBrackets, separator: ", ")) ...
          -    lazy.here: \(l)
          -   lazy.after: ... \(lazy[(index+1)..<count].enclosedJoin(endcaps: .squareBrackets, separator: ", "))
          """
        )
      }
    }
  }
  
}
