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
    @IBOutlet var pageViews: [UILabel]!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    private var context: UINavigationController?
    private var page = 1
    private var signUpType: SignUpAccountType = .business
    private var router: SignUpRouter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initialSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func setup(with signUpType: SignUpAccountType, router: SignUpRouter) {
        self.signUpType = signUpType
        self.router = router
    }
    
    func initialSetup() {
        context = UINavigationController()
        context?.navigationBar.isHidden = true
        
        addChild(context!)
        context?.view.frame = containerView.bounds
        context?.didMove(toParent: self)
        containerView.addSubview(context!.view)
        
        router?.openSighUpFields(with: .theUser, and: context)
    }
    
    @IBAction func didTapNextButton(_ sender: Any) {
        
        if page >= SignUpStepName.allCases.count {
            router?.signIn()
            return
        }
        page += 1
        guard
            let step = SignUpStepName(rawValue: page)
        else {
            return
        }
        
        switch step {
        case .user:
            break
        case .business:
            router?.openSighUpFields(with: .theBusiness, and: context)
        case .verification:
            router?.showEmailVerification(in: context)
            nextButton.setTitle("Verify", for: .normal)
        case .complete:
            let view = (context?.viewControllers.last as? EmailVerificationViewController)
            view?.openCompleteSignUpView()
            nextButton.setTitle("Finish", for: .normal)
        }
        
        updatePage(with: page - 1)
    }
    
    private func updatePage(with page: Int) {
        let lightBlueHex = "#89BAC9"
        let darkBlueHex = "#5C9CAF"
        
        if page >= pageViews.count { return }
        if let step = SignUpStepName(rawValue: page) {
            let view = pageViews[step.rawValue]
            view.backgroundColor = UIColor(hexString: darkBlueHex)
        }
        if let title = SignUpStepName(rawValue: page)?.name {
            titleLabel.text = title
        }
    }
}
