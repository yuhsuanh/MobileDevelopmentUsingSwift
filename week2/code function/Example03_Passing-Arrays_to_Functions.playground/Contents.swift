import Cocoa

// Example: Passing entire Arrays and
// individual array elements by value and by reference
// EXAMPLE 1.0:
// Passing array to functions

// display contents, size and capacity of an Array<Int>
func displayIntegers(integers: [Int]) {
    print("contents: \(integers.description)")
    print("; size=\(integers.count); capacity=\(integers.capacity)")
}

var integers = [Int]() // create an empty variable Array<Int>
print("After creating integers")
displayIntegers(integers: integers) // function call

if integers.isEmpty { // true if integers contains 0 elements
    print("integers is empty")
}

// append each value of i to integers
print("\nAppending values 1-5")
for i in 1...5 {
    integers.append(i)
    displayIntegers(integers: integers) // func call
}

// inserting elements
integers.insert(0, at:0)
integers.insert(6, at:integers.count)
print("\nAfter inserting 0 at index 0 and 6 at integers.count")
displayIntegers(integers: integers) // func call

// appending elements with +=
integers += [7, 8, 9]
print("\nAfter appending 7, 8 and 9 with +=")
displayIntegers(integers: integers) // func call

// removing element 0 and the last element
print("\n\(integers.remove(at: 0)) was removed")
print("\(integers.removeLast()) was removed")
print("After removing element 0 and the last element")
displayIntegers(integers: integers) // func call

// removing all elements
integers.removeAll() // by default, element storage is deallocated
print("\nAfter removing all remaining elements")
displayIntegers(integers: integers) // func call

//Example 2.0 pass by value - entire array

// multiply all elements by 2--original Array not modified
func doesNotModifyArray( values: [Int]) {
    var values = values
    for i in 0 ..< values.count {
        values[i] *= 2
    }
} // end func

//.. Testing of doesNotModifyArray()
// Array is passed by value
var numbers = [1, 2, 3, 4, 5]

print("numbers before doesNotModifyArray func call: \(numbers.description)")
doesNotModifyArray(values: numbers)
print("numbers after doesNotModifyArray func call: \(numbers.description)")

// Example 3.0
// multiply individual element by 2--original Array not modified
func doesNotModifyElement( element: Int) {
    var element = element
    element *= 2
}

//.. Testing of doesNotModifyArrayElement()
// An Array element is passed by value
var scores = [1, 2, 3, 4, 5]

print("\n scores[3] before doesNotModifyElement func call: \(scores[3])")
doesNotModifyElement(element: scores[3])
print("\n scores[3] after doesNotModifyElement func call: \(scores[3])")

// Example 4.0
// pass by reference an entire array
// multiply all elements by 2--original Array modified
func modifyArray(values: inout [Int]) {
    for i in 0 ..< values.count {
        values[i] *= 2
    }
}
//.. Testing of example 4.0
// pass entire Array by reference
var cgpa = [3, 2, 4, 1]
print("\n cgpa before modifyArray: \(cgpa.description)")
modifyArray(values: &cgpa) // & indicates pass by reference
print("\n cgpa after modifyArray: \(cgpa.description)")


// Example 5.0
// pass by reference an array element
// multiply individual element by 2--original Array modified
func modifyElement(element: inout Int) {
    element *= 2
}

//.. Testing of example 5.0
// pass one Array element by value
var values = [5, 10, 7, 8]
print("\n values[3] before modifyElement: \(values[3])")
modifyElement(element: &values[3]) // & indicates pass by reference
print("\n values[3] after modifyElement: \(values[3])")

