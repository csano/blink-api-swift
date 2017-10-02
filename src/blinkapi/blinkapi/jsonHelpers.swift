func getJsonValue<T>(json: [String: Any], property: String) -> T {
    return json[property] as! T
}

func getJsonValueOrDefault<T>(json: [String: Any], property: String, defaultValue: T!) -> T {
    return json[property] as? T ?? defaultValue
}
