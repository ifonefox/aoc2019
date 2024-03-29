import XCTest
@testable import day1lib

final class day1Tests: XCTestCase {
  func testP1GetFuel() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct
    // results.
    XCTAssertEqual(Part1.getFuel(forMass: 12), 2);
    XCTAssertEqual(Part1.getFuel(forMass: 14), 2);
    XCTAssertEqual(Part1.getFuel(forMass: 1969), 654);
    XCTAssertEqual(Part1.getFuel(forMass: 100756), 33583);
  }
  func testP1MainSimple() {
    XCTAssertEqual(Part1.sumFuel(fromMasses: [12,14,1969,100756]), 2+2+654+33583)
  }
  func testP2GetFuel() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct
    // results.
    XCTAssertEqual(Part2.getFuel(forMass: 14), 2);
    XCTAssertEqual(Part2.getFuel(forMass: 1969), 966);
    XCTAssertEqual(Part2.getFuel(forMass: 100756), 50346);
  }
  static var allTests = [
    ("testP1GetFuel", testP1GetFuel),
    ("testP2GetFuel", testP2GetFuel),
    
    ("testP1MainSimple", testP1MainSimple)
  ]
}
