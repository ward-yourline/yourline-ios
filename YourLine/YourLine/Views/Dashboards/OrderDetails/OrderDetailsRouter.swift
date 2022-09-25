//
//  OrdersRouter.swift
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

class OrderDetailsRouter: OrderDetailsRouting {

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
        
        let viewModel = OrderDetailsViewModel(view: view, router: self)
        
        view.set(viewModel: viewModel)
        
        guard
            let context = context as? UINavigationController,
            let view = view as? UIViewController
        else {
            return
        }
        
        context.setNavigationBarHidden(false, animated: false)
        context.navigationBar.backgroundColor = .clear
        context.navigationBar.shadowImage = UIImage()
        
        context.pushViewController(view, animated: true)
    }
    
}


