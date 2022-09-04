//
//  SignUpConstants.swift
//  YourLine
//
//  Created by Warrd Adlani on 29/08/2022.
//

import Foundation

enum SignUpAccountType: String {
    case business = "business"
    case student = "student"
    case customer = "customer"
}

enum SignUpView: Int, CaseIterable {
    case userType
    case theUser
    case theBusiness
    case emailVerification
    case finish
}

enum SignUpStepName: Int, CaseIterable {
    case user = 1
    case business = 2
    case verification = 3
    case complete = 4
    
    var name: String {
        switch self {
        case .user:
            return "Tell us about yourself"
        case .business:
            return "Your Business"
        case .verification:
            return  "Verification"
        case .complete:
            return "Complete"
        }
    }
}
