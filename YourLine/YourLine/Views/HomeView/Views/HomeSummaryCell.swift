//
//  HomeSummaryCell.swift
//  YourLine
//
//  Created by Warrd Adlani on 29/08/2022.
//

import UIKit
import Presentation
import Domain

struct HomeSummaryCellViewModel: CellViewModelling {
    
    let title: String?
    let value: String?
    let summary: String?
    let points: String?
    
    init(title: String?, value: String?, summary: String?, points: String?) {
        self.title = title
        self.value = value
        self.summary = summary
        self.points = points
    }
}

class HomeSummaryCell: UITableViewCell {

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var valueLabel: UILabel!
    @IBOutlet private weak var summaryLabel: UILabel!
    
    @IBOutlet private weak var pointsImageView: UIImageView!
    @IBOutlet private weak var pointsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        containerView.layer.shadowColor = UIColor.black.cgColor
//        containerView.layer.shadowOpacity = 1
//        containerView.layer.shadowOffset = CGSize(width: 4, height: 4)
//        containerView.layer.shadowRadius = 10
        
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

extension HomeSummaryCell: CellPresentable {
    
    func setupCell(with viewModel: CellViewModelling?, delegate: CellDelegate?) {
        guard
            let viewModel = viewModel as? HomeSummaryCellViewModel
        else {
            return
        }
        
        titleLabel.text = viewModel.title
        valueLabel.text = viewModel.value
        summaryLabel.text = viewModel.summary
        pointsLabel.text = viewModel.points
    }
}
