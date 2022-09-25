//
//  StoryboardNames.swift
//  Utility
//
//  Created by Warrd Adlani on 16/05/2022.
//

import Foundation

public enum StoryboardNames: String {
    case signUpView = "SignUpView"
    case homeView = "HomeView"
    case signInView = "SignInView"
    case businessDashboardView = "BusinessDashboardView"
    case ordersView = "OrdersView"
    case orderDetailsView = "OrderDetailsView"
    
    public var name: String { return rawValue }
}
