//
//  ApplicationLoader.swift
//  CheckOut
//
//  Created by Warrd Adlani on 26/03/2020.
//  Copyright © 2020 Warrd Adlani. All rights reserved.
//

import Foundation
import Domain

public final class ApplicationLoader {
    
    class func parseConfiguration(with name: String, completion: @escaping (Application?, Error?)->()) {
        
        let queue = DispatchQueue(label: "configuration-loader-queue")
        var config: Application? = nil
        
        queue.async {
            if let path = Bundle.main.path(forResource: name, ofType: "json") {
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                    
                    print(jsonResult)
                    
                    config = try JSONDecoder().decode(Application.self, from: data)
                    
                    completion(config, nil)
                    
                    print(config ?? "failed")
                } catch {
                    completion(config, error)
                }
            }
        }
    }
}
