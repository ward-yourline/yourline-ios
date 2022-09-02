import Foundation
import Utility
import Domain

public protocol CellDelegate: AnyObject {}

public protocol FormCellPresentable: AnyObject {
    
    func setupCell(with viewModel: FormCellViewModelling?, delegate: CellDelegate?)
}

public typealias InputCellCallbackBlock = ()->()

public struct RowAttribute {
    
    var viewModel: FormCellViewModelling
    var indexPath: IndexPath
}

public protocol FormCellViewModelling {
    
    var payload: Payload? { get set}
    var row: Row? { get }
    
    init(row: Row?, payload: Payload?)
}

public protocol CellViewModelling {}
public protocol CellPresentable {
    func setupCell(with viewModel: CellViewModelling?, delegate: CellDelegate?)
}
