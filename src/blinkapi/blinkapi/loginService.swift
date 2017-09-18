import Foundation

public class LoginService : BlinkService {
    public override init() {
    }
    public func login(blinkAccount:BlinkAccount, callback: @escaping (AuthResponse) -> Void) -> Void {
        let reqText = createRequestDataWithBlinkAccount(blinkAccount: blinkAccount)
        makeRequest(url: createRequestUrl(resource: "login"), requestData: reqText, httpMethod: "POST", callback: { (data: [String: Any]) -> Void in
            callback(AuthResponse(json: data)!)
        })
    }
}

public class NetworkService: BlinkService {
    public override init() {
    }
    
    func createNetworkRequestUrl(networkId: Int, collection: String) -> URL! {
        return createRequestUrl(resource: "network").appendingPathComponent(String(networkId)).appendingPathComponent(collection)
    }
    
    public func getCameras(blinkAccount:BlinkAccount, network: Network, callback: @escaping (NetworkCamerasResponse) -> Void) -> Void {
        let reqText = createRequestDataWithBlinkAccount(blinkAccount: blinkAccount)
        makeRequest(url:createNetworkRequestUrl(networkId: network.id, collection: "cameras"), requestData: reqText, httpMethod: "POST", callback: { (data: [String: Any]) -> Void in
            callback(NetworkCamerasResponse(json: data)!)
        })
    }
    
    
}
