//
//  SignUpViewController.swift
//  YourLine
//
//  Created by Warrd Adlani on 12/06/2022.
//

import UIKit
import Utility

enum SignUpStepName: Int {
    case user = 1
    case business = 2
    case verification = 3
    case complete = 4
    
    var name: String {
        switch self {
        case .user:
            return "Tell us about yourself"
        case .business:
            return "Your Business"
        case .verification:
            return  "Verification"
        case .complete:
            return "Complete"
        }
    }
}

class SignUpViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet var pageViews: [UILabel]!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    private var context: UINavigationController?
    private var page = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        buildView()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func buildView() {
        let signInStoryboard = UIStoryboard.init(name: StoryboardNames.signUpView.name, bundle: Bundle.main)
        let signUpFieldView = signInStoryboard.instantiateViewController(withIdentifier: YourLineViews.signUpFieldView.name)
        
        context = UINavigationController(rootViewController: signUpFieldView)
        context?.navigationBar.isHidden = true
        addChild(context!)
        context?.view.frame = containerView.bounds
        context?.didMove(toParent: self)
        containerView.addSubview(context!.view)
    }
    
    @IBAction func didTapNextButton(_ sender: Any) {
        if page > 2 {
            let view = (context?.viewControllers.last as? EmailVerificationViewController)
            view?.openCompleteSignUpView()
            nextButton.setTitle("Continue", for: .normal)
        }
         else if page > 1 {
            showEmailVerification()
            nextButton.setTitle("Verify", for: .normal)
        } else {
            
            let signInStoryboard = UIStoryboard.init(name: StoryboardNames.signUpView.name, bundle: Bundle.main)
            let signUpFieldView = signInStoryboard.instantiateViewController(withIdentifier: YourLineViews.signUpFieldView.name)
            
            context?.pushViewController(signUpFieldView, animated: true)
        }
        updatePage()
    }
    
    private func updatePage() {
        let darkBlueHex = "#89BAC9"
        let lightBlueHex = "#5C9CAF"
        
        for i in 0...4 {
            let color = page < i ? UIColor(hexString: darkBlueHex) : UIColor(hexString: lightBlueHex)
            let view = pageViews[i]
            view.backgroundColor = color
        }
        page += 1
        
        if let title = SignUpStepName(rawValue: page)?.name {
            titleLabel.text = title
        }
    }
    
    private func showEmailVerification() {
        let signInStoryboard = UIStoryboard.init(name: StoryboardNames.signUpView.name, bundle: Bundle.main)
        let emailVerificationView = signInStoryboard.instantiateViewController(withIdentifier: YourLineViews.emailVerificationView.name)
        
        context?.pushViewController(emailVerificationView, animated: true)
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
