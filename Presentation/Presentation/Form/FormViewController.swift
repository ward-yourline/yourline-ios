//
//  FormViewController.swift
//  Presentation
//
//  Created by Warrd Adlani on 24/04/2022.
//

import UIKit

public final class FormViewController: UIViewController {
    
    @IBOutlet private var tableView: UITableView!
    
    // TODO: Will be moved to presenter
    private let tableDelegate = FormTableDelegate()
    private let tableDataSource = FormTableDataSource()

    public override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = tableDelegate
        tableView.dataSource = tableDataSource
    }
}
