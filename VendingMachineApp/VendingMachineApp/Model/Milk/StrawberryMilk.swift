//
//  StrawberryMilk.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/24.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class StrawberryMilk: Milk {
    let strawberryContent: Double
    
    private enum CodingKeys: String, CodingKey {
        case strawberryContent
    }
    
    init(brand: String, amount: Int, price: Money, name: String, calorie: Double, saleablePeriod: Int, fatRatio: Double, strawberryContent: Double) {
        self.strawberryContent = strawberryContent
        super.init(brand: brand, amount: amount, price: price, name: name, calorie: calorie, saleablePeriod: saleablePeriod, fatRatio: fatRatio)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.strawberryContent = try container.decode(Double.self, forKey: .strawberryContent)
        try super.init(from: decoder)
    }
}
