//
//  Constants.swift
//  yourline-ios
//
//  Created by Warrd Adlani on 15/04/2022.
//

import Foundation

enum YourLineViews: String {
    case mainView = "MainViewController"
    case signInView = "SignInViewController"
    
    var name: String {
        switch self {
        case .mainView:
            return rawValue
        case .signInView:
            return rawValue
        }
    }
}
