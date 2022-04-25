//
//  Coordinator.swift
//  CheckOut
//
//  Created by Warrd Adlani on 01/05/2020.
//  Copyright © 2020 Warrd Adlani. All rights reserved.
//

import Foundation

@objc public protocol Coordinator: AnyObject {
    
    @objc optional func nextScreen()
    @objc optional func returnedData(_ data: Any?)
}
