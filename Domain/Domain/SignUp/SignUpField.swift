//
//  SignUpField.swift
//  Domain
//
//  Created by Warrd Adlani on 29/08/2022.
//

import Foundation

public struct SignUpField: Decodable {
    public let name: String?
    public let copy: String?
    public let type: String?
}

public struct SignUpFields: Decodable {
    public let viewName: String?
    public let fields: [SignUpField]
    
    enum CodingKeys: String, CodingKey {
        case viewName = "view_name"
        case fields
    }
}
