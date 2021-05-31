// GenericFunction.playground

// Printing Array elements using a generic function.

// print an Array
// T is type placeholder
// you are passing array, type of its elements is represented by placeholder - T
// function name must be followed by place holder in the angle brackets < >

func printArray<T>(values: [T]) {
    print("[")
    for i in 0..<values.count {
        i < values.count - 1 ? print("\(values[i]), ") : print(values[i])
    }
    print("]")
} //end method

// create Arrays
let emptyIntegers: [Int] = []
let integers = [1, 2, 3, 4, 5, 6, 7]
let doubles = [1.1, 2.2, 3.3, 4.4]
let courses = ["Java", "PHP", "CSharp", "Swift"]

print("Array emptyIntegers contains: ")
printArray(values: emptyIntegers) // pass empty Int Array
print("\n Array integers contains: ")
printArray(values: integers) // pass Int Array
print("\n Array doubles contains: ")
printArray(values: doubles) // pass Double Array

print("\n Array courses contains: ")
printArray(values: courses) // pass String Array

// Generic cases. You should define generic functions (instead of multiple overloaded definitions) for the following scenarios:

// Searching an element from given set of values  -- generic search method
// Swap/Exchange the contents of two variables of any given type - generic Swap method
//Sorting a list values, values can be of any types -- generic sort method.
// Maximum/Minimum method for finding largest/smallest value from a list of values

//NOTE: In the all above scenarios, code logic remains same, only types of input elements change

// Generic Classes
// They will be covered during the classes and objects

// TO DO:
// define a character array and pass it to the above method - printArray
print()


