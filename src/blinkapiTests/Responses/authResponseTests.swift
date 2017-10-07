
import XCTest
@testable import blinkapi

class AuthResponseTests: XCTestCase {
    
    func testWithValidJsonWithOneNetwork() {
        let json : [String:Any] = ["authtoken":["authtoken": "token"], "networks": ["1234":["name": "networkName", "onboarded": true]]]
        let response = AuthResponse(json: json)!
        
        XCTAssertEqual(response.authToken.token, "token")
    }
        
    func testWithInvalidJsonReturnsNil() {
        let json : [String:Any] = ["foo":"bar"]
        let response = AuthResponse(json: json)
        
        XCTAssertNil(response)
    }
    
}
