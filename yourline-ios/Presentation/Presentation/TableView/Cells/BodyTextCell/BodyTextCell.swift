//
//  BodyTextCell.swift
//  CheckOut
//
//  Created by Warrd Adlani on 27/03/2020.
//  Copyright © 2020 Warrd Adlani. All rights reserved.
//

import UIKit

class BodyTextCell: UITableViewCell {
    
    @IBOutlet weak var bodyTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        
        bodyTextView.textContainerInset = UIEdgeInsets.zero
        bodyTextView.textContainer.lineFragmentPadding = 0
    }
}

extension BodyTextCell: CellPresentable {
    func setupCell(with viewModel: CellViewModelling?, delegate: CellDelegate?) {
        
        guard let viewModel = viewModel as? BodyTextCellViewModel else { return }
        
        if let content = viewModel.content {
            let style = NSMutableParagraphStyle()
            
            style.lineHeightMultiple = 1.42
            
            let font = UIFont(name: "ProximaNova-Regular", size: 13)
            let attributes = [NSAttributedString.Key.paragraphStyle : style,
                              NSAttributedString.Key.font : font]
            bodyTextView.attributedText = NSAttributedString(string: content, attributes: attributes as [NSAttributedString.Key : Any])
            
            if viewModel.isBordered ?? false {
                let topPadding: CGFloat = 8.0
                let bottomPadding: CGFloat = 8.0
                let leftPadding: CGFloat = 8.0
                let rightPadding: CGFloat = 8.0
                
                bodyTextView.textContainerInset = UIEdgeInsets(top: topPadding, left: leftPadding, bottom: bottomPadding, right: rightPadding)
                bodyTextView.backgroundColor = #colorLiteral(red: 1, green: 0.9647058824, blue: 0.862745098, alpha: 1)
            } else {
                bodyTextView.textContainerInset = .zero
                bodyTextView.backgroundColor = .clear
            }
        }
    }
}
