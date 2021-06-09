// main.swift
// Using class Account's init method to initialize an Account's
// name property when the Account object is created
import Foundation // for NSNumberFormatter class

// create and configure an NumberFormatter for currency values
var formatter = NumberFormatter()
formatter.numberStyle = NumberFormatter.Style.currency

func formatAccountString(account: Account) -> String {
    return account.name + "'s balance: " + String(format:"%.2f", account.balance);
}

// create two account objects
let account1 = Account(name: "Jane Green", balance: 50.00)
let account2 = Account(name: "John Blue", balance: -7.53)
//let account3 = Account(name: "Sujeet Lohan", balance: 107.53)

// display initial balance of each Account
print(formatAccountString(account: account1))
print(formatAccountString(account: account2))

// test Account's deposit method
var depositAmount = 25.53 // local variable

print("\ndepositing " + String(depositAmount) + " into account1\n")

account1.deposit(amount: depositAmount) // calling the function - deposit()

print(formatAccountString(account: account1))
print(formatAccountString(account: account2))

depositAmount = 123.45
print("\ndepositing " + String(depositAmount)  + " into account2\n")
account2.deposit(amount: depositAmount) // account2 is calling the deposit() function

print(formatAccountString(account: account1))
print(formatAccountString(account: account2))

// test Account's withdraw method
var withdrawalAmount = 14.27

print("\nwithdrawing " + String(withdrawalAmount) + " from account1\n")
account1.withdraw(amount: withdrawalAmount)

print(formatAccountString(account: account1))
print(formatAccountString(account: account2))

withdrawalAmount = 100.00
//account1.balance = 2000.00 // Not allowed because set is private
print("\nwithdrawing " + String(withdrawalAmount) + " from account2\n")
account2.withdraw(amount: withdrawalAmount)

print(formatAccountString(account: account1))
print(formatAccountString(account: account2))

print(account2.balance) // this is allowed.

// Why we kept balance property as public, so that we access the balance. But not for modifying it.
// This is okay
if account2.balance > account1.balance
{
    
}

//account2.balance = 3000 // setter is private. Not allowed



