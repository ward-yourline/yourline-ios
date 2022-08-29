//
//  JSONHandler.swift
//  Utility
//
//  Created by Warrd Adlani on 29/08/2022.
//

import Foundation

public class JSONHandler {
    public class func parseJSON<T: Decodable>(with name: String, bundle: Bundle, for type: T.Type, completion: @escaping (Any?, Error?)->()) {
        
        let queue = DispatchQueue(label: "json-loader-queue")
        
        queue.async {
            
            if
                let path = bundle.path(forResource: name, ofType: "json"),
                let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe),
                let model = try? JSONDecoder().decode(type, from: data)
            {
                DispatchQueue.main.async {
                    completion(model, nil)
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil, nil)
                }
            }
        }
    }
}
