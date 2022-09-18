//
//  OrdersViewController.swift
//  YourLine
//
//  Created by Warrd Adlani on 18/09/2022.
//

import UIKit

class OrdersViewController: UIViewController, OrderDetailsViewing {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}

extension OrdersViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: OrderExcerptTableCell.className, for: indexPath)
        
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

extension OrdersViewController: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
}
