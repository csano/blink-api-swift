
public protocol EventData {
    
}

public enum Event {
    case Login
    case Network
}

public class LoginEventData : EventData {
    public var s = "Login"
}

public class NetworkEventData : EventData {
    public var s = "Network"
}

//typealias EventCallback = (eventData: EventData) -> Void

public typealias EventCallbackType = (EventData?) -> Void

public class EventRegistry {
    // TODO: ObjectIdentifier instead of String?
    private var registry: [Event: [EventCallbackType]] = [:]
    
    public func register(event: Event, callback: @escaping EventCallbackType) {
        if !registry.keys.contains(event) {
            registry[event] = []
        }
        registry[event]?.append(callback)
    }
    
    subscript(event: Event) -> [EventCallbackType]! {
        get {
            return registry.keys.contains(event) ? registry[event] : []
        }
    }
    
}

public class EventDispatcher {
    private var eventRegistry: EventRegistry;
    init(eventRegistry: EventRegistry) {
        self.eventRegistry = eventRegistry
    }
    func dispatch(event: Event, data: EventData) {
        for callback in eventRegistry[event] {
            callback(data)
        }
    }
}


public final class EventCallback<T: EventData> {
    func execute(eventData: Any?) -> Void {
        if let castData = eventData as? T {
            self.callback(castData)
        }
    }
    
    init(callback: @escaping (T?)-> Void){
        self.callback = callback
    }
    
    private let callback : (T?) -> Void
}
