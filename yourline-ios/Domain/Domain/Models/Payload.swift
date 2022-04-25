
import Foundation

public struct Payload: Decodable {

    public var content: String?
    
    public init(content: String?) {
        self.content = content
    }
}
