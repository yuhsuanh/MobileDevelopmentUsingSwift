// Examples based on for loops


//.. Example 1.0
for count in 1...5 {
    //print("\(count) ")
    print(count)
}

//... Example 2.0
for values in 11...20 { // supposed to loop 10 times
    
    print("\(values)  ")

} //end for

//... Example 3.0
// you can omit variable name if you are not using it's value
for _ in 1...5 {
    
    print("* ")
}

//... Example 4.0
// Prints from 1 to 4 (one less then the value specified)
for num in 1..<5 {
    print("\(num) ")
} // end for loop

//... Example 5.0
for counter in stride(from: 11, through: 1, by: -2) {
    print("\(counter) ")
}

//... Example 6.0 - Displays values from 10 to 40 by the increment of 10, not including 50
for numbers in stride(from: 10, to: 50, by: 10) {
    print("\(numbers) ")
}
//... Example 8.0
// printing odd numbers between 1 and 10
for items in 1...10
{
    if (items % 2 == 0)
    {
        print("\(items) ")
    }
} // end for

//... Example 9.0
// finding sum of even numbers between 10 and 20 using for...in
var sum:Int = 0
for intValues in 10...20
{
    if (intValues % 2) == 0
    {
        sum += intValues
    }
} // end for
print("\(sum) ")

//... Example 10.0
// use of break statement
for count in 1...10 { // supposed to loop 10 times
    if (count == 5) {
        break // terminates loop if count is 5
    }
    
    print("\(count)  ")
}

//... Example 11.0
// Example: continue statement exiting a for...in statement
for count in 1...10 { // supposed to loop 10 times
    if (count == 5) {
        continue // move to next iteration of the loop
        // don't do anything
    }
    
    print("\(count)  ")
    
}

let myplayground = "Hello, playground"

var mutablePlayground = "Hello, mutable playground"
mutablePlayground += "!"

for ch: Character in mutablePlayground
{
    print("\(ch)")
}
print()
