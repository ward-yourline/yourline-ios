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
    
    public init(groupKey: String? = nil, isInjected: Bool? = nil, rows: [Row]? = nil) {
        self.groupKey = groupKey
        self.isInjected = isInjected
        self.rows = rows
    }
    
    public func updateValues(rows: [Row]?) -> Rows {
        
        return Rows(rows: rows ?? self.rows)
    }
}
