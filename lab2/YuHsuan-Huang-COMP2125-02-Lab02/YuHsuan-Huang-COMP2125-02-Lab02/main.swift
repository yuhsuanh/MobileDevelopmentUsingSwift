//
//  main.swift
//  YuHsuan-Huang-COMP2125-02-Lab02
//
//  Created by Yu-Hsuan Huang on 2021/6/4.
//  Copyright © 2021 Georgian College. All rights reserved.
//

import Foundation

// test instantiate a class without any parameters
print("============== Test 1 ==============")
let bankAccount1 = BankAccount();
print(bankAccount1.description);

print("\n Test set wrong value to Yearly Interest Rate & Account Balance")
bankAccount1.accountNumber = 1231
bankAccount1.customerName = "Joseph"
bankAccount1.yearlyInterestRate = 0.05 //test set wrong value
bankAccount1.yearlyInterestRate = -0.25 //test set wrong value
bankAccount1.accountBalance = -20 //test set wrong value
bankAccount1.accountBalance = 2.5 //test set wrong value
print(bankAccount1.description)

bankAccount1.credit(amount: 656.55)
print(bankAccount1.description)

bankAccount1.debit(amount: 600)
print(bankAccount1.description)





// test instantiate a class with 4 parameters
print("\n\n\n============== Test 2 ==============")
let bankAccount2 = BankAccount(accountNumber: 1230, customerName: "Winni", yearlyInterestRate: 0.55, accountBalance: 500)
print(bankAccount2.description)

bankAccount2.accountNumber = 1232
bankAccount2.customerName = "Winnie"
bankAccount2.yearlyInterestRate = 1.25
bankAccount2.accountBalance = 888.88
print(bankAccount2.description)

bankAccount2.debit(amount: 88.88)
print(bankAccount2.description)

bankAccount2.credit(amount: 200)
print(bankAccount2.description)




// test instantiate a class with 3 parameters (Extension convenience init)
print("\n\n\n============== Test 3 ==============")
let bankAccount3 = BankAccount(accountNumber: 1230, customerName: "Shawn", accountBalance: 666)
print(bankAccount3.description)


bankAccount3.accountNumber = 1233
bankAccount3.customerName = "Sean"
bankAccount3.yearlyInterestRate = 1.35
bankAccount3.accountBalance = 666.23
print(bankAccount3.description)


print("\n Test set wrong value to credit method & debit method")
print("\nDeposit: -$500")
bankAccount3.credit(amount: -500) //test set wrong value
print(bankAccount3.description)

print("\nWithdraw: 6006")
bankAccount3.debit(amount: 6006) //test set wrong value
print(bankAccount3.description)

print("\nWithdraw: -400")
bankAccount3.debit(amount: -400) //test set wrong value
print(bankAccount3.description)

//get interest
print("\nInterest: \(bankAccount3.interest)")
