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
    case emailAndPassword = 4
    case complete = 5
    
    var name: String {
        switch self {
        case .user:
            return "Tell us about yourself"
        case .business:
            return "Your Business"
        case .verification:
            return  "Verification"
        case .emailAndPassword:
            return "Sign in details"
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
        
        // This needs to be streamlined. This method is creating the context and adding the view which is being rebuilt and added in didTapNextButton.
        let signInStoryboard = UIStoryboard.init(name: StoryboardNames.signUpView.name, bundle: Bundle.main)
        
        guard
            let signUpFieldView = signInStoryboard.instantiateViewController(withIdentifier: YourLineViews.signUpFieldView.name) as? SignUpFieldsViewController
        else {
            return
        }
        
        let viewModel = SignUpFieldsViewModel(viewType: .theUser, view: signUpFieldView)
        signUpFieldView.setViewModel(viewModel)
        
        context = UINavigationController(rootViewController: signUpFieldView)
        context?.navigationBar.isHidden = true
        addChild(context!)
        context?.view.frame = containerView.bounds
        context?.didMove(toParent: self)
        containerView.addSubview(context!.view)
    }
    
    @IBAction func didTapNextButton(_ sender: Any) {
        if page > 3 {
            let view = (context?.viewControllers.last as? EmailVerificationViewController)
            view?.openCompleteSignUpView()
            nextButton.setTitle("Continue", for: .normal)
        } else if page > 1 {
            showEmailVerification()
            nextButton.setTitle("Verify", for: .normal)
        } else {
            // This needs to be streamlined. Refer to comment in buildView
            let signInStoryboard = UIStoryboard.init(name: StoryboardNames.signUpView.name, bundle: Bundle.main)
            if
                let signUpFieldView = signInStoryboard.instantiateViewController(withIdentifier: YourLineViews.signUpFieldView.name) as? SignUpFieldsViewController {
            
                let viewModel = SignUpFieldsViewModel(viewType: .theBusiness, view: signUpFieldView)
                signUpFieldView.setViewModel(viewModel)
                
                context?.pushViewController(signUpFieldView, animated: true)
            }
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
