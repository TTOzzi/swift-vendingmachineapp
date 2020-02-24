//
//  Stock.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/21.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class Stock {
    var beverages = [Beverage]()
    
    func add(beverage: Beverage) {
        beverages.append(beverage)
    }
    
    func printAll() {
        beverages.forEach {
            print($0)
        }
    }
}
