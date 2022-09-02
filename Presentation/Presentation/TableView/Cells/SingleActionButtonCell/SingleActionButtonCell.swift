//
//  SingleActionButtonCell.swift
//  CheckOut
//
//  Created by Warrd Adlani on 26/03/2020.
//  Copyright © 2020 Warrd Adlani. All rights reserved.
//

import UIKit
import Utility

class SingleActionButtonCell: UITableViewCell {
    
    @IBOutlet weak var submitButton: UIButton!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        
        // Update button state for selection
    }
}

extension SingleActionButtonCell: FormCellPresentable {
    
    func setupCell(with viewModel: FormCellViewModelling?, delegate: CellDelegate?) {
        
        guard let viewModel = viewModel as? SingleActionButtonCellViewModel else { return }
        
        submitButton.setTitle(viewModel.content, for: .normal)
    }
}
