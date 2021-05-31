//: Playground - noun: a place where people can play
// ArraysExamples01.playground
// More powerful than C# and Java
// Few things about arrays...
// It is group data values/item which are given a common name
// With array declaration, you specify..
// 1. name of an array
// 2. what is it's type ( of its elements )
// 3. Size of an array - how many elements
// Arrays are homogenious in nature, linear and contiguous.
// In Swift, arrays are dynamic..

import UIKit


// .... Example 1.0 ...Array initialization

var a:Int // this is an integer variable
var a1:[Int] // this is an Array declaration. Subscript or square bracket is used.

// differet types of arrays
var intArray:[Int] = [101, 102, 103] // declaration and initialization
let doubleArray:[Double] = [ 101.25, 102.45, 103.65] // A constant array
var courses = ["Swift", "Java", "Python"] // type inference - courses will be a string array
var gradeCodes = ["A", "B", "C", "D"]

var bucketList: [String] = ["Swift Programming"]  // one string element is assigned
var courseName = ["Swift Programming", "Java"]  // type inference is used

// create and display an empty Array<Int> using an empty initializer list
let prices: [Int] = [] // must specify Array's type
print("prices: \"(prices.description)")

// .... Example 2.0 .... Adding to the an array
var newbucketList = ["Climb Mt. Everest"]
newbucketList.append("Fly hot air balloon to Fiji")
newbucketList.append("Go on a walkabout")
newbucketList.append("Scuba dive in the Great Blue Hole") // Total 4 elements

// ... Example 3.0 .. count , capacity, printing individual elements and range ...//
var grades = [56, 75, 81, 44, 60, 34] // Type inference
// count property
print(grades.count)
// capacity
print(grades.capacity)
// printing contents using descriiption property
print(grades.description)
// printing without description property
print(grades)
print("Max Value: \(grades.max()!)") // Maximum , with "!", value is unwrapped
print("Min Value: \(grades.min()!)") // Minimum
print(grades.last!) // last element
print(grades.first!) // first element


//... Example 4.0
// printing array elements using for loop
for g in grades
{
print(g)
}

let integers = [2, 4, 6, 8, 10]
print("Array integers via description property: \(integers.description)")

// type inferred as Array<String> (i.e., [String]) from initializer list
let strings = ["red", "orange", "yellow", "green", "blue", "indigo", "violet"]
print("strings: \(strings.description)")

// for...in loop automatically returning each Array element
print("\nArray integers via for...in loop: ")
for element in integers {
    print("\(element)  ")
}

// ... Example 5.0 .. Printing array elements ...//
// ... Printing first three elements ....
print(grades[0...2])
// ... Printing individual elements ...
print(grades[2], grades[3])
print(grades[2], grades[3], separator: ";") // using a seperator

// ... Example 6.0 .. Summing individual elements and all the elements...//
var sum = grades[2] + grades[4] // Adding the 3rd and 5th element
print(sum)

// Adding all the elements of an array using for loop
var total=0
for g in grades
{
    total = total + g
}
print("Sum of array values: \(total)")

// ... Example 7.0 - (A): Updating a value ...//
// value before
print(newbucketList[0])

newbucketList[0] = "Climb Mt. Kilimanjaro"

// ... Example 7.0 - (B): Inserting a value ...//

// inserting elements
var temperatures = [23, 11, 15, 18, 20, 10]
temperatures.insert(0, at:0)
temperatures.insert(6, at:temperatures.count)
print("\nAfter inserting 0 at index 0 and 6 at temperatures.count")
print(temperatures.description)

// ... Example 8.0: .... Removing an item from an array ...
var grades2 = [56, 75, 81, 44, 60, 34] // Type inference
print(grades2.description)
grades.remove(at: 2) // 3rd element is removed
print(grades2.description)

// removing element 0 and the last element
print("\n\(grades2.remove(at: 0)) was removed")
print("\(grades2.removeLast()) was removed")
print("After removing element 0 and the last element")
print(grades2.description)

// removing all elements
grades2.removeAll() // by default, element storage is deallocated
print("\nAfter removing all remaining elements")
print(grades2.description)

// removing the elements at indices 5...7
var grades3 = [16, 25, 31, 14, 60, 34, 50, 80, 55]
grades3[5...7] = []
print("grades3 after removing elements 5-7: \(grades3.description)")

