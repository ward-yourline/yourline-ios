//
//  OrderDetailsTableCell.swift
//  Presentation
//
//  Created by Warrd Adlani on 25/09/2022.
//

import UIKit

public class OrderDetailsTableCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        dropShadow()

    }

    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func dropShadow(scale: Bool = true) {
        containerView.layer.masksToBounds = false
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.3
        containerView.layer.shadowOffset = CGSize(width: 0, height: 4)
        containerView.layer.shadowRadius = 4
    }
}
