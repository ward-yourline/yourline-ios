//
//  HomeViewInteractor.swift
//  YourLine
//
//  Created by Warrd Adlani on 02/09/2022.
//

import Foundation
import Domain
import Networking
import Utility

class BusinessDashboardInteractor: BusinessDashboardInteracting {
    private lazy var service = MockWebservice()
    func getHome(with completion: NetworkCallbackBlock?) {
        service.getBusinessDashboard(with: completion)
    }
}
    
