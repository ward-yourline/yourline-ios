//
//  SignInPresenter.swift
//  YourLine
//
//  Created by Warrd Adlani on 24/04/2022.
//

import Foundation
import Domain
import Networking

class SignInPresenter: SignInPresenting {
    
    private weak var router: SignInRouting?
    private lazy var webService = WebService()
    private weak var view: SignInViewing?
    
    required init(router: SignInRouting, view: SignInViewing?) {
        self.router = router
        self.view = view
    }
    
    func signUp() {
        router?.openSignUp()
    }
    
    func signIn(with userName: String, and password: String)
    {
        view?.setIsBusy(true)
        webService.userSignIn(with: userName, and: password) { [weak self] user, error in
            if let user = user as? User {
                self?.router?.openHome()
            } else if let error = error as? NetworkError {
                switch error {
                case .invalidURL:
                    break
                case .noData:
                    break
                case .unknown:
                    break
                case .unautothorised(let error):
                    self?.view?.showAlert(with: "Error", message: error.localizedDescription)
                }
            }
            
            self?.view?.setIsBusy(false)
        }
        // Validate user, then open home
    }
}
