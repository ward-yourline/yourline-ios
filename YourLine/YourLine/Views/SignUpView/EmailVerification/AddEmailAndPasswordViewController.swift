//
//  AddEmailAndPasswordViewController.swift
//  YourLine
//
//  Created by Warrd Adlani on 12/06/2022.
//

import UIKit

class AddEmailAndPasswordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    public func openCompleteSignUpView() {
        performSegue(withIdentifier: "signUpCompleteSegue", sender: self)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
