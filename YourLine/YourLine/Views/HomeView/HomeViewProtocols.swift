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
import Presentation

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
    var numberOfSections: Int { get }
    
    func viewDidLoad()
    func numberOfRows(in section: Int) -> Int
    func setupCell(_ cell: CellPresentable, at indexPath: IndexPath)
}

protocol HomeViewInteracting {
    func getHome(with completion: NetworkCallbackBlock?)
}
