//
//  HomeViewController.swift
//  YourLine
//
//  Created by Warrd Adlani on 29/08/2022.
//

import UIKit
import Presentation
import Resources
import Utility

class MenuSelectionCell: UITableViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    func setup(with state: MenuOption) {
        iconImageView.image = state.image
        titleLabel.text = state.title
    }
}

class MenuUserDetailsCell: UITableViewCell {}

enum MenuSection: Int, CaseIterable {
    case user
    case options
}

enum MenuOption: Int, CaseIterable {
    
    case home
    case products
    case customers
    case staff
    case account
    case termsAndConditions
    case settings
    case yourLine
    
    public var image: UIImage? {
        var imageName = ""
        switch self {
        case .home:
            imageName = "home"
        case .products:
            imageName = "basket"
        case .customers:
            imageName = "people"
        case .staff:
            imageName = "search"
        case .account:
            imageName = "account"
        case .termsAndConditions:
            imageName = "question"
        case .settings:
            imageName = "cog"
        case .yourLine:
            imageName = "refresh"
        }
        let image = UIImage(named: imageName, in: Bundle(identifier: BundleNames.resources.rawValue), compatibleWith: nil)
        return image
    }
    public var title: String {
        switch self {
        case .home:
            return "Home"
        case .products:
            return "Products"
        case .customers:
            return "Customers"
        case .staff:
            return "Staff"
        case .account:
            return "Account"
        case .termsAndConditions:
            return "Terms & Conditions"
        case .settings:
            return "Settings"
        case .yourLine:
            return "Your Line"
        }
    }
}

class MenuTableDataSource: NSObject, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return MenuSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard
            let section = MenuSection(rawValue: section)
        else {
            return 0
        }
        
        switch section {
        case .user:
            return 1
        case .options:
            return MenuOption.allCases.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let section = MenuSection(rawValue: indexPath.section)
        else {
            return UITableViewCell()
        }
        
        var cell: UITableViewCell? = nil
        
        switch section {
        case .user:
            cell = tableView.dequeueReusableCell(withIdentifier: "MenuUserDetailsCell")
        case .options:
            cell = tableView.dequeueReusableCell(withIdentifier: "MenuSelectionCell")
            setupSelectionCell(cell as! MenuSelectionCell, at: indexPath.row)
        }
        
        guard let cell = cell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    private func setupSelectionCell(_ cell: MenuSelectionCell, at row: Int) {
        
        guard
            let row = MenuOption(rawValue: row)
        else {
            return
        }
        
        cell.setup(with: row)
    }
}

class MenuTableDelegate: NSObject, UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO
    }
}

class HomeViewController: UIViewController, HomeViewing {
    
    @IBOutlet private weak var menuView: UIView!
    @IBOutlet private weak var menuTableView: UITableView!
    
    @IBOutlet private weak var contentContainerView: UIView!
    @IBOutlet private weak var menuTableLeadingConstraint: NSLayoutConstraint!
    
    private var menuTableDataSource: MenuTableDataSource?
    private var menuTableDelegate: MenuTableDelegate?
    private var hiddenMenuConstant: CGFloat = 0
    private var showingMenu = false
    
    private var presenter: HomeViewPresenting!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuTableDelegate = MenuTableDelegate()
        menuTableDataSource = MenuTableDataSource()
        
        menuTableView.delegate = menuTableDelegate
        menuTableView.dataSource = menuTableDataSource
        
        let width = Int(menuView.frame.width)
        hiddenMenuConstant = -CGFloat(width + 16)
        
        showMenu(false, animated: false)
        menuView.isHidden = true
        
        presenter.viewDidLoad()
    }
    
    @IBAction func didTapMenuButton(_ sender: Any) {
        showMenu(!showingMenu)
    }
    
    @IBAction func didTapLogoutButton(_ sender: Any) {
        presenter.logout()
    }
    
    override func addChild(_ childController: UIViewController) {
        view.layoutSubviews()
        super.addChild(childController)
        childController.didMove(toParent: self)
        childController.view.frame = contentContainerView.bounds
        contentContainerView.addSubview(childController.view)
    }
    
    private func showMenu(_ show: Bool, animated: Bool = true) {
        showingMenu = show
        menuView.isHidden = false

        menuTableLeadingConstraint.constant = show ? 0.0 : hiddenMenuConstant
        
        if animated == false { return }
        
        UIView.animate(withDuration: 0.25) { [unowned self] in
            self.view.layoutIfNeeded()
        }
    }
    
    func updateView() {
    }
    
    func setPresenter(_ presenter: HomeViewPresenting) {
        self.presenter = presenter
    }
    
    func showError(with error: String) {
        // TODO
    }
}

