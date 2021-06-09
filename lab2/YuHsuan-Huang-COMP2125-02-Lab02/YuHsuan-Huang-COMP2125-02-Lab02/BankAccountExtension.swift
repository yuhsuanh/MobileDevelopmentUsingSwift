//
//  BankAccountExtension.swift
//  YuHsuan-Huang-COMP2125-02-Lab02
//
//  Created by Yu-Hsuan Huang on 2021/6/4.
//  Copyright © 2021 Georgian College. All rights reserved.
//

import Foundation

extension BankAccount {
    
    //use the account balance and yearly interest rate to get interest
    var interest: Double {
        return accountBalance * yearlyInterestRate
    }
    
    //convenience init. it will call bank account class init
    public convenience init(accountNumber: Int, customerName: String, accountBalance: Double) {
        print("Bank Account Extension convenience init")
        self.init(accountNumber: accountNumber, customerName: customerName, yearlyInterestRate: 0.1, accountBalance: accountBalance)
    }
}
