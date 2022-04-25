import UIKit

public class TableViewPresenter: TableViewPresenting {
    
    public var numberOfSections: Int {
        return screen?.sections?.count ?? 0
    }
    public var topContentInset: CGFloat {
        return screen?.topContentInset?.convertToCGFloat() ?? 0.0
    }
    public var bottomContentInset: CGFloat {
        return screen?.bottomContentInset?.convertToCGFloat() ?? 0.0
    }
    public var title: String?
    public var hasSeparators: Bool {
        
        return screen?.hasSeparators ?? false
    }
    
    private weak var view: TableViewing?
    private var screen: Screen?
    private weak var coordinator: Coordinator?
    private var dataCallbackBlock: DataCallbackBlock?
    private var asyncQueue = OperationQueue()
    private lazy var rowAttributesList: [RowAttribute?] = {
        
        return [RowAttribute]()
    }()
    
    required public init(screen: Screen?, view: TableViewing?, coordinator: Coordinator?, dataCallbackBlock: DataCallbackBlock?) {
        
        self.view = view
        self.coordinator = coordinator
        self.screen = screen
        self.dataCallbackBlock = dataCallbackBlock
    }
    
    public func viewDidLoad() {
        
        if screen != nil, view != nil {
            
            updateView()
        }
    }
    
    public func updateView() {
        
        view?.viewReady()
    }
    
    public func numberOfRows(with section: Int) -> Int {
        
        return screen?.sections?[section].rows?.count ?? 0
    }
    
    public func actionAtIndexPath(_ indexPath: IndexPath){
        
        if let action = screen?.sections?[indexPath.section].rows?[indexPath.row].action {
            if action.type == .submit {
                submit()
            }
        }
    }
    
    /* Desc: setupCell
     *
     * In this method, the developer is expected to inject custom content i.e. from an API/BE service
     * which should override the content picked up from the json configuraion file
     */
    
    public func setupCell(_ cell: CellPresentable, row: Row?, indexPath: IndexPath?) {
        
        guard let cellType = row?.type else { return }
        
        var viewModel: CellViewModelling? = nil
        
        let payload = Payload(content: row?.content)
        
        switch cellType {
            
        case .headerCell:
            viewModel = HeaderTextCellViewModel(row: row, payload: nil)
        case .inputCell:
            viewModel = InputCellViewModel(row: row, payload: payload, inputCallbackBlock: { [weak self] in
                
                self?.view?.update(with: indexPath)
                self?.updateData()
            })
        case .bodyTextCell:
            viewModel = BodyTextCellViewModel(row: row, payload: payload)
        case .singleActionButtonCell:
            viewModel = SingleActionButtonCellViewModel(row: row, payload: nil)
        case .paddingCell:
            viewModel = PaddingCellViewModel(row: row, payload: nil)
        case .separatorCell:
            return
        }
        
        if let viewModel = viewModel, let indexPath = indexPath {
            
            let result = RowAttribute(viewModel: viewModel, indexPath: indexPath)
            
            if let exists = rowAttributesList.filter({ $0?.indexPath == result.indexPath }).first {
                
                cell.setupCell(with: exists?.viewModel, delegate: self)
            } else {
                
                rowAttributesList.append(result)
                
                cell.setupCell(with: result.viewModel, delegate: self)
            }
        }
    }
    
    // Sends data back in real time (Messaging pattern)
    
    private func updateData() {
        
        asyncQueue.addOperation { [weak self] in
            
            guard let callBack = self?.dataCallbackBlock else { return }
            
            let dataList = self?.collectData(from: self?.rowAttributesList)
            
            if let jsonData = JSONUtilities.buildJSONStringFromArray(dataList) {
                
                DispatchQueue.main.async {
                    callBack(jsonData)
                }
            }
        }
    }
    
    private func collectData(from rowAttributesList: [RowAttribute?]?) -> ArrayOfDictionaries? {
        
        guard let rowAttributesList = rowAttributesList, rowAttributesList.count > 0 else { return nil }
        
        var dataList = ArrayOfDictionaries()
        var index = 0
        
        for attribute in rowAttributesList {
            
            if let viewModel = attribute?.viewModel as? Inputting {
                if let data = viewModel.data {
                    
                    var key = "index_\(index)"
                    
                    if let inputKey = viewModel.inputKey {
                        key = inputKey
                    }
                    
                    dataList.append([key : data])
                    
                    index += 1
                }
            }
        }
        
        return dataList.count > 0 ? dataList : nil
    }
    
    public func item(at indexPath: IndexPath) -> Row? {
        
        let section = indexPath.section
        let row = indexPath.row
        
        return screen?.sections?[section].rows?[row]
    }
    
    // Sends data back when requested (Polling pattern)
    
    public func submit() {
        
        var scrollToTopIndex: IndexPath? = nil
        let dataList = self.collectData(from: rowAttributesList)
        
        asyncQueue.addOperation { [unowned self] in
            
            for attribute in self.rowAttributesList {
                
                if let viewModel = attribute?.viewModel as? Inputting {
                    
                    if let isRequired = attribute?.viewModel.row?.isRequired, isRequired == true,
                        let indexPath = attribute?.indexPath, viewModel.data == nil {
                        
                        viewModel.setHighlighted(true)
                        if scrollToTopIndex == nil {
                            scrollToTopIndex = indexPath
                        }
                    }
                }
            }
            
            let jsonData = JSONUtilities.buildJSONStringFromArray(dataList)
            
            DispatchQueue.main.async { [unowned self] in
                
                if let scrollToTopIndex = scrollToTopIndex {
                    
                    self.view?.update(with: scrollToTopIndex)
                    self.view?.scrollToIndexPath(scrollToTopIndex)
                    
                    return
                }
                
                self.coordinator?.returnedData?(jsonData)
            }
        }
    }
}

extension TableViewPresenter: CellDelegate {}
