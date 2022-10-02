//
//  Orders.swift
//  Domain
//
//  Created by Warrd Adlani on 18/09/2022.
//

import Foundation

import Foundation

// MARK: - Home
public struct OrdersModel: Decodable {
    public let orders: OrdersModelData?
}

// MARK: - HomeClass
public struct OrdersModelData: Decodable {
    public let sales: OrdersSales?
    public let orders: [OrdersExcerpt]?
    public let pendingOrders: String?
    
    enum CodingKeys: String, CodingKey {
        case sales
        case pendingOrders = "pending_orders"
        case orders = "orders_excerpt"
    }
}

// MARK: - Alert
public struct OrdersExcerpt: Decodable {
    public let customerName: String?
    public let price: String?
    public let orderNumber: String?
    public let orderTime: String?
    
    enum CodingKeys: String, CodingKey {
        case customerName = "customer_name"
        case price
        case orderNumber = "order_number"
        case orderTime = "order_time"
    }
}

// MARK: - Sales
public struct OrdersSales: Decodable {
    public let salesAmount, totalSales: String?
    public let points: SalesPoints?

    enum CodingKeys: String, CodingKey {
        case salesAmount = "sales_amount"
        case totalSales = "total_sales"
        case points
    }
}
