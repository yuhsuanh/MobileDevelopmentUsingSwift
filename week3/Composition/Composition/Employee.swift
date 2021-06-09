// Employee.swift
// Employee class composed of Strings and NSDates
import Foundation

public class Employee {
    public var firstName: String
    public var lastName: String
    public var birthDate: NSDate // date type, with NS as prefix they are from Objective-C predined
    // date classes
    public var hireDate: NSDate // date type
    
    // designated initializer - initializes all the properties
    public init(firstName: String, lastName: String,
        birthDate: NSDate, hireDate: NSDate) {
            
        self.firstName = firstName
        self.lastName = lastName
        self.birthDate = birthDate
        self.hireDate = hireDate
    }
    
    // Computed property - description
    // return String representation of an Employee
    public var description: String {
        let formatter = DateFormatter() // used to format dates
        //formatter.timeStyle = DateFormatter.Style.NoStyle // no time
        //formatter.timeStyle = DateFormatter.Style.NoStyle
        
        //formatter.dateStyle = DateFormatter.Style.LongStyle

        formatter.dateStyle = DateFormatter.Style.short
        
        formatter.locale = NSLocale.current
        
        return String(format: "%@, %@\nHired: %@\nBorn: %@",
            lastName, firstName, formatter.string(from: hireDate as Date),
            formatter.string(from: birthDate as Date))
    }
} 

