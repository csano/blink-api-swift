
import Foundation

struct Network {
    let id: Int
    let name: String
    let onboarded: Bool
}

extension Network {
    init?(networkId: Int, json: [String: Any]) {
        self.id = networkId
        self.name = json["name"] as! String
        self.onboarded = json["onboarded"] as! Bool
    }
}
