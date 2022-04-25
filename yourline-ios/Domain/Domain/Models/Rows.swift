import Foundation

public struct Rows: Decodable {
    
    var groupKey: String?
    var isInjected: Bool?
    var rows: [Row]?
    
    enum CodingKeys: String, CodingKey {
        
        case groupKey = "group_key"
        case rows
        case isInjected = "is_injected"
    }
    
    public func updateValues(rows: [Row]?) -> Rows {
        
        return Rows(rows: rows ?? self.rows)
    }
}
