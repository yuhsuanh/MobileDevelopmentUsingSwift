// Example: Sorting an Array with method sorted and closures

// return true if s1 < s2
func ascendingOrder(s1: String, s2: String) -> Bool {
    return s1 < s2
}

// Array of color names to sort
let colors = ["red", "orange", "yellow", "green", "blue", "indigo", "violet"]

print("Array colors unsorted:\n\(colors.description)\n")

// sort ascending: function ascendingOrder
let sortedColors1 = colors.sorted(by:ascendingOrder)
print("Array sortedColors1:\n\(sortedColors1.description)\n")

// sort descending: fully typed closure expression
let sortedColors2 =
    colors.sorted(by:{(s1: String, s2: String) -> Bool in return s1 > s2})
print("Array sortedColors2:\n\(sortedColors2.description)\n")

// sort ascending: inferred types
let sortedColors3 = colors.sorted(by:{s1, s2 in return s1 < s2})
print("Array sortedColors3:\n\(sortedColors3.description)\n")

// sort descending: inferred types and implicit return
let sortedColors4 = colors.sorted(by:{s1, s2 in s1 > s2})
print("Array sortedColors4:\n\(sortedColors4.description)\n")

// sort ascending: shorthand closure arguments
let sortedColors5 = colors.sorted(by:{$0 < $1})
print("Array sortedColors5:\n\(sortedColors5.description)\n")

// sort descending operator function >
let sortedColors6 = colors.sorted(by: >)
print("Array sortedColors6:\n\(sortedColors6.description)\n")

// reversing the elements of an Array
let reversedArray = sortedColors6.reversed()
print(reversedArray)
//print("Array reversed:\n\(reversedArray.description)")


