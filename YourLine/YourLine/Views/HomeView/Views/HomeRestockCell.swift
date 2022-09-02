//
//  HomeRestockCell.swift
//  YourLine
//
//  Created by Warrd Adlani on 02/09/2022.
//

import UIKit
import Presentation

class HomeRestockCell: UITableViewCell {

    @IBOutlet private weak var containerView: UIView!
    
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

extension HomeRestockCell: CellPresentable {
    func setupCell(with viewModel: CellViewModelling?, delegate: CellDelegate?) {
        // TODO
    }
}
