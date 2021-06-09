// CommissionEmployee.swift
// CommissionEmployee superclass is the hierarchy’s base class
import Foundation
// open for if you have multiple module..this is one level up to public
// parent to swift is Objective-C language
// with NS prefix, it means it is from Objective-C
/*
 NSOrderedAscending if the value of decimalNumber is greater than the receiver; NSOrderedSame if they’re equal; and NSOrderedDescending if the value of decimalNumber is less than the receiver.
 NSOrderedAscending = -1
 NSOrderedSame = 0
 NSOrderedDescending = 1
 */

open class CommissionEmployee {
    open var name: String!
    open var grossSales: NSDecimalNumber! // equivalent to Double
    open var commissionRate: NSDecimalNumber! // equivalent to Double
    
    // failable initializer
    public init?(name: String, grossSales: NSDecimalNumber,
        commissionRate: NSDecimalNumber) {

        // if any arguments are invalid, return nil
        if name.isEmpty ||
            (grossSales.compare(NSDecimalNumber.zero) == ComparisonResult.orderedAscending) ||
            (commissionRate.compare(NSDecimalNumber.zero) == ComparisonResult.orderedAscending) {
                
            return nil // an initializer argument was invalid, so fail
        }
        
        self.name = name
        self.grossSales = grossSales
        self.commissionRate = commissionRate
    }

    // earnings computed property
    open var earnings: NSDecimalNumber {
        return commissionRate.multiplying(by: grossSales)
    }
    
    // description computed property
    open var description: String {
        return String(format:"%@: %@\n%@: %@\n%@: %@",
            "Commission Employee", name,
            "Gross Sales", formatAsCurrency(grossSales),
            "Commission Rate", formatAsPercent(commissionRate))
    }
}


