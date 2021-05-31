// Ex03_Maximum.playground
// Generic function maximum with a type constraint on its type parameter

// Determines the largest of three Comparable objects
// Comparable is a pre-defined protocol like an Interface in C# and Java
// Here you are putting a constraint and saying that type which which you are comparing, they should have this protocol implemented
// It is an example of Type Constraint

func maximum<T: Comparable>(_ x: T, _ y: T, _ z: T) -> T {
    var max = x // assume x is initially the largest
    
    if y > max {
        max = y // y is the largest so far
    }
    
    if z > max {
        max = z // z is the largest
    }
    
    return max // returns the largest object
}

// Calling the function with three integer values
print("Maximum of 3, 14 and 5 is \(maximum(3, 14, 5))")

// Calling the function with three double values
print("Maximum of 6.6, 8.8 and 7.7 is \(maximum(6.6, 8.8, 7.7))")

// Calling the function with three string values
print("Maximum of pear, apple, orange is ")
print(maximum("pear", "apple", "orange")) // this is done based on ascii values

// TODO:
// You can try func minimum<T:Comparable>( _ num1: T, _ num2:T, _ num3:T) { ... }

// TODO:
// You can try func search<T:Comparable>( _ array: [T], _ key:T) { ... }
