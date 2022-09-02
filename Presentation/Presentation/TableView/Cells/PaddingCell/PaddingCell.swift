//
//  PaddingCell.swift
//  CheckOut
//
//  Created by Warrd Adlani on 27/03/2020.
//  Copyright © 2020 Warrd Adlani. All rights reserved.
//

import UIKit
import Utility

class PaddingCell: UITableViewCell {

    @IBOutlet private weak var paddingHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
    }
}

extension PaddingCell: FormCellPresentable {
    
    func setupCell(with viewModel: FormCellViewModelling?, delegate: CellDelegate?) {
        
        guard let viewModel = viewModel as? PaddingCellViewModel,
            let height = viewModel.height?.convertToCGFloat()
              else { return }
        
        paddingHeight.constant = CGFloat(height)
    }
}
