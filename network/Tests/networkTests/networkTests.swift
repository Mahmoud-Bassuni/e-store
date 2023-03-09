import XCTest
@testable import network

final class networkTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(network().text, "Hello, World!")
    }
}
