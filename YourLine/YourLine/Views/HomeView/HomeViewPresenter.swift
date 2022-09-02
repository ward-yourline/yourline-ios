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

public enum HomeSections: Int, CaseIterable {
    case sales
    case visits
    case alerts
}

class HomeViewPresenter: HomeViewPresenting {
    var numberOfSections: Int { HomeSections.allCases.count }
    
    private weak var view: HomeViewing!
    private let interactor: HomeViewInteracting
    private var homeModel: HomeModel?

    init(view: HomeViewing, interactor: HomeViewInteracting) {
        self.view = view
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        getHome()
    }
    
    private func getHome() {
        interactor.getHome(with: { [unowned self] homeModel, error in
            if let homeModel = homeModel as? HomeModel {
                // TODO
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
            return homeModel.homeModel.alerts.count
        }
    }
    
    func setupCell(_ cell: CellPresentable, at indexPath: IndexPath) {
        
        guard
            let section = HomeSections(rawValue: indexPath.section),
            let homeModel = self.homeModel
        else { return }
        
        var cellViewModel: CellViewModelling? = nil
        
        switch section {
        case .sales:
            cellViewModel = HomeSummaryCellViewModel(model: homeModel)
        case .visits:
            break
        case .alerts:
            break
        }

        if let cellViewModel = cellViewModel {
            cell.setupCell(with: cellViewModel, delegate: nil)
        }
    }
}
