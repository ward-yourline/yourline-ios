//
//  SignUpInputFieldCell.swift
//  YourLine
//
//  Created by Warrd Adlani on 29/08/2022.
//

import UIKit

class SignUpInputFieldCell: UITableViewCell {

    @IBOutlet private weak var fieldNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setupCell(with string: String?) {
        fieldNameLabel.text = string
    }
}
