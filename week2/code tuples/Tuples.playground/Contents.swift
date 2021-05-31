//: Tuples Examples

// ...Example 01: Initialization and accessing the value
// Represents a point/co-ordinate e.g (x,y)

var worker = ["John", "Smith"] // this is array declaration
var products:Dictionary = ["Iphone":2345.45, "Galaxy": 1200.50] // this is dictionay declaration
var volunteers:Set = ["John", "Smith"] // this is set declaration

var person = ("John", "Smith") // this is tuple declaration.
var firstName = person.0 // John
var lastName = person.1 // Smith

var employee = (firstName: "John", lastName: "Smith")

var firstname = employee.firstName // John
var lastname = employee.lastName // Smith

var student = (firstName: "John", lastName: "Smith")
var (first, last) = employee

var (a, b, c) = (1, 2, 3)
(a, b) = (b, a)

// Example 02: Returning multiple values by a function using tuple

func divmod(_ a: Int, _ b:Int) -> (Int, Int) {
    return (a / b, a % b)
}

divmod(7, 3) // (2, 1)
divmod(5, 2) // (2, 1)
divmod(12, 4) // (3, 0)

// ....Example 03 .. Tuples with Switch ...case

var statusCode: Int = 298
var errorString: String = "The request failed with the error:"

switch statusCode {
case 100, 101:
    errorString += " Informational, \(statusCode)."
case 204:
    errorString += " Successful but no content, 204."
case 300...307:
    errorString += " Redirection, \(statusCode)."
case 400...417:
    errorString += " Client error, \(statusCode)."
case 500...505:
    errorString += " Server error, \(statusCode)."
case let unknownCode where (unknownCode >= 200 && unknownCode < 300)
    || unknownCode > 505:
    errorString = "\(unknownCode) is not a known error code."
default:
    errorString = "Unknown error encountered."
}

let error = (statusCode, errorString) // defining a tuple

error.0 // Accessing the first value
error.1 // Accessing second value

let firstErrorCode = 404
let secondErrorCode = 200
let errorCodes = (firstErrorCode, secondErrorCode) // tuple
// in the case statement, you can specify a tuple
switch errorCodes {
case (404, 404):
    print("No items found.")
case (404, _): // '_' is don't care
    print("First item not found.")
case (_, 404):
    print("Second item not found.")
default:
    print("All items found.")
}

//...Example 04: Iterating through a Dictionary with for...in and tuple decomposition.

let months = ["January" : 31, "February" : 29,
    "March" : 31, "April" : 30,  "May" : 31, "June" : 30,
    "July" : 31, "August" : 31, "September" : 30,
    "October" : 31, "November" : 30, "December" : 31]

// print table of month numbers and names
// use for...in to iterate through months Dictionary
print("ITERATING THROUGH A DAYS-PER-MONTH-IN-A-LEAP-YEAR DICTIONARY")
print("WITH FOR...IN DECOMPOSING KEY-VALUE PAIRS INTO THE TUPLE")
print("(monthName, monthDays), THEN PRINTING THE TUPLE ELEMENTS")
for (monthName, monthDays) in months {
    print("\(monthName): \(monthDays)")
}

print()

// replace (key, value) form with tuple identifier like monthTuple,
// then say monthTuple.0 and monthTuple.1
print("ITERATING THROUGH A DAYS-PER-MONTH-IN-A-LEAP-YEAR DICTIONARY")
print("WITH FOR...IN USING A TUPLE NAME LIKE monthTuple")
print("THEN DECOMPOSING THE TUPLE WITH monthTuple.0 and monthTuple.1")
for monthTuple in months {
    print("\(monthTuple.0):  \(monthTuple.1)")
}


