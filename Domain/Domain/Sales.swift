//
//  Sales.swift
//  Domain
//
//  Created by Warrd Adlani on 18/09/2022.
//

import Foundation

// MARK: - Sales
public struct SalesData: Decodable {
    public let salesAmount, totalSales: String?
    public let points: SalesPoints?

    enum CodingKeys: String, CodingKey {
        case salesAmount = "sales_amount"
        case totalSales = "total_sales"
        case points
    }
}

// MARK: - Visits
public struct SalesVisits: Decodable {
    public let totalVisits, todaysVisits: String?
    public let points: SalesPoints?

    enum CodingKeys: String, CodingKey {
        case totalVisits = "total_visits"
        case todaysVisits = "todays_visits"
        case points
    }
}

// MARK: - Points
public struct SalesPoints: Decodable {
    public let count, direction: String
}
