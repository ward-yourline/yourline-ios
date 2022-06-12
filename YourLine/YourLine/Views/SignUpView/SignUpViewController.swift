//
//  SignUpViewController.swift
//  YourLine
//
//  Created by Warrd Adlani on 12/06/2022.
//

import UIKit
import Utility

class SignUpViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        buildView()
    }
    
    func buildView() {
        let signInStoryboard = UIStoryboard.init(name: StoryboardNames.signUpView.name, bundle: Bundle.main)
        let signUpFieldView = signInStoryboard.instantiateViewController(withIdentifier: "SignUpFieldsViewController")
        
        addChild(signUpFieldView)
        signUpFieldView.view.frame = containerView.bounds
        signUpFieldView.didMove(toParent: self)
        containerView.addSubview(signUpFieldView.view)
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
