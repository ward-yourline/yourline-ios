//
//  HomeViewRouter.swift
//  YourLine
//
//  Created by Warrd Adlani on 29/08/2022.
//

import Foundation
import Domain
import UIKit
import Presentation
import Utility
import Services

class HomeViewRouter: HomeViewRouting {
    
    private weak var context: UIViewController?
    private let signUpContext = UINavigationController()
    private lazy var navigationContext = UINavigationController()
        
    required init(context: UIViewController?) {
        self.context = context
    }
    
    func start(insert: Bool = false) {
        let storyboard = UIStoryboard.init(name: StoryboardNames.homeView.name, bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: YourLineViews.homeView.name)
        
        if let view = view as? HomeViewing {
            let presenter = HomeViewPresenter(view: view, router: self)
        
            view.setPresenter(presenter)
        }
        
        view.addChild(navigationContext)
        
        // TEMP
        showBusinessDashboard()
        
        guard
            let context = context as? UINavigationController,
            let firstView = context.viewControllers.first
        else {
            return
        }
                
        context.setNavigationBarHidden(true, animated: false)
        if insert {
            context.setViewControllers([firstView, view], animated: true)
        } else {
            context.pushViewController(view, animated: true)
        }
    }
    
    func logout() {
        guard
            let context = context as? UINavigationController
        else {
            return
        }
        
        context.popToRootViewController(animated: true)
    }
    
    // MARK: Private
    private func showBusinessDashboard() {
        let router = BusinessDashboardRouter(context: navigationContext)
        router.start()
    }
}
