//
//  NetworkDispatcher.swift
//  Employees
//
//  Created by Warrd Adlani on 27/06/2019.
//  Copyright © 2019 Warrd Adlani. All rights reserved.
//

import Foundation

// MARK: NetworkDispatcherProtocol
public protocol NetworkDispatcherProtocol {
    func dispatch(request: RequestProtocol, onSuccess: @escaping (Data) -> Void, onError: @escaping (Error) -> Void)
}

// MARK: NetworkDispatcher
public struct NetworkDispatcher: NetworkDispatcherProtocol {
    public init() {}
    public func dispatch(request: RequestProtocol, onSuccess: @escaping (Data) -> Void, onError: @escaping (Error) -> Void) {
        guard let path = request.path else {
            return
        }
        guard let url = URL(string: path) else {
            onError(NetworkError.invalidURL)
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.httpBody = request.body
        
        do {
            if let params = request.parameters {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
            }
        } catch let error {
            onError(error)
            return
        }
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                onError(error)
                return
            }
            
            if
                let response = response as? HTTPURLResponse,
                let data = data,
                response.statusCode == 400,
                let string = String(data: data, encoding: .utf8)
            {
                let error = NSError(domain: string, code: 0)
                onError(NetworkError.unautothorised(error))
                return
            }
            
            guard let data = data else {
                onError(NetworkError.noData)
                return
            }
            
            onSuccess(data)
            }.resume()
    }
}
