import UIKit

class TableViewController: UIViewController, TableViewing {
    
    // MARK: - Public properties
    
    public var presenter: TableViewPresenting! {
        
        didSet {
            tableViewDataSource = TableViewDataSource(presenter: presenter)
            tableViewDelegate = TableViewDelegate(presenter: presenter)
        }
    }
    
    // MARK: IBOutlets (private)
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: Private properties
    
    private var tableViewDataSource: TableViewDataSource?
    private var tableViewDelegate: TableViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
        presenter.viewDidLoad()
    }
    
    public func viewReady() {
        
        title = presenter.title
        
        var contentInset = tableView.contentInset
        
        contentInset.top = presenter.topContentInset
        contentInset.bottom = presenter.bottomContentInset
        
        tableView.contentInset = contentInset
        tableView.separatorColor = presenter.hasSeparators ? #colorLiteral(red: 0.768627451, green: 0.7843137255, blue: 0.8, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        tableView.separatorInset = UIEdgeInsets(
            top: PaddingSize.none.convertToCGFloat(),
            left: PaddingSize.medium.convertToCGFloat(),
            bottom: PaddingSize.none.convertToCGFloat(),
            right: PaddingSize.medium.convertToCGFloat()
        )
        tableView.keyboardDismissMode = .onDrag
        tableView.reloadData()
    }
    
    private func setupTableView() {
        
        tableView.delegate = tableViewDelegate
        tableView.dataSource = tableViewDataSource
        
        tableView.register(HeaderTextCell.nib(), forCellReuseIdentifier: HeaderTextCell.className)
        tableView.register(InputCell.nib(), forCellReuseIdentifier: InputCell.className)
        tableView.register(BodyTextCell.nib(), forCellReuseIdentifier: BodyTextCell.className)
        tableView.register(SingleActionButtonCell.nib(), forCellReuseIdentifier: SingleActionButtonCell.className)
        tableView.register(PaddingCell.nib(), forCellReuseIdentifier: PaddingCell.className)
        tableView.register(HeaderTextCell.nib(), forCellReuseIdentifier: HeaderTextCell.className)
        tableView.register(SeparatorCell.nib(), forCellReuseIdentifier: SeparatorCell.className)
        
        tableView.tableFooterView = UIView()
    }
    
    func scrollToIndexPath(_ indexPath: IndexPath) {

        tableView.scrollToRow(at: indexPath, at: .middle, animated: true)
    }
    
    func update(with indexPath: IndexPath?) {
        
        if let indexPath = indexPath {
            tableView.reloadRows(at: [indexPath], with: .none)
        }
    }
}
