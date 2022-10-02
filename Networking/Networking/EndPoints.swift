//
//  EndPoints.swift
//  Networking
//
//  Created by Warrd Adlani on 30/07/2019.
//  Copyright © 2019 Warrd Adlani. All rights reserved.
//

import Foundation

enum EndPoints: String {
    case items = "items"
    case authorise = "authorise/"
    
    public var endpoint: String {
        let endpoint = "http://localhost:10000/"
        return endpoint + self.rawValue
    }
}
