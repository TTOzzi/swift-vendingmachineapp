//
//  Milk.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/21.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class Milk: Beverage {
    static let lowFatStandard = 3.0
    private let fatRatio: Double
    
    private enum CodingKeys: String, CodingKey {
        case fatRatio
    }
    
    init(brand: String, amount: Int, price: Money, name: String, calorie: Double, saleablePeriod: Int, fatRatio: Double) {
        self.fatRatio = fatRatio
        super.init(brand: brand, amount: amount, price: price, name: name, calorie: calorie, saleablePeriod: saleablePeriod)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.fatRatio = try container.decode(Double.self, forKey: .fatRatio)
        try super.init(from: decoder)
    }
    
    func isLowFat() -> Bool {
        return fatRatio < Milk.lowFatStandard
    }
}
