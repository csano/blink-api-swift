
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
    
    func testOptionalValuesAreSetToDefaultValuesIfNotInJson() {
        let json : [String:Any] = ["name":"name", "onboarded": false]
        let network = Network(networkId: 1, json: json)!
        
   
        XCTAssertEqual(network.accountId, 0)
        XCTAssertFalse(network.armed)
        XCTAssertFalse(network.autoArmTimeEnabled)
        XCTAssertFalse(network.autoArmGeoEnabled)
        XCTAssertEqual(network.armString, "")
        XCTAssertNil(network.createdAt)
        XCTAssertNil(network.updatedAt)        
    }
    
}
