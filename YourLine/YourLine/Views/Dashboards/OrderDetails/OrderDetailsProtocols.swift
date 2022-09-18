//
//  OrderDetailsProtocols.swift
//  YourLine
//
//  Created by Warrd Adlani on 18/09/2022.
//

import Foundation
import Utility
import UIKit

protocol OrderDetailsProtocols: Routing {
    init(context: UIViewController?)
    
    func start(insert: Bool)
}

protocol OrderDetailsViewing {
    
}
