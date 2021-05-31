//... Logical AND (&&) operator

var seniorFemales = 0
var gender:String = "Male" // implicitly string or it is an example of type inference
var age:Int = 65

if (gender == "Female") && (age >= 65) {
    seniorFemales += 1
}

//... Logical OR (||) operator

var semesterAverage = 91
var finalExam = 97

if (semesterAverage >= 90) || (finalExam >= 90) {
    print("Student grade is A")
}

//... Logical NOT (!) Operator

if !(age > 65) {
    print("Age is less than or equal to 65")
}

if age <= 65 {
    print("Age is less than or equal to 65")
}

