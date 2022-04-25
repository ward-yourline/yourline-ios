import Foundation

public struct Rows: Decodable {
    
    public var groupKey: String?
    public var isInjected: Bool?
    public var rows: [Row]?
    
    public enum CodingKeys: String, CodingKey {
        
        case groupKey = "group_key"
        case rows
        case isInjected = "is_injected"
    }
    
    public func updateValues(rows: [Row]?) -> Rows {
        
        return Rows(rows: rows ?? self.rows)
    }
}
