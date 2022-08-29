//
//  MainViewProtocols.swift
//  yourline-ios
//
//  Created by Warrd Adlani on 15/04/2022.
//

import Foundation
import UIKit
import Utility

protocol MainViewRouting: Routing {
    
    init(window: UIWindow?)
    
    func start()
    
    func openHomeView()
}

protocol MainViewPresenting {
    
    init(router: MainViewRouting?)
}

protocol MainViewing {
    func addChildViews(_ views: [UIViewController]?)
}
