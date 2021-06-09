// SalariedEmployee.swift
// SalariedEmployee class derived from class Employee
import Foundation

public class SalariedEmployee : Employee {
    public var weeklySalary: NSDecimalNumber!
    
    // failable initializer
    public init?(name: String, weeklySalary: NSDecimalNumber) {
        super.init(name: name) // initialize inherited property
            
        // if any arguments are invalid, return nil
        // ComparisonResult.orderedAscending - means left operand is smaller than right operand
        if weeklySalary.compare(NSDecimalNumber.zero) == ComparisonResult.orderedAscending {

            return nil // an initializer argument was invalid, so fail
        }
        
        self.weeklySalary = weeklySalary
    }
    
    // earnings computed property
    public override var earnings: NSDecimalNumber {
        return weeklySalary
    }
    
    // description computed property 
    public override var description: String {
        return String(format:"%@: %@\n%@: %@",
            "Salaried Employee", super.description,
            "Weekly Salary", formatAsCurrency(number: weeklySalary))
    }
}


