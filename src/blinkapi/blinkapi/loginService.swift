import Foundation

public class LoginService : BlinkService {
    public override init() {
        
    }
    func createResponse(json: [String: Any]) -> Void {
        
    }
    public func login(blinkAccount:BlinkAccount, callback:@escaping (AuthResponse?) -> Void) -> Void {
        let reqText = ["password": blinkAccount.password, "email" : blinkAccount.email]
        makeRequest(resource: "login", requestData: reqText, httpMethod: "POST", callback: createResponse)
    }
}
