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