// removing the elements at indices 0..<2 (i.e., 0 and 1)
grades3[0..<2] = []
print("grades3 after removing elements 0-1: \(grades3.description)")

//.... Example 9.0: Using a loop to append items from one array to another ...//

var mybucketList = ["Climb Mt. Everest"]
var newItems = [
    "Fly hot air balloon to Fiji",
    "Watch the Lord of the Rings trilogy in one day",
    "Go on a walkabout",
    "Scuba dive in the Great Blue Hole",
    "Find a triple rainbow"
]

for item in newItems {
    mybucketList.append(item)
}
mybucketList.remove(at:2)
print(bucketList.count)
print(mybucketList[0...2])
mybucketList[2] += " in Australia" // you are appeding this string to the exiting value of the element
print(mybucketList[2])
mybucketList[0] = "Climb Mt. Kilimanjaro"
print(mybucketList)

//.... Example 10.0: Initialization using repeating keyword

var intNumbers = [Int](repeating: 10, count: 3) // stores 10 at index 0, 1 and 2 e.g. [10, 10, 10]
var someVar = intNumbers[0]
print( "Value of first element is \(someVar)" )
print( "Value of second element is \(intNumbers[1])" )
print( "Value of third element is \(intNumbers[2])" )
print("Value of third element is " + String(intNumbers[2])) // type casting

// create and display an Array<Bool> with all elements set to true
let booleans = [Bool](repeating: true, count: 5)
print("booleans: \(booleans.description)")

//.... Example 11.0: Adding elements by appending ...//

var intVals = [Int]() // this is an empty array
intVals.append(20)
intVals.append(30)
intVals += [40]
var num = intVals[0]
print( "Value of first element is \(num)" )
print( "Value of second element is \(intVals[1])" )
print( "Value of third element is \(intVals[2])" )

// .... Example 12.0 : Copying an array ...//

var items = [11, 22, 33, 44, 55]
var itemsCopy = items // In one assignment statement, you can copy one array to another
items[0] = 100
print(items) // without the use of description property, you can display the array elements
// Prints [100, 22, 33, 44, 55]
print(itemsCopy)
// Prints [11, 22, 33, 44, 55]

//... Example 13.0: Iterating through Array elements and printing in formatted way...//
// for loop explicitly specifying how to count
print("\n\nArray integers selected elements ")
print("in column format via counter-controlled for loop")
print("Index  Value")
for index in 0..<integers.count
{
    print(String(format:"%5d%7d", index, integers[index]))
    //print(String(format:"%-5d%-7d", index, integers[index])) // printing in left justified manner
}

//printing the above in left justified format. In a tabulated way.
// for...in loop with range of indices
print("\nArray integers in column format via for...in loop with range")
print("Index  Value")
for index in 0..<integers.count {
    print(String(format:"%-5d%-7d", index, integers[index])) // %-5d means left justified
}

//... Example 14.0: Array concatenation

// type inferred as Array<Int> (i.e., [Int]) from initializer list

let stockPrices01 = [45.23, 34.57, 12.38]
let stockPrices02 = [25.45, 35.65, 40.0]

// creating a new Array by concatenating existing Arrays with +
let newStockPrices = stockPrices01 + stockPrices02
print("integers4: \(newStockPrices.description)")

// concatenating an existing Array and an Array literal with +
var values = [1, 2, 3, 4]
// let values = values + [5, 6, 7, 8, 9]  -- NOT ALLOWED
values = values + [5, 6, 7, 8, 9]
print("values: \(values.description)")

//... Example 14.0: Subset of an array ...//

 var numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
 print("numbers: \(numbers.description)")

 // selecting the elements at indices 3...7 in integers
 var subset = numbers[3...7] // using range to intialize an array
 print("subset of numbers: \(subset.description)")

 // replacing the elements at indices 5...9
 print("numbers: \(numbers.description)")
 numbers[5...9] = [50, 60, 70]
 print("numbers after replacing elements: \(numbers.description)")


//... Example 15.0: Iterating through Array elements ...//

// for...in loop with enumerated() global function
let intValues = [10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
print("\nArray integers in column format via for...in loop with enumerated")
print("Index  Value")
for (index, element) in intValues.enumerated() {
 print(String(format:"%5d%7d", index, element))
}

