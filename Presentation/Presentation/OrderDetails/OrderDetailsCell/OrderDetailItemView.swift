//
//  OrderDetailItemCell.swift
//  Presentation
//
//  Created by Warrd Adlani on 25/09/2022.
//

import UIKit
import Utility
import Resources
import SnapKit

public class OrderDetailItemView: UIView {

    @IBOutlet weak var containerView: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)

        commonInit()
    }

    private func commonInit() {
        Self.instantiate(owner: self, bundle: Bundle(for: Self.self))
        containerView.frame = bounds
        addSubview(containerView)
        
        containerView.snp.makeConstraints { make in
            make.margins.equalToSuperview()
        }
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
