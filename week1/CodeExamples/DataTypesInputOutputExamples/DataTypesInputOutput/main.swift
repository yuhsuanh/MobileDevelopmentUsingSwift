//
//  main.swift
// Week 01 - Mobile Application Development using Swift
//  This project is based on
// Use of various built-in DataTypes
// Use of Input and Output statements
//

import Foundation

// Variable declaration and initialization

var firstName:String = "Sujeet"
var lastName:String
lastName="Lohan"
let employeeID = 1234 // constant by use of let keyword
var salary:Double = 2500
var gender:Character = "M"
var activeStatus:Bool = true
let taxRate:Float = 12.5

//... Displaying the above values
print("\nDisplaying the values:")
print(firstName)
print(lastName)
print(employeeID)
print(salary)
print(gender)
print(activeStatus)
print(taxRate)

//...Displaying the values seperated by commas

print("\nDisplaying the values seperated by commas:")
print(firstName, lastName, employeeID, salary, gender, activeStatus, taxRate)


//... Displaying the above value in a formatted way using format specifiers
print("\nDisplaying the values in formatted way:")
print(String(format:"First Name: %@", firstName))
print(String(format:"Last Name: %@", lastName))
print(String(format:"Employee ID: %d", employeeID))
print(String(format:"Salary: %.2f", salary))
//print(String(format:"Gender: %c", gender ))
print(String(format:"Employee Status: %B", activeStatus))
print(String(format:"Tax Rate: %.2f", taxRate))

//... Update some the var type values
firstName = "Joe"
lastName = "Brown"
salary = 2650.75
activeStatus = false

//... Displaying the values after the update
print("\nDisplaying the values after update:")
print(firstName)
print(lastName)
print(salary)
print(activeStatus)


// ... Reading the two input values and displaying the sum

var number1:Int?  // Optional type. it can be nil if no value is provided
var number2:Int? // Optional type. it can be nil if no value is provided
var sum:Int

print("Enter the values for number1")

number1 = Int(readLine()!) // "!" is used for unwrapping an optional value

print("Enter the values for number2")
number2 = Int(readLine()!) // "!" is used for unwrapping an optional value
    
sum = number1! + number2!

print(String(format: "Sum = %d", sum)) // using the formatted way using specifier
print("Sum: \(sum)") // string interpolation
print("Sum = " + String(sum)) // using concatenation
print(sum) // just specifying the value

