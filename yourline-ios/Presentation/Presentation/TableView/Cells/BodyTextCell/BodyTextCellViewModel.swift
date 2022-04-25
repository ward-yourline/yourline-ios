import Foundation

public class BodyTextCellViewModel: CellViewModelling {
    public var payload: Payload?
    public var row: Row?
    public var isBordered: Bool? {
        
        return row?.isBordered
    }
    public var content: String? {
        
        if let content = payload?.content {
            return content
        }
        
        return row?.content
    }
    
    public required init(row: Row?, payload: Payload?) {
        
        self.row = row
        self.payload = payload
    }
}
