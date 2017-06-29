
import XCTest
@testable import blinkapi

class AuthTokenTests: XCTestCase {
    
    func testTokenIsSet() {
        let token = AuthToken(token: "token")
        XCTAssertEqual(token.token, "token")
    }
    
}
