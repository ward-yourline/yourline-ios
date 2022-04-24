//
//  FormTableDataSource.swift
//  Presentation
//
//  Created by Warrd Adlani on 24/04/2022.
//

import Foundation
import UIKit

public class FormTableDataSource: NSObject, UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = "Cell: \(indexPath.row)"
        return cell
    }
}
