// Employee.swift
// Employee class with a type property and type method
		
// global because classes do not yet support stored type properties
private var employeeCount: Int = 0

public class Employee {
    public var name: String = ""
    
    // designated initializer
    public init(name: String) {
        self.name = name
        employeeCount += 1 // increment global private variable
        print("Employee init: \(name); count = \(Employee.getCount())")
    }
    
    // deinitializer - similar to destructor in Java/C#
    // To avoid memory leaks
    // Invoked automatically or imlicitly at the time of destruction of an object
    // Destruction means - set the object reference to nil
    deinit {
        employeeCount -= 1 // decrement global private variable
        print("Employee deinit: \(name); count = \(Employee.count)")
    }
    
    // computed read-only type property
    // with class keyword - they are similar to static property in Java and C#
    // typed properties means - they are like static in java and C#
    
    public class var count: Int {
        return employeeCount
    }
    
    // type method - similar to static in Java/C#
    public class func getCount() -> Int {
        return self.count
    }
}
