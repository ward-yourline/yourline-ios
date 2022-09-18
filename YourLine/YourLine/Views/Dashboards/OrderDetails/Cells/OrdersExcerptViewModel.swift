//
//  OrdersExcerptViewModel.swift
//  YourLine
//
//  Created by Warrd Adlani on 18/09/2022.
//

import Foundation
import Utility
import Presentation

struct OrdersExcerptViewModel: CellViewModelling {
    
    let customerName: String
    let price: String
    let time: String
    let orderNumber: String
    
    init(customerName: String, price: String, time: String, orderNumber: String) {
        self.customerName = customerName
        self.price = price
        self.time = time
        self.orderNumber = orderNumber
    }
}
