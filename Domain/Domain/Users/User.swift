//
//  User.swift
//  Domain
//
//  Created by Warrd Adlani on 02/10/2022.
//

import Foundation

import Foundation

// MARK: - User
public struct User: Codable {
    public let userName, password: String

    enum CodingKeys: String, CodingKey {
        case userName = "user_name"
        case password
    }
}
