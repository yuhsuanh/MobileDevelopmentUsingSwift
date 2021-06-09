//  main.swift
// Stack test program.

// test push method with Stack<Double>
func testPush<T>( stack: inout Stack<T>, values: [T], name: String) {
    print("Pushing elements onto \(name): ")
    
    // push elements
    for value in values {
        print("\(value) ")
        stack.push(element: value)
    }
    
    print()
}

// test pop method with Stack<Double>
func testPop<T>( stack: inout Stack<T>, name: String) {
    print("Popping elements from \(name): ")
    
    // remove all elements from Stack
    while let value = stack.pop() {
        print("\(value) ")
    }
    
    print()
}

// Create and test a Stack<Double> 
let doubles = [1.1, 2.2, 3.3]
var doubleStack = Stack<Double>()
testPush(stack: &doubleStack, values: doubles, name: "doubleStack")
testPop(stack: &doubleStack, name: "doubleStack")

// Create and test a Stack<Int>
let integers = [1, 2, 3]
var intStack = Stack<Int>()
testPush(stack: &intStack, values: integers, name: "intStack")
testPop(stack: &intStack, name: "intStack")

// Create and test a Stack<Int>
let strings = ["apple", "banana", "cherry"]
var stringStack = Stack<String>()
testPush(stack: &stringStack, values: strings, name: "stringStack")
testPop(stack: &stringStack, name: "stringStack")

