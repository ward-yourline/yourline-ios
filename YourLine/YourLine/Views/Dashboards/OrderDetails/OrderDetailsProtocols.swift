//
//  OrderDetailsProtocols.swift
//  YourLine
//
//  Created by Warrd Adlani on 18/09/2022.
//

import Foundation
import Utility
import UIKit
import Presentation

protocol OrderDetailsRouting: Routing {
    init(context: UIViewController?)
    
    func start(insert: Bool)
}

protocol OrderDetailsViewing: NSObject {
    func set(viewModel: OrderDetailsViewModelling)
    func updateView()
}

protocol OrderDetailsViewModelling {
    var numberOfSections: Int { get }
    
    func numberOfRows(in section: Int) -> Int
    init(view: OrderDetailsViewing?, router: OrderDetailsRouting)
    func viewDidLoad()
    func setupCell(_ cell: CellPresentable, at indexPath: IndexPath)
}
