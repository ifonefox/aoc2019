import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(aoc2019Tests.allTests),
    ]
}
#endif
