//
//  NetworkManager.swift
//  Employees
//
//  Created by Warrd Adlani on 27/06/2019.
//  Copyright © 2019 Warrd Adlani. All rights reserved.
//

import Foundation
import Domain

public typealias NetworkResponseCompletion = (Any?, Error?)->()

public protocol WebServiceProtocol {
    var dispatcher: NetworkDispatcherProtocol! { get set }
}

// MARK: WebService
public struct WebService {
    var dispatcher: NetworkDispatcherProtocol!
    
    public init(dispatcher: NetworkDispatcherProtocol = NetworkDispatcher()) {
        self.dispatcher = dispatcher
    }
}

// MARK GetITems
extension WebService {
    public func getItems(completion: @escaping NetworkResponseCompletion) {
        let request = GetItems()
        request.execute(dispatcher: dispatcher, onSuccess: { products in
            completion(products, nil)
        }) { error in
            completion(nil, error)
        }
    }
}

// MARK: Requests
struct GetItems: RequestTypeProtocol {
    typealias ResponseType = Items
    var data: Request {
        return Request(path: EndPoints.items.endpoint)
    }
}

extension WebService {
    public func userSignIn(with userName: String, and password: String, completion: @escaping NetworkResponseCompletion) {
        let request = UserSignIn(userName: userName, password: password)
        request.execute(dispatcher: dispatcher, onSuccess: { products in
            completion(products, nil)
        }) { error in
            completion(nil, error)
        }
    }
}

struct UserSignIn: RequestTypeProtocol {
    
    private let userName: String
    private let password: String
    
    public init(userName: String, password: String) {
        self.userName = userName
        self.password = password
    }
    
    typealias ResponseType = User
    var data: Request {
        
        let endpoint = EndPoints.authorise.endpoint
        let queryItems = [
            URLQueryItem(name: "user_name", value: userName),
            URLQueryItem(name: "password", value: password)
        ]
        var urlComps = URLComponents(string: endpoint)!
        urlComps.queryItems = queryItems
        let url = urlComps.url
        
        return Request(path: url?.absoluteString ?? "", method: .post, body: nil, parameters: nil, headers: nil)
    }
}
