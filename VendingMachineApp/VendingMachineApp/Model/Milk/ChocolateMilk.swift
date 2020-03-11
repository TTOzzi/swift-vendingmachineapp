//
//  ChocolateMilk.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/24.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class ChocolateMilk: Milk {
    private let chocolateContent: Double
    
    private enum CodingKeys: String, CodingKey {
        case chocolateContent
    }
    
    init(brand: String, amount: Int, price: Money, name: String, calorie: Double, saleablePeriod: Int, fatRatio: Double, chocolateContent: Double) {
        self.chocolateContent = chocolateContent
        super.init(brand: brand, amount: amount, price: price, name: name, calorie: calorie, saleablePeriod: saleablePeriod, fatRatio: fatRatio)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.chocolateContent = try container.decode(Double.self, forKey: .chocolateContent)
        try super.init(from: decoder)
    }
}
