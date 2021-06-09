// main.swift
// Polymorphic Employee hierarchy
// Two type: this is an example of inheritance polymorphism
// Second type is: Protocol polymorphism
import Foundation

// create a SalariedEmployee
let salariedEmployee = SalariedEmployee(name: "John Smith", weeklySalary: NSDecimalNumber(string: "800.00"))!

// create a CommissionEmployee
let commissionEmployee =
    CommissionEmployee(name: "Sue Jones",
        grossSales:NSDecimalNumber(string: "10000.00"),
        commissionRate: NSDecimalNumber(string: "0.06"))!

// create and test a BasePlusCommissionEmployee
let basePlusCommissionEmployee =
    BasePlusCommissionEmployee(name: "Bob Lewis",
        grossSales:NSDecimalNumber(string:"5000.00"),
        commissionRate: NSDecimalNumber(string: "0.04"),
        baseSalary: NSDecimalNumber(string: "300.0"))!

print("EMPLOYEES PROCESSED INDIVIDUALLY\n")
print("\(salariedEmployee.description)\nEarned: ")
print(formatAsCurrency(number: salariedEmployee.earnings))
print("\n\(commissionEmployee.description)\nEarned: ")
print(formatAsCurrency(number: commissionEmployee.earnings))
print("\n\(basePlusCommissionEmployee.description)\nEarned: ")
print(formatAsCurrency(number: basePlusCommissionEmployee.earnings))
print()

// create initially empty Array of Employees
// every element of this array is an object of array class.
// elements in an array can be of use defined types- user defined type is Employee
var employees: [Employee] = []

// initialize array with Employees
employees.append(salariedEmployee)
employees.append(commissionEmployee)
employees.append(basePlusCommissionEmployee)
// What is polymorphism? An object of child class/sub class/ derived class can be treated as if it is an object parent class/super class / base class
// ONE BUSINESS REQUIREMENT IS __ IF EMPLOYEE IS OF TYPE BASEPLUSCOMMISSION, then increase the base salary by 10%
print("\nEMPLOYEES PROCESSED POLYMORPHICALLY\n")

// display each Employee's description and earnings properties
for currentEmployee in employees {
    print(currentEmployee.description)
    
    // if BasePlusCommissionEmployee, increase base salary
    if let employee = currentEmployee as? BasePlusCommissionEmployee {
        employee.baseSalary =
            employee.baseSalary.multiplying(by: NSDecimalNumber(string: "1.1"))
        print("New base salary with 10% increase is: ")
        print(formatAsCurrency(number: employee.baseSalary))
    } // END IF STATEMENT
    
    print("Earned: \(formatAsCurrency(number: currentEmployee.earnings))\n")
}  // END LOOP
// The object of child class/derived class/sub class can be treated as if it is an object of parent class/base class/super class


