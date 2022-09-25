//
//  OrderDetailsTableCell.swift
//  Presentation
//
//  Created by Warrd Adlani on 25/09/2022.
//

import UIKit
import Resources
import SnapKit

public class OrderDetailsTableCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var itemStackView: UIStackView!
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        dropShadow()

        for _ in 0...5 {
            let itemView = OrderDetailItemView(frame: CGRect.zero)
            itemStackView.addArrangedSubview(itemView)
        }
    }
    
    func dropShadow(scale: Bool = true) {
        containerView.layer.masksToBounds = false
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.3
        containerView.layer.shadowOffset = CGSize(width: 0, height: 4)
        containerView.layer.shadowRadius = 4
    }
}
