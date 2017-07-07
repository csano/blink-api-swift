
import XCTest
@testable import blinkapi

class NetworkTests: XCTestCase {
    
    func testWithValidJson() {
        let date = Date()
        let json : [String:Any] = [
            "id": 1,
            "name":"name",
            "account_id": 1234,
            "armed": true,
            "arm_string": "armed",
            "autoarm_geo_enable": true,
            "autoarm_time_enable": true,
            "busy": true,
            "created_at": date,
            "network_key": "key",
            "updated_at": date,
        ]
        let network = Network(json: json)!
        
        XCTAssertEqual(network.id, 1)
        XCTAssertEqual(network.name, "name")
        XCTAssertEqual(network.accountId, 1234)
        XCTAssertTrue(network.armed)
        XCTAssertEqual(network.armString, "armed")
        XCTAssertTrue(network.autoArmGeoEnabled)
        XCTAssertTrue(network.autoArmTimeEnabled)
        XCTAssertTrue(network.busy)
        XCTAssertEqual(network.createdAt, date)
        XCTAssertEqual(network.name, "name")
        XCTAssertEqual(network.key, "key")
        XCTAssertEqual(network.updatedAt, date)
    }
    
    func testOptionalValuesAreSetToDefaultValuesIfNotInJson() {
        let json : [String:Any] = ["id": 1, "name":"name"]

        let network = Network(json: json)!
        
        XCTAssertEqual(network.accountId, 0)
        XCTAssertFalse(network.armed)
        XCTAssertFalse(network.autoArmTimeEnabled)
        XCTAssertFalse(network.autoArmGeoEnabled)
        XCTAssertEqual(network.armString, "")
        XCTAssertFalse(network.busy)
        XCTAssertNil(network.createdAt)
        XCTAssertEqual(network.key, "")
        XCTAssertNil(network.updatedAt)
    }
    
}
