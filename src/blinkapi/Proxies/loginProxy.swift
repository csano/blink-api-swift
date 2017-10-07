import Foundation

public class LoginProxy : BlinkProxy {
    public override init() { }
    
    func createRequestDataWithBlinkAccount(blinkAccount: BlinkAccount) -> [String: Any] {
        return ["password": blinkAccount.password, "email" : blinkAccount.email]
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

