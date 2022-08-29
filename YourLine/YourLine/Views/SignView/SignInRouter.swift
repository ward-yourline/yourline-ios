//
//  SignInRouter.swift
//  yourline-ios
//
//  Created by Warrd Adlani on 15/04/2022.
//

import Foundation
import UIKit
import Utility

class SignInRouter: SignInRouting {
    
    private weak var context: UIViewController?
    private weak var parentRouter: MainViewRouting?
    private lazy var childRouters = [Routing]()
    
    required init(context: UIViewController?, parentRouter: MainViewRouting?) {
        self.parentRouter = parentRouter
        self.context = context
    }
    
    func start() {
        let signInStoryboard = UIStoryboard.init(name: StoryboardNames.signInView.name, bundle: Bundle.main)
        let signInView = signInStoryboard.instantiateViewController(withIdentifier: YourLineViews.signInView.name)
        
        if let signInView = signInView as? SignInViewing {
            let presenter = SignInPresenter(router: self)
            signInView.setPresenter(presenter)
        }
        
        signInView.title = "Sign In"
        
        if let context = context as? UINavigationController {
            context.setNavigationBarHidden(true, animated: false)
            context.pushViewController(signInView, animated: true)
        }
    }
    
    func openHome() {
        parentRouter?.openHomeView()
    }
    
    func openSignUp() {
        let router = SignUpRouter(context: context)
        childRouters.append(router)
        router.start()
//        let presentationBundle = Bundle(identifier: "com.yourline.presentation")
//        let formViewStoryboard = UIStoryboard(name: "FormView", bundle: presentationBundle)
//        let formView = formViewStoryboard.instantiateViewController(withIdentifier: "FormViewController")
//
//        signInContext?.setNavigationBarHidden(false, animated: false)
//        signInContext?.pushViewController(formView, animated: true)
    }
}
