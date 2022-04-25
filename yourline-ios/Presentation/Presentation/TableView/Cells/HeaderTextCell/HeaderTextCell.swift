//
//  HeaderTextCell.swift
//  CheckOut
//
//  Created by Warrd Adlani on 27/03/2020.
//  Copyright © 2020 Warrd Adlani. All rights reserved.
//

import UIKit

class HeaderTextCell: UITableViewCell {
    
    @IBOutlet private weak var subheaderTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        subheaderTextView.textContainer.lineFragmentPadding = 0
    }
}

extension HeaderTextCell: CellPresentable {
    func setupCell(with viewModel: CellViewModelling?, delegate: CellDelegate?) {
        
        guard let viewModel = viewModel as? HeaderTextCellViewModel else { return }
        
        if let content = viewModel.content {
            let style = NSMutableParagraphStyle()
            
            style.lineHeightMultiple = 1.42
            style.alignment = viewModel.alignment
            
            var font: UIFont? = UIFont(name: "ProximaNova-Semibold", size: 24)
            
            switch viewModel.headerType {
            case .largeHeader:
                font = UIFont(name: "ProximaNova-Bold", size: 30)
            case .normalHeader:
                font = UIFont(name: "ProximaNova-Semibold", size: 24)
            case.subHeader:
                font = UIFont(name: "ProximaNova-Bold", size: 13)
            case .none:
                break
            }
            
            let attributes = [NSAttributedString.Key.paragraphStyle : style,
                              NSAttributedString.Key.font : font]
            subheaderTextView.attributedText = NSAttributedString(string: content, attributes: attributes as [NSAttributedString.Key : Any])
            
            if viewModel.isBordered ?? false {
                let topPadding: CGFloat = 8.0
                let bottomPadding: CGFloat = 0.0
                let leftPadding: CGFloat = 8.0
                let rightPadding: CGFloat = 8.0
                
                subheaderTextView.textContainerInset = UIEdgeInsets(top: topPadding, left: leftPadding, bottom: bottomPadding, right: rightPadding)
                subheaderTextView.backgroundColor = #colorLiteral(red: 1, green: 0.9647058824, blue: 0.862745098, alpha: 1)
            } else {
                subheaderTextView.textContainerInset = .zero
                subheaderTextView.backgroundColor = .clear
            }
        }
    }
}
