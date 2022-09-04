//
//  ImageTitleCell.swift
//  YourLine
//
//  Created by Warrd Adlani on 04/09/2022.
//

import UIKit
import Utility
import SDWebImage

public struct ImageTitleCellViewModel: CellViewModelling {
    let information: String
    let imageName: String
}

final public class ImageTitleCell: UITableViewCell {

    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var informationLabel: UILabel!
    @IBOutlet private weak var containerView: UIView!
    
    public override func awakeFromNib() {
        
        super.awakeFromNib()
        
        dropShadow()
    }
    
    private func dropShadow(scale: Bool = true) {
        containerView.layer.masksToBounds = false
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.3
        containerView.layer.shadowOffset = CGSize(width: 0, height: 4)
        containerView.layer.shadowRadius = 4
    }
}

extension ImageTitleCell: CellPresentable {
    public func setupCell(with viewModel: CellViewModelling?, delegate: CellDelegate?) {
        
        guard let viewModel = viewModel as? ImageTitleCellViewModel else {
            return
        }
        
        informationLabel.text = viewModel.information
        if let image = UIImage(named: viewModel.imageName) {
            iconImageView.image = image
        }
    }
}
