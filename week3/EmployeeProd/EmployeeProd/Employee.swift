//
//  Employee.swift
//  EmployeeProd
//
//  Created by Yu-Hsuan Huang on 2021/5/31.
//  Copyright © 2021 Georgian College. All rights reserved.
//

import Foundation

// Creating a class Employee
// Defing them stroed properties
// id, name, gross, sales, commission rate
// initializers
// computed properties
// overloaded initializers

public class Employee {
    var empId: Int = 100
    var name: String = "Sean"
    var grossSales: Double = 30000.00
    var commRate: Double = 1.75
    
    //initialize parameterless
    init() {
    }
    //initialize
    init(empId: Int, name:String, grossSales: Double, commRate: Double) {
        self.empId = empId
        self.name = name
        self.grossSales = grossSales
        self.commRate = commRate
    }
    
    var description: String {
        return String(format: "\nEmployee ID: %d\nEmployee Name: %@\nGross Sales: %.2f\nCommission Rate: %.2f", empId, name, grossSales, commRate)
    }
    
}
