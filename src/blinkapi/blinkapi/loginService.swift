import Foundation

public class LoginService : BlinkService {
    public override init() {
        
    }
    public func login(blinkAccount:BlinkAccount, callback: @escaping (AuthResponse) -> Void) -> Void {
        let reqText = ["password": blinkAccount.password, "email" : blinkAccount.email]
        makeRequest(resource: "login", requestData: reqText, httpMethod: "POST", callback: { (data: [String: Any]) -> Void in
            callback(AuthResponse(json: data)!)
        })
    }
}
