//
//  MainViewRouter.swift
//  yourline-ios
//
//  Created by Warrd Adlani on 15/04/2022.
//

import Foundation
import UIKit

class MainViewRouter: MainViewRouting {
    
    private weak var context: UIViewController?
    private weak var window: UIWindow?
    private lazy var childRouters = {
        [Routing]()
    }()
    
    required init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: Views.mainView.name)
        
        if let viewController = viewController as? MainViewing {
            viewController.addChildViews(nil)
        }
        
        let navigationController = UINavigationController(rootViewController: viewController)
        
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
}
