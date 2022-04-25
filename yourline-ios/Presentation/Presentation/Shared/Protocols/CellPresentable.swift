import Foundation

public protocol CellDelegate: AnyObject {}

public protocol CellPresentable: AnyObject {
    
    func setupCell(with viewModel: CellViewModelling?, delegate: CellDelegate?)
}

public typealias InputCellCallbackBlock = ()->()

public struct RowAttribute {
    
    var viewModel: CellViewModelling
    var indexPath: IndexPath
}

public protocol CellViewModelling {
    
    var payload: Payload? { get set}
    var row: Row? { get }
    
    init(row: Row?, payload: Payload?)
}
