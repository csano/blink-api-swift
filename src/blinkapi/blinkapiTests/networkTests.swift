
import XCTest
@testable import blinkapi

class NetworkTests: XCTestCase {
    
    func testWithValidJson() {
        let json : [String:Any] = ["name":"name", "onboarded": false]
        let network = Network(networkId: 1, json: json)!
        
        XCTAssertEqual(network.id, 1)
        XCTAssertEqual(network.name, "name")
        XCTAssertEqual(network.onboarded, false)        
    }
    
}
