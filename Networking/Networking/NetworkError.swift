//
//  NetworkError.swift
//  Employees
//
//  Created by Warrd Adlani on 27/06/2019.
//  Copyright © 2019 Warrd Adlani. All rights reserved.
//

import Foundation

// MARK: NetworkError enum
public enum NetworkError: Swift.Error {
    case invalidURL
    case noData
    case unknown
}
