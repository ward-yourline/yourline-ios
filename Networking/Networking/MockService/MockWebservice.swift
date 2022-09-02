//
//  MockWebservice.swift
//  Networking
//
//  Created by Warrd Adlani on 02/09/2022.
//

import Foundation
import Utility
import Domain

public class MockWebservice {
    public init() {}
    
    fileprivate func fetch<T: Decodable>(with jsonFile: String, type: T.Type, with completion: ((Any?, Error?)->())?) {
        guard
            let bundle = Bundle(identifier: BundleIdentifiers.networking.bundleName)
                else {
            completion?(nil, NSError(domain: "error.in.networking", code: 0))
            return
        }
        JSONHandler.parseJSON(with: jsonFile, bundle: bundle, for: type.self) { json, error in
            completion?(json, error)
        }
    }
}

extension MockWebservice {
    
    // Home
    public func getHome(with completion: NetworkCallbackBlock?) {
        
    }
    
    // Sign up and Sign in requests
    public func getSignUpPersonView(completion: NetworkCallbackBlock?) {
        let jsonFile = "sign_up_person"
        fetch(with: jsonFile, type: SignUpFields.self, with: completion)
    }
    
    public func getSignUpBusinessView(completion: NetworkCallbackBlock?) {
        let jsonFile = "sign_up_business"
        fetch(with: jsonFile, type: SignUpFields.self, with: completion)
    }
}
