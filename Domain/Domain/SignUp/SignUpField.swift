//
//  SignUpField.swift
//  Domain
//
//  Created by Warrd Adlani on 29/08/2022.
//

import Foundation

// MARK: - SignUpField
public struct SignUpFields: Decodable {
    public let viewName: String
    public let fields: [SignUpField]

    enum CodingKeys: String, CodingKey {
        case viewName = "view_name"
        case fields
    }
}

// MARK: - Field
public struct SignUpField: Decodable {
    public let name, copy, type: String
}

