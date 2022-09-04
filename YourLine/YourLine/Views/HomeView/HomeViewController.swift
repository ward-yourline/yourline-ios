//
//  HomeViewController.swift
//  YourLine
//
//  Created by Warrd Adlani on 29/08/2022.
//

import UIKit
import Presentation

class MenuSelectionCell: UITableViewCell {
    
}

class MenuUserDetailsCell: UITableViewCell {
    
}

enum MenuSection: Int, CaseIterable {
    case user
    case options
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
            return 8
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
        }
        
        guard let cell = cell else {
            return UITableViewCell()
        }
        
        return cell
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
    
    @IBOutlet private weak var menuTableLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var menuTableDataSource: MenuTableDataSource?
    private var menuTableDelegate: MenuTableDelegate?
    private var hiddenMenuConstant: CGFloat = 0
    private var showingMenu = false
    
    private var presenter: HomeViewPresenting!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0)
        
        menuTableDelegate = MenuTableDelegate()
        menuTableDataSource = MenuTableDataSource()
        
        menuTableView.delegate = menuTableDelegate
        menuTableView.dataSource = menuTableDataSource
        
        let width = Int(menuView.frame.width)
        hiddenMenuConstant = -CGFloat(width + 16)
        
        showMenu(false, animated: false)
        
        presenter.viewDidLoad()
    }
    
    @IBAction func didTapMenuButton(_ sender: Any) {
        showMenu(!showingMenu)
    }
    
    private func showMenu(_ show: Bool, animated: Bool = true) {
        showingMenu = show
        menuTableLeadingConstraint.constant = show ? 0.0 : hiddenMenuConstant
        
        if animated == false { return }
        
        UIView.animate(withDuration: 0.25) { [unowned self] in
            self.view.layoutIfNeeded()
        }
    }
    
    func updateView() {
        tableView.reloadData()
    }
    
    func setPresenter(_ presenter: HomeViewPresenting) {
        self.presenter = presenter
    }
    
    func showError(with error: String) {
        // TODO
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard
            let section = HomeSections(rawValue: indexPath.section)
        else {
            return UITableViewCell()
        }
        
        var cell: UITableViewCell? = nil
        
        switch section {
        case .sales, .visits:
            cell = tableView.dequeueReusableCell(withIdentifier: "HomeSummaryCell", for: indexPath) as? HomeSummaryCell
            break
        case .alerts:
            cell = tableView.dequeueReusableCell(withIdentifier: "HomeAlertTableCell", for: indexPath) as? HomeAlertTableCell
        case .restock:
            cell = tableView.dequeueReusableCell(withIdentifier: "HomeRestockCell", for: indexPath) as? HomeRestockCell
        }
        
        if let cell = cell as? CellPresentable {
            presenter.setupCell(cell, at: indexPath)
        }
        
        guard let cell = cell else {
            return UITableViewCell()
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        guard
            let section = HomeSections(rawValue: section)
        else {
            return CGFloat.leastNormalMagnitude
        }
                
        switch section {
        case .sales, .visits, .alerts:
            return CGFloat.leastNormalMagnitude
        case .restock:
            return 16.0
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        guard
            let section = HomeSections(rawValue: section)
        else {
            return CGFloat.leastNormalMagnitude
        }
        
        switch section {
        case .sales, .visits, .alerts:
            return CGFloat.leastNormalMagnitude
        case .restock:
            return 16.0
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows(in: section)
    }
}
