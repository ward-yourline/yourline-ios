//
//  HomeViewController.swift
//  YourLine
//
//  Created by Warrd Adlani on 29/08/2022.
//

import UIKit
import Presentation

class HomeViewController: UIViewController, HomeViewing {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var presenter: HomeViewPresenting!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0)
        
        presenter.viewDidLoad()
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
        return CGFloat.leastNonzeroMagnitude
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        guard
            let section = HomeSections(rawValue: section)
        else {
            return CGFloat.leastNonzeroMagnitude
        }
                
        switch section {
        case .sales, .visits, .alerts:
            return CGFloat.leastNonzeroMagnitude
        case .restock:
            return 16.0
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        guard
            let section = HomeSections(rawValue: section)
        else {
            return CGFloat.leastNonzeroMagnitude
        }
        
        switch section {
        case .sales, .visits, .alerts:
            return CGFloat.leastNonzeroMagnitude
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
