import Foundation

public protocol Inputting {
    
    var data: String? { get set }
    var isHighlighted: Bool? { get set }
    var inputCallbackBlock: InputCellCallbackBlock? { get set }
    var inputKey: String? { get }
    
    func setHighlighted(_ isHighlighted: Bool)
}

public class InputCellViewModel: CellViewModelling, Inputting {
    
    public var data: String?
    public var payload: Payload?
    public var row: Row?
    public var isHighlighted: Bool?
    public var isSecure: Bool {
        
        return row?.isSecure ?? false
    }
    public var inputKey: String? {
        return row?.inputKey
    }
    public var title: String? {
        return row?.title
    }
    public var errorTitle: String? {
        return row?.errorTitle
    }
    public func setHighlighted(_ isHighlighted: Bool) {
        
        self.isHighlighted = isHighlighted
    }
    public var inputCallbackBlock: InputCellCallbackBlock?
    
    public var cellInputType: RowInputType? { return row?.cellInputType }
    public var content: String? {
        
        if let content = payload?.content {
            return content
        }
        
        return row?.content
    }
    
    required public init(row: Row?, payload: Payload?) {
        
        self.row = row
        self.payload = payload
    }
    
    convenience public required init(row: Row?, payload: Payload?, inputCallbackBlock: InputCellCallbackBlock?) {
        
        self.init(row: row, payload: payload)
        self.inputCallbackBlock = inputCallbackBlock
    }
}
