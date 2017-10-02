import Foundation

public class NetworkProxy: BlinkProxy {
    public override init() { }
    
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
        var request = createRequest(url: createNetworksRequestUrl())
        request.setValue(authToken.token, forHTTPHeaderField: "TOKEN_AUTH")
        
        makeRequest(request: request,  callback: { (data: [String: Any]) -> Void in
            callback(NetworkResponse(json: data)!)
        })
    }
    
    public func getCameras(authToken: AuthToken, network: Network, callback: @escaping (NetworkCamerasResponse) -> Void) -> Void {
        let request = createRequest(url: createNetworkCollectionRequestUrl(networkId: network.id, collection: "cameras"))
        makeRequest(request: request, callback: { (data: [String: Any]) -> Void in
            callback(NetworkCamerasResponse(json: data)!)
        })
    }
}
