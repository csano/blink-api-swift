
extension AuthResponse {
    init?(json: [String:Any]) {
        guard let authToken = json["authtoken"] as? [String: String],
            let networks = json["networks"] as? [String: [String: Any]]
            else {
                return nil
        }
        
        self.networks = []
        for (networkId, details) in networks {
            self.networks.append(Network(networkId:Int(networkId)!, json:details)!)
        }
        
        self.authToken = AuthToken(token: authToken["authtoken"]!)
    }
}

struct AuthResponse {
    var networks: [Network]
    let authToken: AuthToken
}
