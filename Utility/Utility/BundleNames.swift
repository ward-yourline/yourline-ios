//
//  BundleNames.swift
//  Utility
//
//  Created by Warrd Adlani on 16/05/2022.
//

import Foundation

public enum BundleNames: String {
    case resources = "com.yourline.resources"
    case presentation = "com.yourline.presentation"
    case domain = "com.yourline.domain"
    case utility = "com.yourline.utility"
    case services = "com.yourline.services"
}

let prefix = "com.yourline."

public enum BundleIdentifiers: String {
    
    case resources = "resources"
    case domain = "domain"
    case presentation = "presentation"
    case data = "data"
    case servics = "services"
    case googleServices = "googleServices"
    case networking = "networking"
    
    public var bundleName: String {
        return prefix + self.rawValue
    }
}
