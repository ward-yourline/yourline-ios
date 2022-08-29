//
//  HomeViewController.swift
//  YourLine
//
//  Created by Warrd Adlani on 29/08/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0)
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeSummaryCell", for: indexPath) as? HomeSummaryCell
        else {
            return UITableViewCell()
        }
        
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
}
