//
//  OrdersViewModel.swift
//  YourLine
//
//  Created by Warrd Adlani on 18/09/2022.
//

import Foundation
import UIKit
import Presentation
import Domain
import Utility
import Networking

enum OrderDetailsViewSection: Int, CaseIterable {
    case items
    case customerDetails
    case paymentDetails
}
class OrderDetailsViewModel: OrderDetailsViewModelling {
    var numberOfSections: Int { return OrderDetailsViewSection.allCases.count }
    
    private weak var view: OrderDetailsViewing?
    private let router: OrderDetailsRouting
    private lazy var service = MockWebservice()
    
    private var model: OrdersModel?
    
    required init(view: OrderDetailsViewing?, router: OrderDetailsRouting) {
        
        self.view = view
        self.router = router
    }
    
    func viewDidLoad() {
        getOrders()
    }
    
    func numberOfRows(in section: Int) -> Int {
        
        if let section = OrdersViewSection(rawValue: section) {
            switch section {
            case .summary:
                return 1
            case .orders:
                return model?.orders?.orders?.count ?? 0
            }
        }
        
        return 0
    }
    
    func setupCell(_ cell: CellPresentable, at indexPath: IndexPath) {
        guard
            let secion = OrdersViewSection(rawValue: indexPath.section),
            let order = model?.orders?.orders?[indexPath.row]
        else {
            return
        }
        
        var viewModel: CellViewModelling? = nil
        
        switch secion {
        case .summary:
            let value = "£\(model?.orders?.sales?.salesAmount ?? "0")"
            let summary = "\(model?.orders?.sales?.totalSales ?? "0") total sales"
            let points = model?.orders?.sales?.points
            viewModel = SalesSummaryTableCellViewModel(title: "Total sales", value: value, summary: summary, points: points?.count)
        case .orders:
            let name = order.customerName ?? ""
            let price = order.price ?? ""
            let time = order.orderTime ?? ""
            let orderNumber = order.orderNumber ?? ""
            
            viewModel = OrdersExcerptViewModel(
                customerName: name,
                price: price,
                time: time,
                orderNumber: orderNumber
            )
        }
       
        cell.setupCell(with: viewModel, delegate: nil)
    }
    
    private func getOrders() {
        service.getOrders(completion: { [unowned self] ordersModel, error in
            if let ordersModel = ordersModel as? OrdersModel {
                self.model = ordersModel
                view?.updateView()
            }
            
            if let error = error {
                // TODO
            }
        })
    }
}
