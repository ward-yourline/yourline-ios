//
//  SignInPresenter.swift
//  YourLine
//
//  Created by Warrd Adlani on 24/04/2022.
//

import Foundation

class SignInPresenter: SignInPresenting {
    
    private weak var router: SignInRouting?
    
    required init(router: SignInRouting) {
        self.router = router
    }
    
    func signUp() {
        router?.openSignUp()
    }
    
    func signIn() {
        // Validate user, then open home
        router?.openHome()
    }
}
