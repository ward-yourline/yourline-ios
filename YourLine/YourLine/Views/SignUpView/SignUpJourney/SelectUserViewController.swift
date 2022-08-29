//
//  SelectUserViewController.swift
//  Presentation
//
//  Created by Warrd Adlani on 11/06/2022.
//

import UIKit

public class SelectUserViewController: UIViewController {
    @IBOutlet var userTypeViews: [UIView]!
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        for view in userTypeViews {
            view.layer.cornerRadius = 8.0
        }
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    @IBAction func didTapBusinessButton(_ sender: Any) {
    }
    
    @IBAction func didTapRegularButton(_ sender: Any) {
    }
    
    @IBAction func didTapStudentButton(_ sender: Any) {
    }
}
