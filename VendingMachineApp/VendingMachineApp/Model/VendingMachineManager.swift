//
//  VendingMachineManager.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/28.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

protocol SomeDelegate: class {
    func addBalance(amount: Int)
    func checkBalance() -> Money
}

class VendingMachineManager {
    weak var anyDelegate: AnyDelegate?
    var vendingMachine = VendingMachine() {
        didSet {
            anyDelegate?.updateBalanceLabel(amount: "\(checkBalance())")
        }
    }
}

extension VendingMachineManager: SomeDelegate {
    func addBalance(amount: Int) {
        vendingMachine.addBalance(Money(amount: amount))
    }
    func checkBalance() -> Money {
        vendingMachine.checkBalance()
    }
}
