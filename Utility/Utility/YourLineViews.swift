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
    case selectUserView = "SelectUserViewController"
    case signUpFieldView = "SignUpFieldsViewController"
    case signUpView = "SignUpViewController"
    case emailVerificationView = "EmailVerificationViewController"
    case homeView = "HomeViewController"
    case businessDashboardView = "BusinessDashboardViewController"
    case ordersView = "OrdersViewController"
    case orderDetailsView = "OrderDetailsViewController"
    
    public var name: String {
        return rawValue
    }
}
