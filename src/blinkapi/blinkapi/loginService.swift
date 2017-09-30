import Foundation

public class LoginService : BlinkService {
    public override init() {
    }
    public func login(blinkAccount:BlinkAccount, callback: @escaping (AuthResponse) -> Void) -> Void {
        let reqText = createRequestDataWithBlinkAccount(blinkAccount: blinkAccount)
        
        let data = try? JSONSerialization.data(withJSONObject: reqText)
                
        let request = createRequest(url: createRequestUrl(resource: "login"), httpMethod:"POST", data:data)
        
        makeRequest(request: request, callback: { (data: [String: Any]) -> Void in
            callback(AuthResponse(json: data)!)
        })
    }
}

public class NetworkService: BlinkService {
    public override init() {
    }

    func createNetworksRequestUrl() -> URL! {
        return createRequestUrl(resource: "networks")
    }
    
    func createNetworkRequestUrl(_ networkId: Int) -> URL! {
        return createRequestUrl(resource: "network").appendingPathComponent(String(networkId))
    }

    func createNetworkCollectionRequestUrl(networkId: Int, collection: String) -> URL! {
        return createNetworkRequestUrl(networkId).appendingPathComponent(collection)
    }
    
    public func getNetworks(authToken: AuthToken, callback: @escaping (NetworkResponse) -> Void) -> Void {
        var request = createRequest(url: createNetworksRequestUrl(), httpMethod: "GET", data: nil)
        request.setValue(authToken.token, forHTTPHeaderField: "TOKEN_AUTH")
        
        makeRequest(request: request,  callback: { (data: [String: Any]) -> Void in
            callback(NetworkResponse(json: data)!)
        })
    }
    
//    public func getCameras(authToken: AuthToken, network: Network, callback: @escaping (NetworkCamerasResponse) -> Void) -> Void {
//        let requestData = createRequestDataWithAuthToken(authToken: authToken);
//        makeRequest(url:createNetworkCollectionRequestUrl(networkId: network.id, collection: "cameras"), requestData: requestData, httpMethod: "GET", callback: { (data: [String: Any]) -> Void in
//            callback(NetworkCamerasResponse(json: data)!)
//        })
//    }
    
    
}
