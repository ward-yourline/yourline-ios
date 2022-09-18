//
//  OrderDetailsRouter.swift
//  YourLine
//
//  Created by Warrd Adlani on 18/09/2022.
//

import Foundation
import Domain
import UIKit
import Presentation
import Utility
import Services

class OrderDetailsRouter: OrderDetailsProtocols {

    private weak var context: UIViewController?
        
    required init(context: UIViewController?) {
        self.context = context
    }
    
    func start(insert: Bool = false) {
        
        let storyboard = UIStoryboard.init(
            name: StoryboardNames.orderDetailsView.name,
            bundle: Bundle.main
        )
        
        guard
            let view = storyboard.instantiateViewController(
                withIdentifier: YourLineViews.orderDetailsView.name
            ) as? OrderDetailsViewing
        else {
            fatalError()
        }
        
        guard
            let context = context as? UINavigationController,
            let view = view as? UIViewController
        else {
            return
        }
        
        context.pushViewController(view, animated: true)
    }
}


