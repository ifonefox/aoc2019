import XCTest
@testable import IntcodeComp

final class day5Tests: XCTestCase {
  func makeComp(code:[Int]) -> IntcodeComp{
    let comp = IntcodeComp(code:code)
    comp.registerInstructions(SharedInstructions.all)
    return comp
  }
  func makeAndCycle(_ code:[Int]) -> IntcodeComp {
    let comp = makeComp(code: code)
    comp.cycle()
    return comp
  }
  func testParseMode(){
    XCTAssertEqual(IntcodeComp.parseMode(opcode:1002, parameters:3), [.Position,.Immediate,.Position])
  }
  func testImmediate(){
    var comp = makeAndCycle([1002,4,3,4,33])
    XCTAssertEqual(comp.state.memory, [1002,4,3,4,99])
    comp = makeAndCycle([102,4,3,4,33])
    XCTAssertEqual(comp.state.memory, [102,4,3,4,16])
  }
  func testInput(){
    let comp = makeComp(code: [3,2,1])
    comp.state.input = [123]
    comp.cycle()
    XCTAssertEqual(comp.state.memory, [3,2,123])
    XCTAssertEqual(comp.state.input, [])
  }
  func testOutput(){
    let comp = makeComp(code: [4,2,104,5,99])
    comp.run()
    XCTAssertEqual(comp.state.memory, [4,2,104,5,99])
    XCTAssertEqual(comp.state.output, [104,5])
  }
  func testInOut(){
    let comp = makeComp(code: [3,3,104,5,99])
    comp.state.input = [123]
    comp.run()
    XCTAssertEqual(comp.state.memory, [3,3,104,123,99])
    XCTAssertEqual(comp.state.input, [])
    XCTAssertEqual(comp.state.output, [123])
  }
  func testJump(){
    var comp = makeComp(code: [3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9])
    comp.state.input = [2]
    comp.run()
    XCTAssertEqual(comp.state.output, [1])
    comp = makeComp(code: [3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9])
    comp.state.input = [0]
    comp.run()
    XCTAssertEqual(comp.state.output, [0])


  }
  static var allTests = [
    ("testParseMode", testParseMode),
  ]
}
