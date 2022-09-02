//
//  HomeViewPresenter.swift
//  YourLine
//
//  Created by Warrd Adlani on 02/09/2022.
//

import Foundation
import Utility
import Domain

class HomeViewPresenter: HomeViewPresenting {
    
    private weak var view: HomeViewing!
    private let interactor: HomeViewInteracting

    init(view: HomeViewing, interactor: HomeViewInteracting) {
        self.view = view
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        getHome()
    }
    
    private func getHome() {
        interactor.getHome(with: { [unowned self] home, error in
            if let home = home {
                // TODO
                
                view?.updateView()
            }
            
            if let error = error {
                // TODO
            }
        })
    }
}
