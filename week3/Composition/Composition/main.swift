// main.swift
// Composition demonstration.
import Foundation

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd" // "2019-08-11" is August 11, 2019

let birthDate = dateFormatter.date(from: "1989-09-22")!
let hireDate = dateFormatter.date(from: "2017-12-15")!
let employee = Employee(firstName: "John", lastName: "Edward",
    birthDate: birthDate as NSDate, hireDate: hireDate as NSDate)
print(employee.description)

