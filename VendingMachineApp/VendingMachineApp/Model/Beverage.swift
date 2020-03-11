//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/21.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class Beverage: Codable {
    static let lowCalorieStandard = 30.0
    private let brand: String
    private let amount: Int
    private(set) var price: Money
    private(set) var name: String
    private(set) var calorie: Double
    private(set) var isHot: Bool
    private let manufacturingDate: Date
    private let expirationDate: Date
    
    private enum CodingKeys: String, CodingKey {
        case brand, amount, price, name, calorie, isHot, manufacturingDate, expirationDate
    }
    
    init(brand: String, amount: Int, price: Money, name: String, calorie: Double, saleablePeriod: Int, isHot:Bool = false) {
        self.brand = brand
        self.amount = amount
        self.price = price
        self.name = name
        self.calorie = calorie
        self.manufacturingDate = Date()
        self.expirationDate = Calendar.current.date(byAdding: .day, value: saleablePeriod, to: manufacturingDate)!
        self.isHot = isHot
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.brand = try container.decode(String.self, forKey: .brand)
        self.amount = try container.decode(Int.self, forKey: .amount)
        self.price = try container.decode(Money.self, forKey: .price)
        self.name = try container.decode(String.self, forKey: .name)
        self.calorie = try container.decode(Double.self, forKey: .calorie)
        self.manufacturingDate = try container.decode(Date.self, forKey: .manufacturingDate)
        self.expirationDate = try container.decode(Date.self, forKey: .expirationDate)
        self.isHot = try container.decode(Bool.self, forKey: .isHot)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(brand, forKey: .brand)
        try container.encode(amount, forKey: .amount)
        try container.encode(price, forKey: .price)
        try container.encode(name, forKey: .name)
        try container.encode(calorie, forKey: .calorie)
        try container.encode(manufacturingDate, forKey: .manufacturingDate)
        try container.encode(expirationDate, forKey: .expirationDate)
        try container.encode(isHot, forKey: .isHot)
    }
    
    func isLowCalorie() -> Bool {
        return calorie < Beverage.lowCalorieStandard
    }
    
    func validate(with date: Date) -> Bool {
        return date < expirationDate
    }
}

extension Beverage: CustomStringConvertible, Hashable, Comparable {
    static func < (lhs: Beverage, rhs: Beverage) -> Bool {
        lhs.name < rhs.name
    }
    
    var description: String {
        "\(brand), \(amount)ml, \(price)원, \(name), \(manufacturingDate.formattedDate)"
    }
    
    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        lhs.brand == rhs.brand && lhs.name == rhs.name 
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.brand)
        hasher.combine(self.name)
    }
}

extension Date {
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        return formatter.string(from: self)
    }
}
