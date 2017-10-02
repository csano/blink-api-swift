
public struct NetworkCamerasResponse {
    public var cameras: [Camera]
}

public extension NetworkCamerasResponse {
    init?(json: [String:Any]) {
        cameras = []
        guard let data = json["devicestatus"] as? [[String: Any]] else {
            return nil
        }
        for cameraJson in data {
            cameras.append(Camera(json: cameraJson)!)
        }
    }
}
