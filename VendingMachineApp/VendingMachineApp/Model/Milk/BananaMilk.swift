//
//  BananaMilk.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/24.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class BananaMilk: Milk {
    private let bananaContent: Double
    
    private enum CodingKeys: String, CodingKey {
        case bananaContent
    }
    
    init(brand: String, amount: Int, price: Money, name: String, calorie: Double, saleablePeriod: Int, fatRatio: Double, bananaContent: Double) {
        self.bananaContent = bananaContent
        super.init(brand: brand, amount: amount, price: price, name: name, calorie: calorie, saleablePeriod: saleablePeriod, fatRatio: fatRatio)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.bananaContent = try container.decode(Double.self, forKey: .bananaContent)
        try super.init(from: decoder)
    }
}
