
import Foundation

public struct Network {
    public let accountId: Int
    public let armed: Bool
    public let autoArmGeoEnabled: Bool
    public let autoArmTimeEnabled: Bool
    public let armString: String
    public let createdAt: Date?
    public let id: Int
    public let name: String
    public let onboarded: Bool
    public let updatedAt: Date?
}

public extension Network {
    init?(networkId: Int, json: [String: Any]) {
        guard let name = json["name"] else {
            return nil
        }
        
        self.accountId = json["account_id"] as? Int ?? 0
        self.armed = json["armed"] as? Bool ?? false
        self.autoArmGeoEnabled = json["autoarm_geo_enable"] as? Bool ?? false
        self.autoArmTimeEnabled = json["autoarm_time_enable"] as? Bool ?? false
        self.armString = json["arm_string"] as? String ?? ""
        self.createdAt = json["created_at"] as? Date ?? nil
        self.id = networkId
        self.name = name as! String
        self.onboarded = json["onboarded"] as? Bool ?? false
        self.updatedAt = json["updated_at"] as? Date ?? nil
    }
}
