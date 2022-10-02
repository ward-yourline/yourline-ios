//
//  Item.swift
//  Domain
//
//  Created by Warrd Adlani on 02/10/2022.
//

import Foundation

// MARK: - Item
public struct Item: Codable {
    public let title, desc, content: String
}

typealias Items = [Item]
