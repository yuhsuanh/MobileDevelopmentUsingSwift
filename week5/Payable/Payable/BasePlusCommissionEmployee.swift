// BasePlusCommissionEmployee.swift
// BasePlusCommissionEmployee class
import Foundation

open class BasePlusCommissionEmployee : CommissionEmployee {
    open var baseSalary: NSDecimalNumber!
    
    // failable initializer
    public init?(name: String, grossSales: NSDecimalNumber,
        commissionRate: NSDecimalNumber, baseSalary: NSDecimalNumber)
    {
        super.init(name: name, grossSales: grossSales,
            commissionRate: commissionRate)

        // validate baseSalary
        if baseSalary.compare(NSDecimalNumber.zero) ==
            ComparisonResult.orderedAscending {
                
            return nil // baseSalary was invalid, so fail
        }
        
        self.baseSalary = baseSalary
    }
    
    // earnings computed property
    open override var earnings: NSDecimalNumber {
        return baseSalary.adding(super.earnings)
    }
    
    // description property to conform to Printable protocol
    open override var description: String {
        return String(format:"%@ %@\n%@: %@",
            "Base-Salaried", super.description, "Base Salary",
            formatAsCurrency(baseSalary))
    }
}


