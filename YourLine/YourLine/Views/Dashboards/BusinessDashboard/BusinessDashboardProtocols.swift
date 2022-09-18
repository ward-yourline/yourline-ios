//
//  BusinessDashboardProtocols.swift
//  YourLine
//
//  Created by Warrd Adlani on 17/09/2022.
//

import Foundation
import Utility
import Presentation
import UIKit

enum BusinessDashboardSections: Int, CaseIterable {
    case sales
    case visits
    case alerts
    case restock
}

protocol BusinessDashboardRouting: Routing {
    init(context: UIViewController?)
    func openOrderDetails()
    func start(insert: Bool)
    func logout()
}

protocol BusinessDashboardViewing: AnyObject {
    func updateView()
    func setPresenter(_ presenter: BusinessDashboardPresenting)
    func showError(with error: String)
}

protocol BusinessDashboardPresenting {
    var numberOfSections: Int { get }
    
    func viewDidLoad()
    func numberOfRows(in section: Int) -> Int
    func setupCell(_ cell: CellPresentable, at indexPath: IndexPath)
    func didSelectRow(at indexPath: IndexPath)
}

protocol BusinessDashboardInteracting {
    func getHome(with completion: NetworkCallbackBlock?)
}
