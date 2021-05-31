import Cocoa

//... Example: Overloaded functions definitions ...//
// In overloaded functions, name of the method is same.
// But the number of parameters,or types of parameters or order/sequence of parameters are different.
// square function with Int argument

// few valid Overloaded functions
func myFunc(x:Int) { }
func myFunc(x:Int, y:Int) { }
func myFunc(x:Int, y:Int, z:Int) { }
func myFunc(x:Int, y:Int, z:Double) { } // myFunc(7,6,1.5)
func myFunc(x:Double, y:Int, z:Int) { } // myFunc(2.7, 7, 9)
func myFunc(x:Double, y:Int, z:String) { }
func myFunc(x:String, y:String, z:Double) { }

// Overloaded square func
// Definition 1.0
func square(value: Int) -> Int
{
    print("Called square with Int argument: \(value)")
    return value * value
}

// Overloaded defintion 2.0
// square function with Double argument
func square(value: Double) -> Double
{
    print("Called square with Double argument: \(value)")
    return value * value
}

//.. Testing of overloaded square function
print("Square of Int 7 is \(square(value:7))\n")
print("Square of Double 7.5 is \(square(value:7.5))")

// TODO: Try here..
// Min of two values
// Min of three values
// Min of 4 values
func minimum(_ num1: Int, _ num2: Int) -> Int {
    // TO DO: add the code to find smallest of two numbers ..
    var minValue = num1;
    if(num2 < minValue) {
        minValue = num2;
    }
    return minValue;
}
func minimum( num1: Int, num2: Int, num3:Int) -> Int {
    // TO DO: add the code to find smallest of three numbers ..
    var minValue = num1;
    if(num2 < minValue) {
        minValue = num2;
    }
    if(num3 < minValue) {
        minValue = num3;
    }
    return minValue;
}

func minimum( num1: Int, num2: Int, num3:Int, num4: Int) -> Int {
    // TO DO: add the code to find smallest of four numbers ..
    var minValue = num1;
    if(num2 < minValue) {
        minValue = num2;
    }
    if(num3 < minValue) {
        minValue = num3;
    }
    if(num4 < minValue) {
        minValue = num4;
    }
    return minValue;
}

// Call these overloaded functions
print(minimum(10, 20))
print(minimum(num1: 30, num2: 25, num3: 48))
print(minimum(num1: 101, num2: 55, num3: 60, num4: 90))
