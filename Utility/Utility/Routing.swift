//
//  Routing.swift
//  yourline-ios
//
//  Created by Warrd Adlani on 15/04/2022.
//

import Foundation

@objc public protocol Routing: AnyObject {
    
    @objc optional func nextScreen()
    @objc optional func returnedData(_ data: Any?)
}
