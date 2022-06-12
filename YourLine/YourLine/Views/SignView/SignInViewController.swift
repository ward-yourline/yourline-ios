//
//  SignInViewController.swift
//  yourline-ios
//
//  Created by Warrd Adlani on 15/04/2022.
//

import UIKit

class SignInViewController: UIViewController, SignInViewing {
    
    private var presenter: SignInPresenting?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func setPresenter(_ presenter: SignInPresenter?) {
        self.presenter = presenter
    }

    @IBAction func didTapSignUpButton(_ sender: Any) {
        presenter?.signUp()
    }
    
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
        
    }
}
