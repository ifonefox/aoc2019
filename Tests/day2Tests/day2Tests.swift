import XCTest
@testable import day2lib

final class day2Tests: XCTestCase {
    func testP1Cycle() {
      XCTAssertEqual(Part1.cycle([1,9,10,3,2,3,11,0,99,30,40,50], at:0),[1,9,10,70,2,3,11,0,99,30,40,50]);
    }
  func testP1Run(){
    XCTAssertEqual(Part1.run([1,9,10,3,2,3,11,0,99,30,40,50]), [ 3500,9,10,70,2,3,11,0,99,30,40,50])
    XCTAssertEqual(Part1.run([1,0,0,0,99]), [ 2,0,0,0,99])
    XCTAssertEqual(Part1.run([2,3,0,3,99]), [2,3,0,6,99])
    XCTAssertEqual(Part1.run([2,4,4,5,99,0]), [2,4,4,5,99,9801])
    XCTAssertEqual(Part1.run([1,1,1,4,99,5,6,0,99]), [30,1,1,4,2,5,6,0,99])


  }

    static var allTests = [
        ("testCycle", testP1Cycle),
      ("testP1Run", testP1Run)

    ]
}
