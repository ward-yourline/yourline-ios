//
//  RequestType.swift
//  Employees
//
//  Created by Warrd Adlani on 27/06/2019.
//  Copyright © 2019 Warrd Adlani. All rights reserved.
//

import Foundation

// MARK: RequestType
public protocol RequestTypeProtocol {
    associatedtype ResponseType: Decodable
    var data: Request { get }
}

// MARK: RequestType extension
public extension RequestTypeProtocol {
    func execute (dispatcher: NetworkDispatcherProtocol, onSuccess: @escaping (ResponseType) -> Void, onError: @escaping (Error) -> Void) {
        dispatcher.dispatch(
            request: self.data,
            onSuccess: { (responseData: Data) in
                do {
                    let jsonDecoder = JSONDecoder()
                    let result = try jsonDecoder.decode(ResponseType.self, from: responseData)
                    print(String(data: responseData, encoding: .utf8))
                    DispatchQueue.main.async {
                        onSuccess(result)
                    }
                } catch let error {
                    DispatchQueue.main.async {
                        onError(error)
                    }
                }
        },
            onError: { (error: Error) in
                DispatchQueue.main.async {
                    onError(error)
                }
        })
    }
}
