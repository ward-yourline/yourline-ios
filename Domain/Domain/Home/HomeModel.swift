//
//  Home.swift
//  Domain
//
//  Created by Warrd Adlani on 02/09/2022.
//

import Foundation

// MARK: - Home
public struct HomeModel: Decodable {
    public let homeModel: HomeData?
    
    enum CodingKeys: String, CodingKey {
        case homeModel = "home"
    }
}

// MARK: - HomeClass
public struct HomeData: Decodable {
    public let sales: HomeSales?
    public let visits: HomeVisits?
    public let alerts: [HomeAlert]?
}

// MARK: - Alert
public struct HomeAlert: Decodable {
    public let details: String?
}

// MARK: - Sales
public struct HomeSales: Decodable {
    public let salesAmount, totalSales: String?
    public let points: HomePoints?

    enum CodingKeys: String, CodingKey {
        case salesAmount = "sales_amount"
        case totalSales = "total_sales"
        case points
    }
}

// MARK: - Visits
public struct HomeVisits: Decodable {
    public let totalVisits, todaysVisits: String?
    public let points: HomePoints?

    enum CodingKeys: String, CodingKey {
        case totalVisits = "total_visits"
        case todaysVisits = "todays_visits"
        case points
    }
}

// MARK: - Points
public struct HomePoints: Decodable {
    public let count, direction: String
}
