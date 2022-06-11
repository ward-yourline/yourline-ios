//
//  SignUpRouter.swift
//  YourLine
//
//  Created by Warrd Adlani on 11/06/2022.
//

import Foundation
import Domain
import UIKit
import Presentation
import Utility
import Services

class SignUpRouter: Routing {
    
    private weak var context: UIViewController?
        
    required init(context: UIViewController?) {
        
        self.context = context
    }
    
    func start() {

        let signInStoryboard = UIStoryboard.init(name: StoryboardNames.signUpView.name, bundle: Bundle.main)
        let signInView = signInStoryboard.instantiateViewController(withIdentifier: YourLineViews.signUpView.name)
        
        guard let context = context as? UINavigationController else {
            return
        }
        
        context.pushViewController(signInView, animated: true)
    }
}
