import Cocoa // for macos
// import UIKit -- that is for iOS

//.....Example of Functions....//
//
//... VERSION 01: Function - maximum with no parameters and no return type

// calculates the maximum of its three Double parameters
// func keyword is used
// this version does not takes any input and does not return any value. No return value
func maximum() {
    let x: Double = 3.6
    let y: Double = 4.2
    let z: Double = 2.7
    var maximumValue = x // assume x is the largest to start
    
    // determine whether y is greater than maximumValue
    if y > maximumValue {
        maximumValue = y
    }
    
    // determine whether z is greater than maximumValue
    if z > maximumValue {
        maximumValue = z
    }
    
    print("Ver 1.0: Maximum of three values: \(maximumValue)")
} //end func - maximum

//.. Test function maximum
maximum()
print(maximum()) // method call


//... VERSION 02: Function - maximum2() with no parameters and but return type
// returns the maximum of its three Double parameters
// double maximum2() {...} in C# and Java
// return type is indicated by: -> return_type
func  maximum2() -> Double {
    
    let x: Double = 3.6
    let y: Double = 4.2
    let z: Double = 6.7
    var maximumValue = x // assume x is the largest to start
    // determine whether y is greater than maximumValue
    if y > maximumValue {
        maximumValue = y
    }
    
    // determine whether z is greater than maximumValue
    if z > maximumValue {
        maximumValue = z
    }
    
    return maximumValue // return statement is required when a function returns a value
} // end func maximum2()

//.. Test function maximum2()
print("Ver 2.0 Maximum of three values: \(maximum2())") //..Method Call


//... VERSION 03: Function - maximum with input parameters and but no return type

// prints the maximum of its three Double parameters
// void maximum3(Double x, Double y, Double z) { ...} in C# and Java

func maximum3(x: Double, y: Double, z: Double) {
    var maximumValue = x // assume x is the largest to start
    
    // determine whether y is greater than maximumValue
    if y > maximumValue {
        maximumValue = y
    }
    
    // determine whether z is greater than maximumValue
    if z > maximumValue {
        maximumValue = z
    }
    
    print("Ver 3.0 Maximum of three values: \(maximumValue)")
} // end func

//.. Test function maximum3()
print(maximum3(x: 3.3, y: 2.2, z: 1.1)) // Method Call

//... VERSION 04: Function - maximum4 with parameters and return type
// returns the maximum of its three Double parameters
// double maximum4(double x, double y, double z) { ...} in C# and Java
// But in Swift return is indicatd by: -> return_type

func maximum4(x: Double, y: Double, z: Double) -> Double {
    var maximumValue = x // assume x is the largest to start
    
    // determine whether y is greater than maximumValue
    if y > maximumValue {
        maximumValue = y
    }
    
    // determine whether z is greater than maximumValue
    if z > maximumValue {
        maximumValue = z
    }
    
    return maximumValue
} // end func

//.. Test function maximum4()
print("Ver 4.0 Maximum of 3.3, 2.2 and 1.1 is: \(maximum4(x: 3.3, y: 2.2, z: 1.1))")
print("Ver 4.0 Maximum of 11.1, 13.3 and 12.2 is: \(maximum4(x: 1.1, y: 3.3, z: 2.2))")
print("Ver 4.0 Maximum of 12.2, 11.1 and 13.3 is: \(maximum4(x: 2.2, y: 1.1, z: 3.3))")


// ... Example 5.0
//func Largest(firstNumber x:Int, secondNumber y:Int, thirdNumber z:Int)->Int
// Uses alias for parameters name
func Largest(firstNumber x:Int, secondNumber y:Int, thirdNumber z:Int) -> Int
{
    var max = x
    if(y > max)
    {
        max = y
    }
    if(z > max)
    {
        max = z
    }
    return max
} // end function

// ..Testing the function Largest
print("Example 5.0: Largest of three values: \(Largest(firstNumber:42, secondNumber:23, thirdNumber:67))") //  function call ..

