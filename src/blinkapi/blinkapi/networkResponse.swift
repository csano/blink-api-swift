public struct NetworkResponse {
    public var networks: [Network]
}

public extension NetworkResponse {
    init?(json: [String:Any]) {
        networks = []
        guard let data = json["networks"] as? [[String: Any]] else {
            return nil
        }
        for networkJson in data {
            networks.append(Network(json: networkJson)!)
        }
    }
}
