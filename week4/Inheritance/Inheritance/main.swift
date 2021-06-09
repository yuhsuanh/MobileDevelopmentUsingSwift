// Inheritance Example ..
// main.swift
// Testing the CommissionEmployee-BasePlusCommissionEmployee hierarchy
import Foundation

// create and test a CommissionEmployee
let commissionEmployee =
    CommissionEmployee(name: "Sue Jones",
        grossSales:NSDecimalNumber(string: "10000.00"),
        commissionRate: NSDecimalNumber(string: "0.06"))

// get commission employee data
if let employee = commissionEmployee {
    print("COMMISSIONEMPLOYEE DATA VIA PROPERTIES")
    print("Name: \(employee.name!)")
    print("Gross Sales: \(formatAsCurrency(employee.grossSales))")
    print("Commission Rate: \(formatAsPercent(employee.commissionRate))")
    print("Earnings: \(formatAsCurrency(employee.earnings))")
    
    employee.grossSales = NSDecimalNumber(string: "5000.00")
    employee.commissionRate = NSDecimalNumber(string: "0.10")
    print("\nAFTER UPDATING GROSSSALES AND COMMISSIONRATE")
    print(employee.description)
    print("Updated Earnings: \(formatAsCurrency(employee.earnings))")
}

// create and test a BasePlusCommissionEmployee
let basePlusCommissionEmployee =
    BasePlusCommissionEmployee(name: "Bob Lewis",
        grossSales:NSDecimalNumber(string:"5000.00"),
        commissionRate: NSDecimalNumber(string: "0.04"),
        baseSalary: NSDecimalNumber(string: "300.00"))

// get commission employee data
if let employee = basePlusCommissionEmployee {
    print("\nBASEPLUSCOMMISSIONEMPLOYEE DATA VIA PROPERTIES")
    print("Name: \(employee.name)")
    print("Gross Sales: \(formatAsCurrency(employee.grossSales))")
    print("Commission Rate: \(formatAsPercent(employee.commissionRate))")
    print("Base Salary: \(formatAsCurrency(employee.baseSalary))")
    print("Earnings: \(formatAsCurrency(employee.earnings))")
    
    employee.baseSalary = NSDecimalNumber(string: "1000.00")
    print("\nAFTER UPDATING BASESALARY")
    print(employee.description)
    print("Updated Earnings: \(formatAsCurrency(employee.earnings))")
}

