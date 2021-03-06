
import Foundation

let BLINK_API_BASE_URI = "https://prod.immedia-semi.com/"


public class BlinkProxy {
    
    func createRequestUrl(resource: String) -> URL! {
        return URL(string: BLINK_API_BASE_URI)!.appendingPathComponent(resource)
    }
    
    func createRequest(url: URL!, httpMethod: String, data: Data?) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpBody = data
        request.httpMethod = httpMethod
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        return request
    }

    func createRequest(url: URL!) -> URLRequest {
        return createRequest(url: url, httpMethod: "GET", data: nil)
    }
    
    func createRequest(url: URL!, httpMethod: String) -> URLRequest {
        return createRequest(url: url, httpMethod: httpMethod, data: nil)
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
                    } catch {
                        callback([:])
                    }
                }
            }
        }).resume()
    }
}
