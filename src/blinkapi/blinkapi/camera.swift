
import Foundation

public struct Camera {
    public let wifiStrength: Int
    public let id: Int
    public let serialNumber: String
    public let temperature: Int
    public let createdAt: Date?
    public let updatedAt: Date?
    public let thumbnailUrl: URL
    public let batteryState: String
    public let batteryLastCheckedAt: Date?
    public let name: String
}

public extension Camera {
    init?(json: [String: Any]) {
        self.wifiStrength = getJsonValueOrDefault(json: json, property: "wifi_strength", defaultValue: 0)
        self.id = getJsonValue(json: json, property: "id")
        self.serialNumber = getJsonValue(json: json, property: "serial")
        self.temperature = getJsonValueOrDefault(json: json, property: "temperature", defaultValue: 0)
        self.createdAt = getJsonValueOrDefault(json: json, property: "created_at", defaultValue: nil)
        self.updatedAt = getJsonValueOrDefault(json: json, property: "updated_at", defaultValue: nil)
        self.batteryState = getJsonValueOrDefault(json: json, property: "battery_state", defaultValue: "")
        self.batteryLastCheckedAt = getJsonValueOrDefault(json: json, property: "battery_check_time", defaultValue: nil)
        self.thumbnailUrl = getJsonValueOrDefault(json: json, property: "thumbnail", defaultValue: URL(string: "")!)
        self.name = getJsonValue(json: json, property: "name")
    }
}
