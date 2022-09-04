//
//  HomeViewPresenter.swift
//  YourLine
//
//  Created by Warrd Adlani on 02/09/2022.
//

import Foundation
import Utility
import Domain
import Presentation

enum HomeSections: Int, CaseIterable {
    case sales
    case visits
    case alerts
    case restock
}

class HomeViewPresenter: HomeViewPresenting {
    var numberOfSections: Int { HomeSections.allCases.count }
    
    private weak var view: HomeViewing!
    private let interactor: HomeViewInteracting
    private var homeModel: HomeModel?
    private let router: HomeViewRouting

    init(view: HomeViewing, interactor: HomeViewInteracting, router: HomeViewRouting) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        getHome()
    }
    
    private func getHome() {
        interactor.getHome(with: { [unowned self] homeModel, error in
            if let homeModel = homeModel as? HomeModel {
                self.homeModel = homeModel
                view?.updateView()
            }
            
            if let error = error {
                // TODO
            }
        })
    }
    
    func numberOfRows(in section: Int) -> Int {
        guard let section = HomeSections(rawValue: section) else { return 0 }
        
        switch section {
        case .sales:
            return 1
        case .visits:
            return 1
        case .alerts:
            guard let homeModel = homeModel else {
                return 0
            }
            return homeModel.homeModel?.alerts?.count ?? 0
        case .restock:
            return 1
        }
    }
    
    func logout() {
        router.logout()
    }
    
    func setupCell(_ cell: CellPresentable, at indexPath: IndexPath) {
        
        guard
            let section = HomeSections(rawValue: indexPath.section),
            let homeModel = self.homeModel
        else { return }
        
        var cellViewModel: CellViewModelling? = nil
        
        switch section {
        case .sales:
            let value = "£\(homeModel.homeModel?.sales?.salesAmount ?? "0")"
            let summary = "\(homeModel.homeModel?.sales?.totalSales ?? "0") total sales"
            let points = homeModel.homeModel?.sales?.points
            cellViewModel = HomeSummaryCellViewModel(title: "Total sales", value: value, summary: summary, points: points?.count)
        case .visits:
            let totalVisits = "\(homeModel.homeModel?.visits?.totalVisits ?? "0") total visits"
            let todaysVisits = "\(homeModel.homeModel?.visits?.todaysVisits ?? "0")"
            let points = homeModel.homeModel?.visits?.points
            cellViewModel = HomeSummaryCellViewModel(title: "Today's visits", value: todaysVisits, summary: totalVisits, points: points?.count)
        case .alerts:
            if
                let details = homeModel.homeModel?.alerts?[indexPath.row].details
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
