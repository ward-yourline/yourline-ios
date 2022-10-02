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

extension WebService {
    public func getProducts(completion: @escaping NetworkResponseCompletion) {
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
        return Request(path: EndPoints.items.rawValue)
    }
}
