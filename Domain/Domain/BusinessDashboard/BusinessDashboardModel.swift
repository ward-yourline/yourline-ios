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
    public let sales: SalesData?
    public let visits: SalesVisits?
    public let alerts: [BusinessDashboardAlert]?
}

// MARK: - Alert
public struct BusinessDashboardAlert: Decodable {
    public let details: String?
}
