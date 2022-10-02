//
//  Item.swift
//  Domain
//
//  Created by Warrd Adlani on 02/10/2022.
//

import Foundation

// MARK: - Item
public struct Item: Decodable {
    public let id, title, desc, content: String
}

public typealias Items = [Item]
