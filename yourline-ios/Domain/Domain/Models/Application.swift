import Foundation

public struct Application: Decodable {
    
    public var screens: [Screen]?
    
    public func updateValues(screens: [Screen]?) -> Application {
        
        return Application(screens: screens ?? self.screens)
    }
}
