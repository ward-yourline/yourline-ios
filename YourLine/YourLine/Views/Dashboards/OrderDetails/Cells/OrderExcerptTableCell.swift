//
//  OrderExcerptTableCell.swift
//  YourLine
//
//  Created by Warrd Adlani on 18/09/2022.
//

import UIKit
import Presentation
import Utility

class OrderExcerptTableCell: UITableViewCell {

    @IBOutlet private weak var containerView: UIView!
    
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var orderNumberLabel: UILabel!
    @IBOutlet private weak var orderPriceLabel: UILabel!
    @IBOutlet private weak var orderTimeLabel: UILabel!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        dropShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func dropShadow(scale: Bool = true) {
        containerView.layer.masksToBounds = false
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.3
        containerView.layer.shadowOffset = CGSize(width: 0, height: 4)
        containerView.layer.shadowRadius = 4
    }
}

extension OrderExcerptTableCell: CellPresentable {
    func setupCell(with viewModel: CellViewModelling?, delegate: CellDelegate?) {
        guard let viewModel = viewModel as? OrdersExcerptViewModel else {
            return
        }
        
        userNameLabel.text = viewModel.customerName
        orderNumberLabel.text = "#\(viewModel.orderNumber)"
        orderPriceLabel.text = viewModel.price
        orderTimeLabel.text = viewModel.time
    }
}
