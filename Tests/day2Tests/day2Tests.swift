import XCTest
@testable import IntcodeComp

final class day2Tests: XCTestCase {
  func makeComp(code:[Int]) -> IntcodeComp{
    let comp = IntcodeComp(code:code)
    comp.registerInstructions([SharedInstructions.add, SharedInstructions.multiply, SharedInstructions.halt])
    return comp
  }
  func testP1Cycle() {
    let comp = makeComp(code: [1,9,10,3,2,3,11,0,99,30,40,50])
    comp.cycle()
    XCTAssertEqual(comp.state.memory,[1,9,10,70,2,3,11,0,99,30,40,50]);
    
  }
  func testP1Run(){
    var comp:IntcodeComp
    comp = makeComp(code: [1,9,10,3,2,3,11,0,99,30,40,50])
    comp.run()
    XCTAssertEqual(comp.state.memory, [ 3500,9,10,70,2,3,11,0,99,30,40,50])
    
    comp = makeComp(code: [1,0,0,0,99])
    comp.run()
    XCTAssertEqual(comp.state.memory, [ 2,0,0,0,99])
    

    comp = makeComp(code: [2,3,0,3,99])
    comp.run()
    XCTAssertEqual(comp.state.memory, [2,3,0,6,99])
    

    comp = makeComp(code: [2,4,4,5,99,0])
    comp.run()
    XCTAssertEqual(comp.state.memory, [2,4,4,5,99,9801])
    
    comp = makeComp(code: [1,1,1,4,99,5,6,0,99])
    comp.run()
    XCTAssertEqual(comp.state.memory, [30,1,1,4,2,5,6,0,99])

  }
  /*
  static var allTests = [
    
    ("testCycle", testP1Cycle),
    ("testP1Run", testP1Run),
    ("testParseMode", testParseMode)
  ]*/
}
