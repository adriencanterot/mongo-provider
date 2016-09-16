import XCTest
@testable import MongoProvider

class MongoProviderTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(MongoProvider().text, "Hello, World!")
    }


    static var allTests : [(String, (MongoProviderTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
