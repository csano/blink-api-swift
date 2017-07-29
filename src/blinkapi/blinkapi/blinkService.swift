
import Foundation

public class BlinkService {

    static let baseUrl = "https://prod.immedia-semi.com/"
    
    func createRequestUrl(resource: String) -> URL! {
        return NSURL(fileURLWithPath: BlinkService.baseUrl).appendingPathComponent(resource)
    }
    
    func createRequest(url: URL!, httpMethod: String, data: Data?) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpBody = data
        request.httpMethod = httpMethod
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        return request
    }
        
    public func makeRequest(resource: String, requestData: [String: Any], httpMethod: String, callback: @escaping ([String: Any]) -> Void) -> Void {
        let url = createRequestUrl(resource: resource)
        let data = try? JSONSerialization.data(withJSONObject: requestData)
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let request = createRequest(url:url!, httpMethod:httpMethod, data:data)
        
        session.dataTask(with: request, completionHandler: { (data, response, error) in
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    callback(json)
                } catch {
                    callback([:])
                }
            }
            
        }).resume()
    }
}
