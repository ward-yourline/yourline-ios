//
//  Content.swift
//  CheckOut
//
//  Created by Warrd Adlani on 24/04/2020.
//  Copyright © 2020 Warrd Adlani. All rights reserved.
//

import Foundation

public struct Content: Decodable {
    
    var content: String?
    
    public func updateValues(content: String?) -> Content {
        
        return Content(content: content ?? self.content)
    }
}
