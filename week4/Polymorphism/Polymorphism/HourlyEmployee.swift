//
//  HourlyEmployee.swift
//  Polymorphism
//

// YOU CAN EXTEND THE HIERARCHY..meaning is you can add more classes.
// INheritance is basically creating new classes from the existing class
// They facilitates the code reusability
// If any member is private then it can not be inherited.

import Foundation
public class HourlyEmployee : Employee {
     public var hourlyRate: NSDecimalNumber!
     public var numberofHoursWorked: NSDecimalNumber!
    // earnings will rate multiplied by hours..
    
}
