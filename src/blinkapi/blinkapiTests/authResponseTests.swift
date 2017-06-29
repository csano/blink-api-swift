
import XCTest
@testable import blinkapi

class AuthResponseTests: XCTestCase {
    
    func testWithValidJsonWithOneNetwork() {
        let json : [String:Any] = ["authtoken":["authtoken": "token"], "networks": ["1234":["name": "networkName", "onboarded": true]]]
        let response = AuthResponse(json: json)!
        
        XCTAssertEqual(response.networks[0].id, 1234)
        XCTAssertEqual(response.networks[0].name, "networkName")
        XCTAssertEqual(response.networks[0].onboarded, true)
        XCTAssertEqual(response.authToken.token, "token")
    }
    
    func testWithValidJsonWithMultipleNetworks() {
        let json : [String:Any] = ["authtoken":["authtoken": "token"], "networks": ["1234":["name": "network1", "onboarded": true], "5678":["name": "network2", "onboarded": true]]]
        let response = AuthResponse(json: json)!
        
        XCTAssertEqual(response.networks.count, 2)
    }
    
    func testWithInvalidJsonReturnsNil() {
        let json : [String:Any] = ["foo":"bar"]
        let response = AuthResponse(json: json)
        
        XCTAssertNil(response)
    }
    
}
