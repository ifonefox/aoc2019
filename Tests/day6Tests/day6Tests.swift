import XCTest
@testable import day6lib

final class day6Tests: XCTestCase {
  func testPart1() {
    let testData = ["COM)B", "B)C", "C)D", "D)E", "E)F", "B)G", "G)H", "D)I", "E)J", "J)K", "K)L"]
    let root = Node.parseAndGetRoot(data:testData)
    XCTAssertEqual(root.getScore(),42)
  }
  func testPart2(){
    let testData = ["COM)B", "B)C", "C)D", "D)E", "E)F", "B)G", "G)H", "D)I", "E)J", "J)K", "K)L", "K)YOU", "I)SAN"]
    let map = Node.parseAndGetMap(data: testData)
    let you = map["YOU"]
    let santa = map["SAN"]
    XCTAssertEqual(you?.parent?.name, "K")
    XCTAssertEqual(santa?.parent?.name, "I")
    XCTAssertEqual(you!.findPath(to:you!),0)
    XCTAssertEqual(you!.findPath(to:santa!),4)

  }
  static var allTests = [
    ("testPart1", testPart1),
  ]
}
