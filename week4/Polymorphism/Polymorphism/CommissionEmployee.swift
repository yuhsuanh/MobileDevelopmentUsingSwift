// CommissionEmployee.swift
// CommissionEmployee class derived from Employee
import Foundation
/*
 NSOrderedAscending if the value of decimalNumber is greater than the receiver; NSOrderedSame if they’re equal; and NSOrderedDescending if the value of decimalNumber is less than the receiver.
 NSOrderedAscending = -1
 NSOrderedSame = 0
 NSOrderedDescending = 1
 */
public class CommissionEmployee : Employee {
    public var grossSales: NSDecimalNumber!
    public var commissionRate: NSDecimalNumber!
    
    // failable initializer
    public init?(name: String, grossSales: NSDecimalNumber, commissionRate: NSDecimalNumber) {
        
        super.init(name: name) // initialize inherited property, calling the super class initializer

        // if any arguments are invalid, return nil
        if (grossSales.compare(NSDecimalNumber.zero) ==
            ComparisonResult.orderedAscending) ||
            (commissionRate.compare(NSDecimalNumber.zero) ==
                ComparisonResult.orderedAscending) {
            
            return nil // an initializer argument was invalid, so fail
        }
        
        self.grossSales = grossSales
        self.commissionRate = commissionRate
    }
    
    // earnings computed property
    public override var earnings: NSDecimalNumber {
        return commissionRate.multiplying(by: grossSales)
    }
    
    // description computed property
    public override var description: String {
        return String(format:"%@: %@\n%@: %@\n%@: %@",
            "Commission Employee", super.description,
            "Gross Sales", formatAsCurrency(number: grossSales),
            "Commission Rate", formatAsPercent(number: commissionRate))
    }
}


