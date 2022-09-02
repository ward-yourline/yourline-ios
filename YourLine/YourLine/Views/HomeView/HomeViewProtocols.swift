//
//  HomeViewProtocols.swift
//  YourLine
//
//  Created by Warrd Adlani on 02/09/2022.
//

import Foundation
import UIKit
import Domain
import Utility

protocol HomeViewRouting {
    init(context: UIViewController?)
    func start()
}

protocol HomeViewing: AnyObject {
    func updateView()
    func setPresenter(_ presenter: HomeViewPresenting)
    func showError(with error: String)
}

protocol HomeViewPresenting {
    func viewDidLoad()
}

protocol HomeViewInteracting {
    func getHome(with completion: NetworkCallbackBlock?)
}
