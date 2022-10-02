//
//  RequestData.swift
//  Employees
//
//  Created by Warrd Adlani on 27/06/2019.
//  Copyright © 2019 Warrd Adlani. All rights reserved.
//

import Foundation

// MARK: RequestProtocol
public protocol RequestProtocol {
    var path: String? { get }
    var method: HTTPMethod { get }
    var body: Data? { get }
    var parameters: [String : Any?]? { get }
    var headers: [String : String]? { get }
}

// MARK: RequestData
public struct Request: RequestProtocol {
    public let path: String?
    public let method: HTTPMethod
    public let body: Data?
    public let parameters: [String : Any?]?
    public let headers: [String : String]?
    
    public init(path: String?, method: HTTPMethod = .get, body: Data? = nil, parameters: [String : Any?]? = nil, headers: [String : String]? = nil) {
        self.path = path
        self.method = method
        self.body = body
        self.parameters = parameters
        self.headers = headers
    }
}
