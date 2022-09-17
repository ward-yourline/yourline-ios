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

class HomeViewPresenter: HomeViewPresenting {
    
    private weak var view: HomeViewing!
    private let router: HomeViewRouting

    init(view: HomeViewing, router: HomeViewRouting) {
        self.view = view
        self.router = router
    }
    
    func viewDidLoad() {}

    func logout() {
        router.logout()
    }
}
