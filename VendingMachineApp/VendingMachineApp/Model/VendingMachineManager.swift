//
//  VendingMachineManager.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/28.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

protocol VendingMachineManagementDelegate: class {
    var stockNames: [String] { get }
    func addBalance(amount: Int)
    func addStock(index: Int)
}

class VendingMachineManager {
    private var vendingMachine = VendingMachine()
    var balance: String {
        "\(vendingMachine.checkBalance())"
    }
    var stockList: [(key: Beverage, value: Int)] {
        vendingMachine.stockList
    }
    
    func saveData() {
        print("save!")
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let data = try! encoder.encode(vendingMachine)
        print(String(data: data, encoding: .utf8) ?? "")
        UserDefaults.standard.set(data, forKey: "vendingMachine")
    }
    
    func loadData() {
        print("load!")
        let a = vendingMachine.stockList.first!.key as! StrawberryMilk
        print(a.strawberryContent)
        if let data = UserDefaults.standard.object(forKey: "vendingMachine") as? Data {
          vendingMachine = try! JSONDecoder().decode(VendingMachine.self, from: data)
        }
    }
}

extension VendingMachineManager: VendingMachineManagementDelegate {
    var stockNames: [String] {
        vendingMachine.stockList.map { $0.key.name }
    }
    
    func addBalance(amount: Int) {
        vendingMachine.addBalance(Money(amount: amount))
    }

    func addStock(index: Int) {
        vendingMachine.addBeverage(beverage: vendingMachine.stockList[index].key)
    }
}
