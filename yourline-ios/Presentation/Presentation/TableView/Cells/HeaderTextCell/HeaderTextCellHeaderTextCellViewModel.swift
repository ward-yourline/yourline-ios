import Foundation
import UIKit

class HeaderTextCellViewModel: CellViewModelling {
    
    var payload: Payload?
    var row: Row?
    var alignment: NSTextAlignment {
        if let rowAlignment = row?.alignment {
            switch rowAlignment {
            case .left:
                return NSTextAlignment.left
            case .right:
                return NSTextAlignment.right
            case .center:
                return NSTextAlignment.center
            }
        }
        return NSTextAlignment.left
    }
    var headerType: HeaderType? {
        
        return row?.headerType
    }
    
    var content: String? {
        
        if let content = payload?.content {
            return content
        }
        
        return row?.content
    }
    var isBordered: Bool? {
        
        return row?.isBordered
    }
    required init(row: Row?, payload: Payload?) {
        
        self.row = row
        self.payload = payload
    }
}
