import XCTest
@testable import blinkapi

class NetworkCameraResponseTests: XCTestCase {
    
    func testWithValidJsonWithOneCamera() {
        let json : [String:Any] = ["devicestatus": [["name": "camera1", "id": 1, "serial": "serial"]]]
        let response = NetworkCamerasResponse(json: json)!
        
        XCTAssertEqual(response.cameras.count, 1)
    }
    
    func testWithValidJsonWithMultipleCameras() {
        let json : [String:Any] = ["devicestatus": [["name": "camera1", "id": 1, "serial": "serial1"], ["name": "camera2", "id": 2, "serial": "serial1"]]]
        let response = NetworkCamerasResponse(json: json)!
        
        XCTAssertEqual(response.cameras.count, 2)
    }
    
    func testNoJsonResultsInEmptyCameraCollection() {
        let json : [String:Any] = ["devicestatus": []]
        
        let response = NetworkCamerasResponse(json: json)!
        
        XCTAssertEqual(response.cameras.count, 0)
    }}
