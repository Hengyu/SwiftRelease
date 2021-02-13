import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    [
        testCase(ReleaseTests.allTests)
    ]
}
#endif
