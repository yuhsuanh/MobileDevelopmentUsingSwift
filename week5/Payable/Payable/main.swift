// main.swift
// Processing Payables (Invoices and Employees) polymorphically
import Foundation
// one type of polymorphism is - inheritance poplymorphism
// second type - protocol polymorphism

// create Array of Payables --
var payableObjects: [Payable] = [
    SalariedEmployee(name: "John Smith",
        weeklySalary: NSDecimalNumber(string: "800.00"))!,
    Invoice(partNumber: "01234", partDescription: "seat",
        quantity: 2, price: NSDecimalNumber(string: "375.00"))!,
    CommissionEmployee(name: "Sue Jones",
        grossSales: NSDecimalNumber(string: "10000.00"),
        commissionRate: NSDecimalNumber(string: "0.06"))!,
    Invoice(partNumber: "56789", partDescription: "tire",
        quantity: 4, price: NSDecimalNumber(string: "79.95"))!,
    BasePlusCommissionEmployee(name: "Bob Lewis",
        grossSales:NSDecimalNumber(string:"5000.00"),
        commissionRate: NSDecimalNumber(string: "0.04"),
        baseSalary: NSDecimalNumber(string: "300.0"))!
]

print("INVOICES AND EMPLOYEES PROCESSED POLYMORPHICALLY\n")

// display each Payable's description and paymentAmount properties
for currentPayable in payableObjects {
    print(currentPayable) // implicitly uses description property
    let paymentAmount = formatAsCurrency(currentPayable.paymentAmount)
    print("Payment Due: \(paymentAmount)\n")
}


