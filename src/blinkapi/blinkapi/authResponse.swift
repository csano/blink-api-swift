
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

public struct NetworkResponse {
    public let Network: Network
}
