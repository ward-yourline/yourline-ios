//
//  OrdersViewController.swift
//  YourLine
//
//  Created by Warrd Adlani on 18/09/2022.
//

import UIKit
import Presentation

class OrderDetailsViewController: UIViewController, OrderDetailsViewing {

    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: OrderDetailsViewModelling!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(OrderDetailsTableCell.nib(), forCellReuseIdentifier: OrderDetailsTableCell.className)
        
        viewModel.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func set(viewModel: OrderDetailsViewModelling) {
        self.viewModel = viewModel
    }
    
    func updateView() {
        tableView.reloadData()
    }
}

extension OrderDetailsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        if let section = OrdersViewSection(rawValue: indexPath.section) {
//            switch section {
//            case .summary:
//                let cell = tableView.dequeueReusableCell(withIdentifier: SalesSummaryTableCell.className, for: indexPath)
//
//                if let cell = cell as? CellPresentable {
//                    viewModel.setupCell(cell, at: indexPath)
//                }
//
//                return cell
//            case .orders:
//                let cell = tableView.dequeueReusableCell(withIdentifier: OrderExcerptTableCell.className, for: indexPath)
//
//                if let cell = cell as? CellPresentable {
//                    viewModel.setupCell(cell, at: indexPath)
//                }
//
//                return cell
//            }
//        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: OrderDetailsTableCell.className, for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        guard
//            let section = BusinessDashboardSections(rawValue: section)
//        else {
//            return CGFloat.leastNormalMagnitude
//        }
//
//        switch section {
//        case .sales, .visits, .alerts:
//            return CGFloat.leastNormalMagnitude
//        case .restock:
//            return 16.0
//        }
        return 16.0
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
//        guard
//            let section = BusinessDashboardSections(rawValue: section)
//        else {
//            return CGFloat.leastNormalMagnitude
//        }
//
//        switch section {
//        case .sales, .visits, .alerts:
//            return CGFloat.leastNormalMagnitude
//        case .restock:
//            return 16.0
//        }
        
        return 16.0
    }
}

extension OrderDetailsViewController: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
}