// ... Example 6.0
//func Biggest(_ x:Int, _ y:Int, _ z:Int)->Int
// Uses underscore character "-" for not specifying the parameter name in the function call

func Biggest(_ x:Int, _ y:Int, _ z:Int) -> Int {
        var max = x
        if(y > max)
        {
            max = y
        }
        if(z > max)
        {
            max = z
        }
    return max
} // end function

// ..Testing the function Biggest
// Since underscore is used in functioon definition, no need to specify the
print("Example 6.0:Biggest of three values: \(Biggest(42,23,17))") // function call

//...Example 07: Default parameter values

// use iteration to calculate power of base raised to the exponent
// if no value is provided for exponent, its default value '2' is used
func power(base: Int, exponent: Int = 2) -> Int {
    var result = 1;
    
    for i in 1...exponent {
        result *= base
    }
    
    return result
}

// call power with and without default parameter values
print("power(10) = \(power(base: 10))") // exponent value is assumed to be 2
print("power(2, exponent: 10) = \(power(base: 2, exponent: 10))")

//...Example 08: Pass-by-reference with inout parameters

// ... Example with the use of inout
// square function that modifies its argument in the caller
// inout is similar to ref in Java and C#

func square( value: inout Int) {
  value *= value // squares value of caller's variable
}


//.. Test square inout parameter ..
var x = 5
print("Original value of x is \(x)")
square(value: &x) // function call, '&' is used to indicate 'inout'
print("Value of x after calling square(&x) is \(x)") // output is 25. Also this becomes new value of x
square(value: &x) // before the call, value of x is 25

//...Example 09: Recursive factorial function

// recursive factorial function
// Int is equivalent to Int32
// Int64 is bigger integer type to hold the large integer values
func factorial(number: Int64) -> Int64 {
    // base case
    if number <= 1 {
        return 1
    } else { // recursion step
        return number * factorial(number: number - 1)
    }
}

//.. Testing of factorial
// calculates the factorials of 0 through 10
for counter in 0...10 {
    print("\(counter)! = \(factorial(number: Int64(counter)))")
}

//...Example 10:
// Converting numeric grades to letter grades with switch
// function to return a numeric grade's letter equivalent
func convertToLetterGrade(grade: Int) -> String {
    var letterGrade = "Invalid grade"
    
    switch grade {
    case 90...100: // grade was 90-100
        letterGrade = "A"
    case 80...89: // grade was between 80 and 89
        letterGrade = "B"
    case 70...79: // grade was between 70 and 79
        letterGrade = "C"
    case 60...69: // grade was between 60 and 69
        letterGrade = "D"
    case 0...59: // grade was between 0 and 59
        letterGrade = "F"
    default: // grade was out of range
        break
    } // end switch..case
    
    return letterGrade
} // end func

print("Letter grade for 100: \(convertToLetterGrade(grade: 100))")
print("Letter grade for 95:  \(convertToLetterGrade(grade: 95))")
print("Letter grade for 89:  \(convertToLetterGrade(grade: 89))")
print("Letter grade for 70:  \(convertToLetterGrade(grade: 70))")
print("Letter grade for 63:  \(convertToLetterGrade(grade: 63))")
print("Letter grade for 32:  \(convertToLetterGrade(grade: 32))")
print("Letter grade for -1:  \(convertToLetterGrade(grade: -1))")
print("Letter grade for 101: \(convertToLetterGrade(grade: 101))")

// Not a user friendly way to display the output.
print(convertToLetterGrade(grade: 100))
print(convertToLetterGrade(grade: 95))
print(convertToLetterGrade(grade: 89))
print(convertToLetterGrade(grade: 70))
print(convertToLetterGrade(grade: 63))
print(convertToLetterGrade(grade: 32))
print(convertToLetterGrade(grade: -1))
print(convertToLetterGrade(grade: 101))
