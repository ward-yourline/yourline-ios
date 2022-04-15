//
//  MainViewRouter.swift
//  yourline-ios
//
//  Created by Warrd Adlani on 15/04/2022.
//

import Foundation
import UIKit

class MainViewRouter: MainViewRouting {
    
    private var context: UIViewController?
    private weak var window: UIWindow?
    private lazy var childRouters = {
        [Routing]()
    }()
    
    required init(window: UIWindow?) {
        context = UINavigationController()
        window?.rootViewController = context
        
        self.window?.rootViewController = context
        self.window?.makeKeyAndVisible()
        
        self.window = window
    }
    
    func start() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let mainView = storyboard.instantiateViewController(withIdentifier: Views.mainView.name)
        
        let signInStoryboard = UIStoryboard.init(name: "SignInView", bundle: Bundle.main)
        let signInView = signInStoryboard.instantiateViewController(withIdentifier: Views.signInView.name)
        
        if let mainView = mainView as? MainViewing {
            mainView.addChildViews([signInView])
        }
        
        if let context = context as? UINavigationController {
            context.setViewControllers([mainView], animated: false)
        }
    }
}
