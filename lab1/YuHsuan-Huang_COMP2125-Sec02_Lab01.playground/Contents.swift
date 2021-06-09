/*
 Collge: Georgian College
 Course Code: COMP2125-02
 Course Name: Mobile Developement Using Swift
 Student Number: 200443723
 Author: Yu-Hsuan Huang
 Date: 2021/05/31
 */

import Cocoa


/* ================== Exercise 01 ================== */
// Exercise 01:
// Write a generic function to swap the content of any two variables
//Demonstrate it by integers, doubles and string types of variables
print("================== Exercise 01 ==================")

// use underline can use the parameter without name when you call
// if you want to change the value, you can use the keyword 'inout'
func swap<T>(_ num1: inout T, _ num2: inout T) {
    let tempVar = num1 // temp value: never change, so use 'let'
    num1 = num2
    num2 = tempVar
}

// Exercise 01 Testers
// Integer tester
print("Integer test")
var intNum1 = 1
var intNum2 = 2
print("Before:", intNum1, intNum2)
swap(&intNum1, &intNum2)
print("After:", intNum1, intNum2, "\n")

// Double tester
print("Double test")
var doubleNum1 = 1.11
var doubleNum2 = 2.22
print("Before:", doubleNum1, doubleNum2)
swap(&doubleNum1, &doubleNum2)
print("After:", doubleNum1, doubleNum2, "\n")

// String tester
print("String test")
var stringNum1 = "First"
var stringNum2 = "Second"
print("Before:", stringNum1, stringNum2)
swap(&stringNum1, &stringNum2)
print("After:", stringNum1, stringNum2, "\n")





/* ================== Exercise 02 ================== */
// Exercise 02:
// Calculating the sum and average of an integer array and return
print("================== Exercise 02 ==================")

// This function will return a Tuple Data type
func SumAvgArray(values:[Int]) -> (Int, Double) {
    
    let sum = values.reduce(0, +) // use + is same as {$0 + $1}
    let avg: Double = Double(sum) / Double(values.count) // you need to convert the values to double
    
    return (sum, avg)
}

// Exercise 02 Tester
var intArray:[Int] = [101, 102, 103]
let returnValue = SumAvgArray(values: intArray)
print(intArray.description)
print("Sum:", returnValue.0, "Average:", returnValue.1, "\n") //get first use 0 and second use 1






/* ================== Exercise 03 ================== */
// Exercise 03:
// Calculate the following:
//      1. Average temperature for each day
//      2. Average temperature for the week
//      3. Highest temperature for each day
print("================== Exercise 03 ==================")
// Key as string and value as an array
let tempReadings = [
    "Monday" : [12, 25, 10], //representing the temperature during morning, day and evening
    "Tuesday" : [2, 15, 9],
    "Wednesday" : [11, 29, 22],
    "Thursday" : [7, 11, 9],
    "Friday" : [ 16, 22, 20]
]

var sumTemps = 0; // use to save sum of temperatures
for (day, temps) in tempReadings {
    
    let sum = temps.reduce(0, {$0 + $1}) // same as '+'
    let avg = Double(sum) / Double(temps.count)
    sumTemps += sum
    
    // easy to get highest temperature use max method
    print(String(format:"%@\tAvg: %.2f, Highest: %d", day, avg, temps.max()!))
}

// Exercise 03 Tester
print(String(format:"Average temperature for the week: %.2f", Double(sumTemps) / Double(tempReadings.count*tempReadings.first!.value.count)), "\n")






/* ================== Exercise 04 ================== */
// Exercise 04:
// ModifyStockValues which increase the each value by 10.00
// ModifyStockValues whcih change the value of any single data value
print("================== Exercise 04 ==================")
var stockValues = [30.50, 10.25, 60.75, 100.25, 45.45, 89.60, 20.50, 55.55, 90.0, 70.0]

// use map to add 10 to all elements (also can use loop)
func ModifyStockValues(stockValues: inout [Double]) {
    stockValues = stockValues.map({ $0 + 10});
}
print("Before:", stockValues.description)
print("Execute ModifyStockValues")
ModifyStockValues(stockValues: &stockValues)
print("After:", stockValues.description, "\n")

// use the random method to create changing of index and changing of value
func ModifyStockElement(stockValues: inout [Double]) {
    let index = Int.random(in: 0...stockValues.count-1)
    let value = Double(Int.random(in: 0...99999))/100 // only get 2 decimal places
    
    stockValues[index] = value
    print(String(format: "Change stockValues value to %.2f in index: %d", value, index)) // change index and value
}

print("Before:", stockValues.description)
print("Execute ModifyStockElement")
ModifyStockElement(stockValues: &stockValues)
print("After:", stockValues.description)

