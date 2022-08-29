//
//  SignUpFieldsViewController.swift
//  YourLine
//
//  Created by Warrd Adlani on 12/06/2022.
//

import UIKit

class SignUpFieldsViewController: UIViewController {
   
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: SignUpFieldsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func updateView() {
        tableView.reloadData()
    }

    func setViewModel(_ viewModel: SignUpFieldsViewModel) {
        
        self.viewModel = viewModel
    }
}

extension SignUpFieldsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SignUpInputFieldCell", for: indexPath)
        
        return cell
    }
}

extension SignUpFieldsViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
}
