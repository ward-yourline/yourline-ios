//
//  MainViewController.swift
//  yourline-ios
//
//  Created by Warrd Adlani on 15/04/2022.
//

import UIKit
import Domain
import Networking

class MainViewController: UIViewController, MainViewing {
    
    @IBOutlet private weak var containerView: UIView!
    
    private var childViews: [UIViewController]? {
        didSet {
            print("I'm set")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupChildrenIfNeeded()
        
        let webService = WebService()
        webService.getProducts { items, error in
            if let items = items as? Items {
                
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    func addChildViews(_ views: [UIViewController]?) {
        childViews = views
    }
    
    private func setupChildrenIfNeeded() {
        guard let childViews = childViews else {
            return
        }
        
        for childView in childViews {
            addChild(childView)
            childView.view.frame = containerView.frame
            containerView.addSubview(childView.view)
            childView.didMove(toParent: self)
        }
    }
}

