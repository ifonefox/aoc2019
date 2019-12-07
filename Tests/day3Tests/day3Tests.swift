import XCTest
@testable import day3lib

final class day1Tests: XCTestCase {
  func testParse() {
    XCTAssertEqual(Instruction(fromString:"R8"),Instruction(Direction.Right, 8));
    XCTAssertEqual(Instruction(fromString:"U5"),Instruction(Direction.Up, 5));
    XCTAssertEqual(Instruction(fromString:"L5"),Instruction(Direction.Left, 5));
    XCTAssertEqual(Instruction(fromString:"D3"),Instruction(Direction.Down, 3));
  }
  func testNextPath(){
    /*...........
     ...........
     ...........
     ....+----+.
     ....|....|.
     ....|....|.
     ....|....|.
     .........|.
     .o-------+.
     ...........*/
    let start = Point(x: 1, y: 1)
    var (nextPoint, nextLine) = start.nextPath(Instruction(Direction.Right,8))
    XCTAssertEqual(nextPoint, Point(x:9,y:1))
    XCTAssertEqual(nextLine, Line(type: .Horizontal, start: 1, end: 9, location: 1))
    
    (nextPoint, nextLine) = Point(x:9,y:1).nextPath(Instruction(Direction.Up,5))
    XCTAssertEqual(nextPoint, Point(x:9,y:6))
    XCTAssertEqual(nextLine, Line(type: .Virtical, start: 1, end: 6, location: 9))
    
    (nextPoint, nextLine) = Point(x:9,y:6).nextPath(Instruction(Direction.Left, 5))
    XCTAssertEqual(nextPoint, Point(x:4,y:6))
    XCTAssertEqual(nextLine, Line(type: .Horizontal, start: 9, end: 4, location: 6))
    
    (nextPoint, nextLine) = Point(x:4,y:6).nextPath(Instruction(Direction.Down, 3))
    XCTAssertEqual(nextPoint, Point(x:4,y:3))
    XCTAssertEqual(nextLine, Line(type: .Virtical, start: 6, end: 3, location: 4))
    print(nextPoint, nextLine)
  }
  func testIntersect(){
    XCTAssertEqual(Line(type: .Horizontal, start: 3, end: 6, location: 4).intersect(Line(type: .Virtical, start: 3, end: 6, location: 5)), Point(x:5, y:4))
  }
  func testMakePath(){
    let instructions = ["R8","U5","L5","D3"].map({(str:String) -> Instruction in Instruction(fromString: str)})
    let lines = makePath(from: Point(x:1,y:1), instructions)
    let realLines = [
      Line(type: .Horizontal, start: 1, end: 9, location: 1),
      Line(type: .Virtical, start: 1, end: 6, location: 9),
      Line(type: .Horizontal, start: 9, end: 4, location: 6),
      Line(type: .Virtical, start: 6, end: 3, location: 4)
    ]
    XCTAssertEqual(lines, realLines)
  }
  func testFindShortest(){
    XCTAssertEqual(findShortest(to: Point(x:1,y:1), [Point(x:4, y:4), Point(x:7, y:6)]), 6)
  }
  func testPart1Main(){
    XCTAssertEqual(part1(["R8","U5","L5","D3"], ["U7","R6","D4","L4"]), 6)
    XCTAssertEqual(part1(["R75","D30","R83","U83","L12","D49","R71","U7","L72"], ["U62","R66","U55","R34","D71","R55","D58","R83"]), 159)
    XCTAssertEqual(part1(["R98","U47","R26","D63","R33","U87","L62","D20","R33","U53","R51"], ["U98","R91","D20","R16","D67","R40","U7","R15","U6","R7"]), 135)
  }
  func testPart2Main(){
    XCTAssertEqual(part2(["R8","U5","L5","D3"], ["U7","R6","D4","L4"]), 30)
    XCTAssertEqual(part2(["R75","D30","R83","U83","L12","D49","R71","U7","L72"], ["U62","R66","U55","R34","D71","R55","D58","R83"]), 610)
    XCTAssertEqual(part2(["R98","U47","R26","D63","R33","U87","L62","D20","R33","U53","R51"], ["U98","R91","D20","R16","D67","R40","U7","R15","U6","R7"]), 410)
    
  }
  static var allTests = [
    ("testParse", testParse),
    ("testNextPath", testNextPath),
    ("testIntersect", testIntersect),
    ("testMakePath", testMakePath),
    ("testPart1Main", testPart1Main),
  ]
}
/*
 
 */
