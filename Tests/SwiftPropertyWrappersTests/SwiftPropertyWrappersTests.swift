import XCTest
@testable import SwiftPopertyWrappers

final class SwiftPopertyWrappersTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiftPopertyWrappers().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
