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

class HomeViewRouter: Routing {
    
    private weak var context: UIViewController?
    private let signUpContext = UINavigationController()
        
    required init(context: UIViewController?) {
        self.context = context
    }
    
    func start() {
        let storyboard = UIStoryboard.init(name: StoryboardNames.homeView.name, bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: YourLineViews.homeView.name)
        
        guard let context = context as? UINavigationController else {
            return
        }
        
        context.setNavigationBarHidden(true, animated: false)
        context.pushViewController(view, animated: true)
    }
}
