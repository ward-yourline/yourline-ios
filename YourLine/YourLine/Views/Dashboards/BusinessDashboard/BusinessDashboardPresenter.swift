//
//  BusinessDashboardPresenter.swift
//  YourLine
//
//  Created by Warrd Adlani on 17/09/2022.
//

import Foundation
import Utility
import Presentation
import UIKit
import Domain

class BusinessDashboardPresenter: BusinessDashboardPresenting {
    var numberOfSections: Int { BusinessDashboardSections.allCases.count }
    
    private weak var view: BusinessDashboardViewing!
    private let interactor: BusinessDashboardInteracting
    private var businessDashboardModel: BusinessDashboardModel?
    private let router: BusinessDashboardRouting

    init(view: BusinessDashboardViewing, interactor: BusinessDashboardInteracting, router: BusinessDashboardRouting) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        getBusinessDashboard()
    }
    
    private func getBusinessDashboard() {
        interactor.getHome(with: { [unowned self] homeModel, error in
            if let homeModel = homeModel as? BusinessDashboardModel {
                self.businessDashboardModel = homeModel
                view?.updateView()
            }
            
            if let error = error {
                // TODO
            }
        })
    }
    
    func numberOfRows(in section: Int) -> Int {
        guard let section = BusinessDashboardSections(rawValue: section) else { return 0 }
        
        switch section {
        case .sales:
            return 1
        case .visits:
            return 1
        case .alerts:
            guard let businessDashboardModel = businessDashboardModel else {
                return 0
            }
            return businessDashboardModel.businessDashboardModel?.alerts?.count ?? 0
        case .restock:
            return 1
        }
    }
    
    func logout() {
        router.logout()
    }
    
    func setupCell(_ cell: CellPresentable, at indexPath: IndexPath) {
        
        guard
            let section = BusinessDashboardSections(rawValue: indexPath.section),
            let businessDashboardModel = self.businessDashboardModel
        else { return }
        
        var cellViewModel: CellViewModelling? = nil
        
        switch section {
        case .sales:
            let value = "£\(businessDashboardModel.businessDashboardModel?.sales?.salesAmount ?? "0")"
            let summary = "\(businessDashboardModel.businessDashboardModel?.sales?.totalSales ?? "0") total sales"
            let points = businessDashboardModel.businessDashboardModel?.sales?.points
            cellViewModel = SalesSummaryTableCellViewModel(title: "Total sales", value: value, summary: summary, points: points?.count)
        case .visits:
            let totalVisits = "\(businessDashboardModel.businessDashboardModel?.visits?.totalVisits ?? "0") total visits"
            let todaysVisits = "\(businessDashboardModel.businessDashboardModel?.visits?.todaysVisits ?? "0")"
            let points = businessDashboardModel.businessDashboardModel?.visits?.points
            cellViewModel = SalesSummaryTableCellViewModel(title: "Today's visits", value: todaysVisits, summary: totalVisits, points: points?.count)
        case .alerts:
            if
                let details = businessDashboardModel.businessDashboardModel?.alerts?[indexPath.row].details
            {
                cellViewModel = HomeAlertCellViewModel(type: .orders, details: details)
            }
        case .restock: break
        }

        if let cellViewModel = cellViewModel {
            cell.setupCell(with: cellViewModel, delegate: nil)
        }
    }
}
