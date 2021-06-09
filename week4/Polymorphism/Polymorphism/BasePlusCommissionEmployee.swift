// BasePlusCommissionEmployee.swift
// BasePlusCommissionEmployee class
import Foundation

public class BasePlusCommissionEmployee : CommissionEmployee {
    public var baseSalary: NSDecimalNumber!
    
    // failable initializer
    public init?(name: String, grossSales: NSDecimalNumber,
        commissionRate: NSDecimalNumber, baseSalary: NSDecimalNumber)
    {
        super.init(name: name, grossSales: grossSales,
            commissionRate: commissionRate)

        // validate baseSalary
        if baseSalary.compare(NSDecimalNumber.zero) == ComparisonResult.orderedAscending {
                
            return nil // baseSalary was invalid, so fail
        }
        
        self.baseSalary = baseSalary
    }
    
    // earnings computed property
    public override var earnings: NSDecimalNumber {
        return baseSalary.adding(super.earnings)
    }
    
    // description computed property
    public override var description: String {
        return String(format:"%@ %@\n%@: %@",
            "Base-Salaried", super.description, "Base Salary",
            formatAsCurrency(number: baseSalary))
    }
}


