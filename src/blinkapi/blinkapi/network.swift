
import Foundation

public struct Network {
    public let accountId: Int
    public let armed: Bool
    public let autoArmGeoEnabled: Bool
    public let autoArmTimeEnabled: Bool
    public let armString: String
    public let busy: Bool
    public let createdAt: Date?
    public let id: Int
    public let name: String
    public let key: String
    public let updatedAt: Date?
}

func getJsonValue<T>(json: [String: Any], property: String) -> T {
    return json[property] as! T
}

func getJsonValueOrDefault<T>(json: [String: Any], property: String, defaultValue: T) -> T {
    return json[property] as? T ?? defaultValue
}

public extension Network {

    
    init?(json: [String: Any]) {
        self.accountId = getJsonValueOrDefault(json: json, property: "account_id", defaultValue: 0)
        self.armed = getJsonValueOrDefault(json: json, property: "armed", defaultValue: false)
        self.autoArmGeoEnabled = getJsonValueOrDefault(json: json, property: "autoarm_geo_enable", defaultValue: false)
        self.autoArmTimeEnabled = getJsonValueOrDefault(json: json, property: "autoarm_time_enable", defaultValue: false)
        self.armString = getJsonValueOrDefault(json: json, property: "arm_string", defaultValue: "")
        self.busy = getJsonValueOrDefault(json: json, property: "busy", defaultValue: false)
        self.createdAt = getJsonValueOrDefault(json: json, property: "created_at", defaultValue: nil)
        self.id = getJsonValue(json: json, property: "id")
        self.key = getJsonValueOrDefault(json: json, property: "network_key", defaultValue: "")
        self.name = getJsonValue(json: json, property: "name")
        self.updatedAt = getJsonValueOrDefault(json: json, property: "updated_at", defaultValue: nil)
    }
}
