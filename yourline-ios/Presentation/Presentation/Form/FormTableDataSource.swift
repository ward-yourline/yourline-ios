//
//  FormTableDataSource.swift
//  Presentation
//
//  Created by Warrd Adlani on 24/04/2022.
//

import Foundation
import UIKit

public class FormTableDataSource: NSObject, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
