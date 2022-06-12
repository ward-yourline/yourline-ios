//
//  Fonts.swift
//  Resources
//
//  Created by Warrd Adlani on 11/06/2022.
//

import Foundation
import UIKit
import Utility

public enum Fonts :String, CaseIterable {
    case regular = "Poppins-Regular"
    case medium = "Poppins-Medium"
    case bold = "Poppins-Bold"
    case semiBold = "Poppins-SemiBold"
    case light = "Poppins-Light"
    
    static var installed = false
}

public extension Fonts {
    static func install() {
        Fonts.installed = true
        guard let bundle = Bundle.init(identifier: BundleIdentifiers.resources.bundleName) else {
            fatalError("unable to load font's bundle")
        }
        for each in Fonts.allCases {
            if let cfURL = bundle.url(forResource:each.rawValue, withExtension: "ttf") {
                CTFontManagerRegisterFontsForURL(cfURL as CFURL, .process, nil)
            } else {
                assertionFailure("Could not find font:\(each.rawValue) in bundle:\(bundle)")
            }
        }
    }
}
