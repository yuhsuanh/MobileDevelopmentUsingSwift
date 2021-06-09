// Employee.swift
// Employee base class
import Foundation

public class Employee {
    public var name: String!
    
    // failable initializer: if name is empty, return nil
    public init?(name: String) {
        if name.isEmpty {
            return nil
        }
        
        self.name = name
    }
    
    // earnings computed property
    public var earnings: NSDecimalNumber {
        return NSDecimalNumber.zero
    }
    
    // description computed property
    public var description: String {
        return name
    }
}


