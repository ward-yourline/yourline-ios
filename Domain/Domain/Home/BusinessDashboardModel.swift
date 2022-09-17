//
//  BusinessDashboard.swift
//  Domain
//
//  Created by Warrd Adlani on 02/09/2022.
//

import Foundation

// MARK: - Home
public struct BusinessDashboardModel: Decodable {
    public let businessDashboardModel: BusinessDashboardData?
    
    enum CodingKeys: String, CodingKey {
        case businessDashboardModel = "business_dashboard"
    }
}

// MARK: - HomeClass
public struct BusinessDashboardData: Decodable {
    public let sales: BusinessDashboardSales?
    public let visits: BusinessDashboardVisits?
    public let alerts: [BusinessDashboardAlert]?
}

// MARK: - Alert
public struct BusinessDashboardAlert: Decodable {
    public let details: String?
}

// MARK: - Sales
public struct BusinessDashboardSales: Decodable {
    public let salesAmount, totalSales: String?
    public let points: BusinessDashboardPoints?

    enum CodingKeys: String, CodingKey {
        case salesAmount = "sales_amount"
        case totalSales = "total_sales"
        case points
    }
}

// MARK: - Visits
public struct BusinessDashboardVisits: Decodable {
    public let totalVisits, todaysVisits: String?
    public let points: BusinessDashboardPoints?

    enum CodingKeys: String, CodingKey {
        case totalVisits = "total_visits"
        case todaysVisits = "todays_visits"
        case points
    }
}

// MARK: - Points
public struct BusinessDashboardPoints: Decodable {
    public let count, direction: String
}
