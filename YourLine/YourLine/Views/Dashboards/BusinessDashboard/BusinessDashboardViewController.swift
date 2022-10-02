//
//  BusinessDashboardViewController.swift
//  YourLine
//
//  Created by Warrd Adlani on 17/09/2022.
//

import UIKit
import Utility
import Presentation

class BusinessDashboardViewController: UIViewController, BusinessDashboardViewing {

    @IBOutlet private weak var tableView: UITableView!
    
    fileprivate var presenter: BusinessDashboardPresenting!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0)
        
        tableView.register(
            SalesSummaryTableCell.nib(),
            forCellReuseIdentifier: SalesSummaryTableCell.className
        )
        
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func setPresenter(_ presenter: BusinessDashboardPresenting) {
        self.presenter = presenter
    }
    
    func updateView() {
        tableView.reloadData()
    }
    
    func showError(with error: String) {
        
    }
}

extension BusinessDashboardViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard
            let section = BusinessDashboardSections(rawValue: indexPath.section)
        else {
            return UITableViewCell()
        }
        
        var cell: UITableViewCell? = nil
        
        switch section {
        case .sales, .visits:
            cell = tableView.dequeueReusableCell(withIdentifier: SalesSummaryTableCell.className, for: indexPath) as? SalesSummaryTableCell
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
            let section = BusinessDashboardSections(rawValue: section)
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
            let section = BusinessDashboardSections(rawValue: section)
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

extension BusinessDashboardViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRow(at: indexPath)
    }
}
