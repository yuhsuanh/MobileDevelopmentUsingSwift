
// OverloadedFunctions.playground
// Overloaded function example...
// Printing Array elements using overloaded functions.
// Same name for all the definitions of a overloaded function
// we have two overloads
// Numbers of parameters, Types of parameters, and then order or sequence of parameters
// print an Int Array

// Definition 1.0
func printArray(_ values: [Int]) {
    print("[")
    for i in 0..<values.count {
        //i < values.count - 1 ? print("\(values[i]), ") : print(values[i])
       print("\(values[i]), ")
    }
    print("]")
} // end func

// Definition 2.0
// print a Double Array
func printArray(_ values: [Double]) {
    print("[")
    for i in 0..<values.count {
       // i < values.count - 1 ? print("\(values[i]), ") : print(values[i])
        print("\(values[i]), ")
    }
    print("]")
} // end method

// Definition 3.0
// print a String Array
func printArray(_ values: [String]) {
    print("[")
    for i in 0..<values.count {
       // i < values.count - 1 ? print("\(values[i]), ") : print(values[i])
        print("\(values[i]), ")
    }
    print("]")
} // end method

// for printing names/string values
// antoher def for printing characters

//.. Testing of above definitions:
// create Arrays
let emptyIntegers: [Int] = []
let integers = [1, 2, 3, 4, 5, 6, 7, 8, 9]  // int array
let doubles = [1.1, 2.2, 3.3, 4.4, 5.5, 6.6] // double array
let courseNames = ["Swift", "Python"] // string array

print("emptyIntegers contains: ")
printArray(emptyIntegers) // pass empty Int Array
print("\nintegers contains: ")
printArray(integers) // pass Int Array
print("\ndoubles contains: ")
printArray(doubles) // pass Double Array
print("\n String array contains: ")
printArray(courseNames) // pass String Array
print()

// TO DO:
//Try it for Character

// TO DO:
// Try to have a func SUM() { ..} function which adds up two, three values of different types
func sum(num1:Int, num2:Int) {  } // first def.
func sum(num1:Int, num2:Int, num3:Int) {  } // Second Def
func sum(num1:Double, num2:Double) { }

