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
    private let signUpContext = UINavigationController()
    private weak var parentRouter: MainViewRouting?
        
    required init(context: UIViewController?, parentRouter: MainViewRouting?) {
        self.context = context
        self.parentRouter = parentRouter
    }
    
    func start() {
        guard let context = context as? UINavigationController else {
            return
        }
        
        let storyboard = UIStoryboard.init(name: StoryboardNames.signUpView.name, bundle: Bundle.main)
        guard
            let view = storyboard.instantiateViewController(withIdentifier: YourLineViews.selectUserView.name) as? SelectUserViewController
        else { return }
        
        view.setRouter(self)
                
        context.pushViewController(view, animated: true)
    }
    
    func openSignUp(with type: SignUpAccountType) {
        guard let context = context as? UINavigationController else {
            return
        }
        
        let storyboard = UIStoryboard.init(name: StoryboardNames.signUpView.name, bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: YourLineViews.signUpView.name) as! SignUpViewController
        
        view.setup(with: type, router: self)
        
        context.pushViewController(view, animated: true)
    }
    
    func showEmailVerification(in context: UINavigationController?) {
        let storyboard = UIStoryboard.init(name: StoryboardNames.signUpView.name, bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: YourLineViews.emailVerificationView.name)
        
        context?.pushViewController(view, animated: true)
    }
    
    func openSighUpFields(with state: SignUpView, and context: UINavigationController?) {
        let storyboard = UIStoryboard.init(name: StoryboardNames.signUpView.name, bundle: Bundle.main)
        
        guard
            let view = storyboard.instantiateViewController(withIdentifier: YourLineViews.signUpFieldView.name) as? SignUpFieldsViewController
        else {
            fatalError()
        }
        
        let viewModel = SignUpFieldsViewModel(viewType: state, view: view)
        view.setViewModel(viewModel)
        
        context?.pushViewController(view, animated: false)
    }
    
    func signIn() {
        parentRouter?.openHomeView(insert: true)
    }
}
