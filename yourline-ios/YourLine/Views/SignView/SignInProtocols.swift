//
//  SignInProtocols.swift
//  yourline-ios
//
//  Created by Warrd Adlani on 15/04/2022.
//

import Foundation
import UIKit
import Utility

protocol SignInRouting: Routing {
    
    init(window: UIWindow?)
    
    func start()
}

import UIKit

protocol SignInViewing {}
