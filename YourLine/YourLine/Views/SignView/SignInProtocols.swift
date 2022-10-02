//
//  SignInProtocols.swift
//  yourline-ios
//
//  Created by Warrd Adlani on 15/04/2022.
//

import Foundation
import UIKit
import Utility

protocol SignInRouting: Routing {
    
    init(context: UIViewController?, parentRouter: MainViewRouting?)
    
    func start()
    
    func openSignUp()
    func openHome()
}

protocol SignInViewing: AnyObject {
    func setPresenter(_ presenter: SignInPresenter?)
    func showAlert(with title: String, message: String)
    func setIsBusy(_ isBusy: Bool)
}

protocol SignInPresenting {
    
    init(router: SignInRouting, view: SignInViewing?)
    func signUp()
    func signIn(with userName: String, and password: String)
}
