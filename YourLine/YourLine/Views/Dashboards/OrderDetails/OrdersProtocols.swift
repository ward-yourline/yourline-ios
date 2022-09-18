//
//  OrdersProtocols.swift
//  YourLine
//
//  Created by Warrd Adlani on 18/09/2022.
//

import Foundation
import Utility
import UIKit
import Presentation

protocol OrdersRouting: Routing {
    init(context: UIViewController?)
    
    func start(insert: Bool)
}

protocol OrdersViewing: NSObject {
    func set(viewModel: OrdersViewModelling)
    func updateView()
}

protocol OrdersViewModelling {
    var numberOfSections: Int { get }
    
    func numberOfRows(in section: Int) -> Int
    init(view: OrdersViewing?, router: OrdersRouting)
    func viewDidLoad()
    func setupCell(_ cell: CellPresentable, at indexPath: IndexPath)
}
