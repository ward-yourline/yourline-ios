//
//  SeparatorCell.swift
//  CheckOut
//
//  Created by Warrd Adlani on 24/04/2020.
//  Copyright © 2020 Warrd Adlani. All rights reserved.
//

import UIKit
import Utility

class SeparatorCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension SeparatorCell: FormCellPresentable {
    
    func setupCell(with viewModel: FormCellViewModelling?, delegate: CellDelegate?) {}
}
