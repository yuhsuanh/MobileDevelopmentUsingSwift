// CommissionEmployee.swift
// CommissionEmployee class
import Foundation
/*
 NSOrderedAscending if the value of decimalNumber is greater than the receiver; NSOrderedSame if they’re equal; and NSOrderedDescending if the value of decimalNumber is less than the receiver.
 NSOrderedAscending = -1
 NSOrderedSame = 0
 NSOrderedDescending = 1
 */

open class CommissionEmployee : Employee {
    open var grossSales: NSDecimalNumber!
    open var commissionRate: NSDecimalNumber!
    
    // failable initializer
    public init?(name: String, grossSales: NSDecimalNumber,
        commissionRate: NSDecimalNumber) {
        
        super.init(name: name) // initialize inherited property

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
    open override var earnings: NSDecimalNumber {
        return commissionRate.multiplying(by: grossSales)
    }
    
    // description computed property
    open override var description: String {
        return String(format:"%@: %@\n%@: %@\n%@: %@",
            "Commission Employee", super.description,
            "Gross Sales", formatAsCurrency(grossSales),
            "Commission Rate", formatAsPercent(commissionRate))
    }
}


