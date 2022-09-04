//
//  SignUpConstants.swift
//  YourLine
//
//  Created by Warrd Adlani on 29/08/2022.
//

import Foundation

enum SignUpAccountTypeSegue: String {
    case business = "business_segue"
    case student = "student_segue"
    case customer = "customer_segue"
}

enum SignUpView: Int, CaseIterable {
    case userType
    case theUser
    case theBusiness
    case emailVerification
    case finish
}
