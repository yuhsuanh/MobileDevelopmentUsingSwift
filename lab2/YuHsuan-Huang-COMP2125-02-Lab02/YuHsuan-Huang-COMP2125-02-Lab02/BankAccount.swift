//
//  BankAccount.swift
//  YuHsuan-Huang-COMP2125-02-Lab02
//
//  Created by Yu-Hsuan Huang on 2021/6/4.
//  Copyright © 2021 Georgian College. All rights reserved.
//

import Foundation

public class BankAccount {
    
    //Bank Account Properties
    public var accountNumber: Int
    public var customerName: String
    // *** The special variable newValue only works within willSet, while oldValue only works within didSet.
    public var yearlyInterestRate: Double { //should be positive and between 0.1 and 2.0
        //use didSet to make sure the "yearly interest rate" value between 0.1 and 2.0
        didSet {
            if yearlyInterestRate < 0.1 || yearlyInterestRate > 2.0 {
                print("** You \'Yearly Interest Rate\' value is wrong **")
                yearlyInterestRate = oldValue
            }
        }
    }
    public var accountBalance: Double { //should not be negative and there should be minimum 10.00 dollars all the time.
        //use didSet to make sure the "account balance" value greater than and equal to 10
        didSet {
            if accountBalance < 10.00 {
                print("** You \'Account Balance\' value is wrong **")
                accountBalance = oldValue
            }
        }
    }
    
    
    //Define two initializers, one which initializes all the properties to their default values and one which initializes to appropriate values
    public init() {
        print("BankAccount initializer without parameter")
        accountNumber = 1000
        customerName = "Customer Name"
        yearlyInterestRate = 0.1
        accountBalance = 10.00
    }
    public init(accountNumber: Int, customerName: String, yearlyInterestRate: Double, accountBalance: Double) {
        print("BankAccount initializer with 4 parameters")
        self.accountNumber = accountNumber
        self.customerName = customerName
        
        if yearlyInterestRate < 0.1 || yearlyInterestRate > 2.0 {
            self.yearlyInterestRate = 0.1
        } else {
            self.yearlyInterestRate = yearlyInterestRate
        }
        
        if accountBalance < 10.00 {
            self.accountBalance = 10.00
        } else {
            self.accountBalance = accountBalance
        }
    } // this's called designated initializer (It must be public)
    
    
    //Add a deinitializer
    deinit {
        print("BankAccount Deinitializer")
    }

    
    //Define a description as computed property which display all the values of bank account objects
    var description: String {
        return String(format: "\nAccount Number: %d\nCustomer Name: %@\nYearly Interest Rate: %.2f\nAccount Balance: %.2f", accountNumber, customerName, yearlyInterestRate, accountBalance)
    }
    
    
    //Define two functions- one is credit(amount:Double) which is used for depositing money and second which is debit(amount:Double) which is used for withdrawing money
    func credit(amount: Double) {
        //amount should greater than 0
        if amount > 0 {
            print("\nYou deposit $\(amount)")
            accountBalance = accountBalance + amount
        } else {
            print("\nYour deposit amount should greater than 0")
        }
    }
    func debit(amount: Double) {
        //amount should greater 0 and account balance should have 10 dollar all the time
        if amount > 0 && amount + 10 < accountBalance {
            print("\nYou withdraw $\(amount)")
            accountBalance = accountBalance - amount
        } else {
            print("\nYour withdraw amount should greater than blance")
        }
    }
}
