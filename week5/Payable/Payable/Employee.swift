// Employee.swift
// Employee class that conforms to the Payable protocol via extensions
import Foundation

open class Employee {
    open var name: String!
    
    // failable initializer: if name is empty, return nil
    public init?(name: String) {
        if name.isEmpty {
            return nil
        }
        
        self.name = name
    }
    
    // earnings computed property
    open var earnings: NSDecimalNumber {
        return NSDecimalNumber.zero
    }
    
    // description computed property
    open var description: String {
        return name
    }
}

// add Payable conformance to entire Employee hierarchy
extension Employee : Payable {
    var paymentAmount: NSDecimalNumber {
        return earnings
    }
}

// add Printable conformance to entire Employee hierarchy; empty
// extension because all Employee's already have a description property

// extension Employee : Printable {}


