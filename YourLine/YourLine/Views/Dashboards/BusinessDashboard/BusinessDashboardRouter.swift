//
//  BusinessDashboardRouter.swift
//  YourLine
//
//  Created by Warrd Adlani on 17/09/2022.
//

import Foundation
import Domain
import UIKit
import Presentation
import Utility
import Services

class BusinessDashboardRouter: BusinessDashboardRouting {
    
    private weak var context: UIViewController?
    private let signUpContext = UINavigationController()
        
    required init(context: UIViewController?) {
        self.context = context
    }
    
    func start(insert: Bool = false) {
        let storyboard = UIStoryboard.init(name: StoryboardNames.businessDashboardView.name, bundle: Bundle.main)
        
        guard
            let view = storyboard.instantiateViewController(withIdentifier: YourLineViews.businessDashboardView.name) as? BusinessDashboardViewing
        else {
            fatalError()
        }
        
        let interactor = BusinessDashboardInteractor()
        let presenter = BusinessDashboardPresenter(view: view, interactor: interactor, router: self)
        
        view.setPresenter(presenter)
        
        guard
            let context = context as? UINavigationController,
            let view = view as? UIViewController
        else {
            return
        }
                
        context.setNavigationBarHidden(true, animated: false)
        context.pushViewController(view, animated: false)
    }
    
    func openOrderDetails() {
        let router = OrderDetailsRouter(context: context)
        router.start()
    }
    
    func logout() {
        guard
            let context = context as? UINavigationController
        else {
            return
        }
        
        context.popToRootViewController(animated: true)
    }
}

