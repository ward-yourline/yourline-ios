//
//  JSONUtilities.swift
//  CheckOut
//
//  Created by Warrd Adlani on 01/05/2020.
//  Copyright © 2020 Warrd Adlani. All rights reserved.
//

import Foundation
import Domain

public typealias ArrayOfDictionaries = [[String: Any]]

public class JSONUtilities {
    
    public class func buildJSONStringFromArray(_ array: Any?) -> String? {
        
        guard let array = array as? ArrayOfDictionaries else { return nil }

        let componentsString = array.compactMap { dict -> String? in

            if let key = dict.keys.first, let value = dict[key] {
                return "\"\(key)\":\(value is String ? "\"\(value)\"" : value)"
            }

            return nil
        }.joined(separator: ",")

        if componentsString.isEmpty { return nil }

        let result = "{\"payload\": {" + componentsString + "}}"

        return result
    }
}
