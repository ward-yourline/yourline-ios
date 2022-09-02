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

class HomeViewInteractor: HomeViewInteracting {
    private lazy var service = MockWebservice()
    func getHome(with completion: NetworkCallbackBlock?) {
        service.getHome(with: completion)
    }
}
    
