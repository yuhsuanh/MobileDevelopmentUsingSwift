//
//  main.swift
//  EmployeeProd
//
//  Created by Yu-Hsuan Huang on 2021/5/31.
//  Copyright © 2021 Georgian College. All rights reserved.
//

import Foundation


//createing an object
var employee1 = Employee()
// display
print("Employee ID: \(employee1.empId)")
print("Employee name: \(employee1.name)")
print("Gross Sales: \(employee1.grossSales)")
print("Commission Rate: \(employee1.commRate)")
print()

//createing an object
var employee2 = Employee(empId: 102, name: "Winnie", grossSales: 45000.99, commRate: 1.55)
// display
//print("Employee ID: \(employee2.empId)")
//print("Employee name: \(employee2.name)")
//print("Gross Sales: \(employee2.grossSales)")
//print("Commission Rate: \(employee2.commRate)")
print(employee2.description)

//update the value of commission rate
employee2.commRate = 2.25
print(employee2.description)
