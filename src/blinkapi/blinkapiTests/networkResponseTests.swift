import XCTest
@testable import blinkapi


class NetworkResponseTests: XCTestCase {
    
    func testWithValidJsonWithOneNetwork() {
        let json : [String:Any] = ["networks": [["name": "networkName", "id": 1, "onboarded": true]]]
        let response = NetworkResponse(json: json)!
        
        XCTAssertEqual(response.networks.count, 1)
    }

    func testWithValidJsonWithMultipleNetworks() {
        let json : [String:Any] = ["networks": [["name": "networkName1", "id": 1], ["name": "networkName2", "id": 2]]]
        let response = NetworkResponse(json: json)!
        
        XCTAssertEqual(response.networks.count, 2)
        XCTAssertEqual(response.networks[0].id, 1)
        XCTAssertEqual(response.networks[1].id, 2)
    }

    func testNoJsonResultsInEmptyNetworkCollection() {
        let json : [String:Any] = ["networks": []]
        
        let response = NetworkResponse(json: json)!
        
        XCTAssertEqual(response.networks.count, 0)
    }
}
