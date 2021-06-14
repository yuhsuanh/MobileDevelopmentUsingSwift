// SalariedEmployee.swift
// CommissionEmployee class

import Foundation

open class SalariedEmployee : Employee {
    open var weeklySalary: NSDecimalNumber!
    
    // failable initializer
    public init?(name: String, weeklySalary: NSDecimalNumber) {
        super.init(name: name) // initialize inherited property
            
        // if any arguments are invalid, return nil
        if weeklySalary.compare(NSDecimalNumber.zero) ==
            ComparisonResult.orderedAscending {

            return nil // an initializer argument was invalid, so fail
        }
        
        self.weeklySalary = weeklySalary
    }
    
    // earnings computed property
    open override var earnings: NSDecimalNumber {
        return weeklySalary
    }
    
    // description computed property
    open override var description: String {
        return String(format:"%@: %@\n%@: %@",
            "Salaried Employee", super.description,
            "Weekly Salary", formatAsCurrency(weeklySalary))
    }
}


