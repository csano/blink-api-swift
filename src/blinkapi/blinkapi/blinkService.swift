
import Foundation

public class BlinkService {

    static let baseUrl = "https://prod.immedia-semi.com/"
    
    func createRequestUrl(resource: String) -> URL! {
        return URL(string: BlinkService.baseUrl)!.appendingPathComponent(resource)
    }
    
    func createRequest(url: URL!, httpMethod: String, data: Data?) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpBody = data
        request.httpMethod = httpMethod
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    func createRequestDataWithBlinkAccount(blinkAccount: BlinkAccount) -> [String: Any] {
        return ["password": blinkAccount.password, "email" : blinkAccount.email]
    }
        
    // should take request object instead of data
    public func makeRequest(request: URLRequest, callback: @escaping ([String: Any]) -> Void) -> Void {
        let session = URLSession(configuration: URLSessionConfiguration.default)

        session.dataTask(with: request, completionHandler: { (data, response, error) in
            if (error != nil) {
                // TODO
            } else {
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                        callback(json)
                    } catch let e as Error {
                        callback([:])
                    }
                }
            }
        }).resume()
    }
}
