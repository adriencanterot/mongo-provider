import XCTest
@testable import MongoProvider
import Vapor

class MongoProviderTests: XCTestCase {



    static var allTests : [(String, (MongoProviderTests) -> () throws -> Void)] {
        return [
            ("testDatabase", testDatabase),
        ]
    }
    
    func testDatabase() throws {
        let mongoProvider = try Provider(database: "test", user: "test", password: "test", host: "localhost", port: 27017)
        let droplet = Droplet(initializedProviders:[mongoProvider])
        
        XCTAssertNotNil(droplet.database)
    }
    
}
