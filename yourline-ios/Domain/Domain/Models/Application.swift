import Foundation

public struct Application: Decodable {
    
    var screens: [Screen]?
    
    public func updateValues(screens: [Screen]?) -> Application {
        
        return Application(screens: screens ?? self.screens)
    }
}
