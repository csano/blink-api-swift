
import Foundation

public class BlinkService {
    public init() { }
    static let baseUrl = "https://prod.immedia-semi.com/"
    func createRequest(url: URL!, httpMethod: String, data: Data?) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpBody = data
        request.httpMethod = httpMethod
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        return request
    }
    func createRequestUrl(section: String) -> URL! {
        return NSURL(fileURLWithPath: BlinkService.baseUrl).appendingPathComponent(section)
    }
    public func login(blinkAccount:BlinkAccount, callback:@escaping (AuthResponse?) -> Void) -> Void {
        let url = createRequestUrl(section: "login")
        let reqText = ["password": blinkAccount.password, "email" : blinkAccount.email]
        let data = try? JSONSerialization.data(withJSONObject: reqText)
        
        let session = URLSession(configuration: URLSessionConfiguration.default)

        let request = createRequest(url:url!, httpMethod:"POST", data:data)
        
        let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
                    callback(AuthResponse(json: json))
                } catch {
                    callback(nil)
                }
            }
            
        })
        task.resume()
    }
}

class HttpService {
    
}
