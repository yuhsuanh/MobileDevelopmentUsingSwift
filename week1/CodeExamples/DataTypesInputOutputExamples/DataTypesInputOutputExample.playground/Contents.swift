import UIKit

//  An example of .playground file
// Week 01 - Mobile Application Development using Swift
//  This project is based on
// Use of various built-in DataTypes
// Use of Input and Output statements
//

// Variable declaration and initialization ..


var firstName:String = "Sujeet" //-- explicit way
//var firstName = "Sujeet"       // implicit way
var lastName:String // just declaration. No values assigned
lastName="Lohan" // This is initialization
let employeeID:Int = 1234 // constant by use of 'let' keyword. This value can not be changed afterwards.
var salary:Double = 2500.45 // Double type
var gender:Character = "M"
var activeStatus:Bool = true
let taxRate:Float = 12.5 // same format but size is smaller than Double

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
print(String(format:"First Name: %@", firstName)) // %@ is for string
print(String(format:"Last Name: %@", lastName))
print(String(format:"Employee ID: %d", employeeID)) // %d is for integers
print(String(format:"Salary: %.2f", salary)) // %f is for doubles
//print(String(format:"Gender: %c", gender )) // %c is for character
print(String(format:"Employee Status: %B", activeStatus)) // %B is for Bolean
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

// Use of print with a terminator
print("\nSwift is my favorite programming language", terminator: ".")
print("\nXCode is my favorite IDE", terminator: "!")


