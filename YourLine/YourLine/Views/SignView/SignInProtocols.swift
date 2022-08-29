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

protocol SignInViewing {
    func setPresenter(_ presenter: SignInPresenter?)
}

protocol SignInPresenting {
    
    init(router: SignInRouting)
    
    func signUp()
    func signIn()
}
