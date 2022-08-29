//
//  MainViewRouter.swift
//  yourline-ios
//
//  Created by Warrd Adlani on 15/04/2022.
//

import Foundation
import UIKit
import Utility
import Resources

class MainViewRouter: MainViewRouting {
    
    private var context: UIViewController?
    private weak var window: UIWindow?
    private let mainNavigationContext = UINavigationController()
    private lazy var childRouters = {
        [Routing]()
    }()
    
    required init(window: UIWindow?) {
        context = UINavigationController()
        window?.rootViewController = context
        
        self.window?.rootViewController = context
        self.window?.makeKeyAndVisible()
        
        self.window = window
        
        initialise()
    }
    
    func start() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let mainView = storyboard.instantiateViewController(withIdentifier: YourLineViews.mainView.name)
                
        guard
            let newContext = mainView as? MainViewing
        else {
            return
        }
        
        newContext.addChildViews([mainNavigationContext])
        
        let router = SignInRouter(context: mainNavigationContext, parentRouter: self)
        router.start()

        childRouters.append(router)
        
        if let context = context as? UINavigationController {
            context.setNavigationBarHidden(true, animated: false)
            context.setViewControllers([mainView], animated: false)
        }
    }
    
    private func initialise() {
        Fonts.install()
    }
    
    func openHomeView() {
        let router = HomeViewRouter(context: mainNavigationContext)
        router.start()
        childRouters.append(router)
    }
}
