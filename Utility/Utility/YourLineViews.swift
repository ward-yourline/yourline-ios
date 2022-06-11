//
//  YourLineViews.swift
//  Utility
//
//  Created by Warrd Adlani on 11/06/2022.
//

import Foundation

public enum YourLineViews: String {
    case mainView = "MainViewController"
    case signInView = "SignInViewController"
    case signUpView = "SelectUserViewController"
    
    public var name: String {
        return rawValue
    }
}
