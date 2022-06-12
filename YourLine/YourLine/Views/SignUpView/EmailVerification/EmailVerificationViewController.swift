//
//  EmailVerificationViewController.swift
//  YourLine
//
//  Created by Warrd Adlani on 12/06/2022.
//

import UIKit

class EmailVerificationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let closeButton = UIBarButtonItem(title: "Close", style: .done, target: self, action: #selector(close))
//        closeButton.tintColor = .blue
//        navigationItem.leftBarButtonItem = closeButton
    }
    
    public func openAddEmailAndPassword() {
        performSegue(withIdentifier: "emailAndPasswordSegue", sender: self)
    }
    
    @objc private func close() {
        performSegue(withIdentifier: "unwindToSignIn", sender: self)
    }
}
