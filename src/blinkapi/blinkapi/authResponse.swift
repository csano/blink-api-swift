
public extension AuthResponse {
    init?(json: [String:Any]) {
        guard let authToken = json["authtoken"] as? [String: String] else {
            return nil
        }
        
        self.authToken = AuthToken(token: authToken["authtoken"]!)
    }
}

public struct AuthResponse {
    public let authToken: AuthToken
}

public struct NetworkCamerasResponse {
    public let cameras: [Camera]
}


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

public extension NetworkCamerasResponse {
    init?(json: [String:Any]) {
//        guard let authToken = json["authtoken"] as? [String: String] else {
//            return nil
//        }
        
//        self.authToken = AuthToken(token: authToken["authtoken"]!)
        cameras = []
    }
}



