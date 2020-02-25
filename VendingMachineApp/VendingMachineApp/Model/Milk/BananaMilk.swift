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
    
    init(brand: String, amount: Int, price: Int, name: String, calorie: Double, saleablePeriod: Int, fatRatio: Double, bananaContent: Double) {
        self.bananaContent = bananaContent
        super.init(brand: brand, amount: amount, price: price, name: name, calorie: calorie, saleablePeriod: saleablePeriod, fatRatio: fatRatio)
    }
}
