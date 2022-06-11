//
//  TableViewDelegate.swift
//  CheckOut
//
//  Created by Warrd Adlani on 23/04/2020.
//  Copyright © 2020 Warrd Adlani. All rights reserved.
//

import UIKit

class TableViewDelegate: NSObject, UITableViewDelegate {
    
    private weak var presenter: TableViewPresenting!
    
    init(presenter: TableViewPresenting) {
        
        self.presenter = presenter
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        presenter.actionAtIndexPath(indexPath)
    }
}
