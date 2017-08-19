
public protocol EventArgs {
    
}

public enum Event {
    case Login
    case Network
}

public class LoginEventArgs : EventArgs {
    public var s = "Login"
}

public class NetworkEventArgs : EventArgs {
    public var s = "Network"
}

//typealias EventCallback = (EventArgs: EventArgs) -> Void

public typealias EventCallbackType = (EventArgs?) -> Void

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
    func dispatch(event: Event, data: EventArgs) {
        for callback in eventRegistry[event] {
            callback(data)
        }
    }
}


public final class EventCallback<T: EventArgs> {
    func execute(EventArgs: Any?) -> Void {
        if let castData = EventArgs as? T {
            self.callback(castData)
        }
    }
    
    init(callback: @escaping (T?)-> Void){
        self.callback = callback
    }
    
    private let callback : (T?) -> Void
}
