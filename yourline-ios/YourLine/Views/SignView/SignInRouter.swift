//
//  SignInRouter.swift
//  yourline-ios
//
//  Created by Warrd Adlani on 15/04/2022.
//

import Foundation
import UIKit

class SignInRouter: SignInRouting {
    
    private weak var context: UIViewController?
    private var signInContext: UINavigationController?
    
    required init(context: UIViewController?) {
        self.context = context
    }
    
    func start() {
        let signInStoryboard = UIStoryboard.init(name: "SignInView", bundle: Bundle.main)
        let signInView = signInStoryboard.instantiateViewController(withIdentifier: YourLineViews.signInView.name)
        
        if let signInView = signInView as? SignInViewing {
            let presenter = SignInPresenter(router: self)
            signInView.setPresenter(presenter)
        }
        
        signInView.title = "Sign In"
        
        let navigationController = UINavigationController(rootViewController: signInView)
        navigationController.setNavigationBarHidden(true, animated: false)
        signInContext = navigationController
        
        if let context = context as? MainViewing {
            context.addChildViews([navigationController])
        }
    }
    
    func openSignUp() {
        let presentationBundle = Bundle(identifier: "com.yourline.presentation")
        let formViewStoryboard = UIStoryboard(name: "FormView", bundle: presentationBundle)
        let formView = formViewStoryboard.instantiateViewController(withIdentifier: "FormViewController")
        
        signInContext?.pushViewController(formView, animated: true)
    }
}
