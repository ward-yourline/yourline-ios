//
//  SelectUserViewController.swift
//  Presentation
//
//  Created by Warrd Adlani on 11/06/2022.
//

import UIKit

class SelectUserViewController: UIViewController {
    @IBOutlet var userTypeViews: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for view in userTypeViews {
            view.layer.cornerRadius = 8.0
        }
    }
    
    private var router: SignUpRouter?
    
    func setRouter(_ router: SignUpRouter) {
        self.router = router
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    @IBAction func didTapBusinessButton(_ sender: Any) {
        router?.openSignUp(with: .business)
    }
    
    @IBAction func didTapRegularButton(_ sender: Any) {
        router?.openSignUp(with: .customer)
    }
    
    @IBAction func didTapStudentButton(_ sender: Any) {
        router?.openSignUp(with: .student)
    }
}
