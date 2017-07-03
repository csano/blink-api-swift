
import Foundation

public struct Network {
    public let id: Int
    public let name: String
    public let onboarded: Bool
}

public extension Network {
    init?(networkId: Int, json: [String: Any]) {
        self.id = networkId
        self.name = json["name"] as! String
        self.onboarded = json["onboarded"] as! Bool
    }
}
