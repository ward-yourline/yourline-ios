//
//  SignInViewController.swift
//  yourline-ios
//
//  Created by Warrd Adlani on 15/04/2022.
//

import UIKit
import Presentation

class SignInViewController: UIViewController, SignInViewing {
    
    @IBOutlet weak var passwordField: TextField!
    @IBOutlet weak var emailField: TextField!
    
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
    
    @IBAction func didTapSignInButton(_ sender: Any) {
        
        let password = passwordField.text ?? ""
        let email = emailField.text ?? ""
        
        if email.contains("your@line.com"), password.contains("12345678") {
            presenter?.signIn()
        } else {
            showAlert(with: "Error", message: "Please enter an email and password")
        }
    }
    
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
    }
    
    func showAlert(with title: String, message: String) {
        
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        
        let okayAction = UIAlertAction(title: "Okay", style: .cancel)
        
        controller.addAction(okayAction)
        
        present(controller, animated: true)
    }
}
