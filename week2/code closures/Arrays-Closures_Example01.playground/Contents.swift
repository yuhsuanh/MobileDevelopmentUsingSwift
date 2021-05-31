//: Playground - noun: a place where people can play

// Demonstration of Closures using Arrays
// Closures are Anonymous methods. Similar to Lambdas Expression in C# and Java
//.... Example 01 ....

///*
var volunteerCounts = [1, 3, 40, 32, 2, 53, 77, 13]

func sortAscending(i: Int, j: Int) -> Bool {
    return i < j
}

let volunteersSorted = volunteerCounts.sorted(by: sortAscending) // a function - "sortAscending" is passed

 //*/

//.... Example 02 ....
///*
 var gradeCounts = [1,3,40,32,2,53,77,13]
 
 func sortDescending(i: Int, j: Int) -> Bool {
 return i > j
 }
 let gradesSorted = gradeCounts.sorted(by: sortDescending)
 
//**/

//.... Example 03 .... Using Closure Expression, similar to lambdas expression in C# and Java

var workersCounts = [1,3,40,32,2,53,77,13]

let workersSorted = volunteerCounts.sorted( by: { ( i:Int, j:Int) -> Bool in
    return i < j })

//.... Example 04 .... Using Closure Expression

let courses = ["Java", "Mobile", "CSharp", "PHP", "Python"]
let sortedCourses = courses.sorted ( by:
                                     {
                                        (course1: String, course2: String) -> Bool in
                                        return course1 > course2
                                    }
                                  )

//.... Example 05.... Inferring type from the context

let programs = ["Software", "QA", "Analyst", "Electronics", "Network"]
let sortedPrograms = programs.sorted(by: { (program1, program2) -> Bool in
    return program1 > program2
})

// .... Example 06: .... Implicit returns from single-expression closures

let cars = ["Honda", "Toyoto", "Audi", "BMW", "Ford"]
let sortedCars = cars.sorted(by: { car1, car2 in
    car1 > car2 })

// .... Example 07: .... Shorthand argument names

let programmingCourses = ["Java", "Mobile", "CSharp", "PHP", "Python"]
let sortedProgrammingCourses = programmingCourses.sorted(by: {
    $0 > $1
})


// .... Example 08: .... Trailing Closure


 let gradeCourses = ["Java", "Mobile", "CSharp", "PHP", "Python"]
 let sortedGradeCourses = gradeCourses.sorted() {
 $0 > $1
 }
 
// .... Example 09: ....

// return true if s1 < s2
func ascendingOrder(s1: String, s2: String) -> Bool {
    return s1 < s2
}


// Array of color names to sort
let colors = ["red", "orange", "yellow", "green", "blue", "indigo", "violet"]

print("Array colors unsorted:\n\(colors.description)\n")

// sort ascending: function ascendingOrder

let sortedColors1 = colors.sorted(by:ascendingOrder) // A func is passed as argument

print("Array sortedColors1:\n\(sortedColors1.description)\n")

// sort descending: fully typed closure expression
let sortedColors2 =
    colors.sorted( by:
                    {
                    (s1: String, s2: String) -> Bool in return s1 < s2
                     }
                 )
print("Array sortedColors2:\n\(sortedColors2.description)\n")

// sort ascending: inferred types
let sortedColors3 = colors.sorted(by:
                                    {
                                        s1, s2 in return s1 < s2
                                        
                                    }
                                  )

print("Array sortedColors3:\n\(sortedColors3.description)\n")

// sort descending: inferred types and implicit return
let sortedColors4 = colors.sorted(by:
                                    {s1, s2 in s1 < s2
                                   }
                                 )

print("Array sortedColors4:\n\(sortedColors4.description)\n")

// sort ascending: shorthand closure arguments
let sortedColors5 = colors.sorted(by: { $0 < $1 } )
 
print("Array sortedColors5:\n\(sortedColors5.description)\n")

// sort descending operator function >
let sortedColors6 = colors.sorted(by: >)
print("Array sortedColors6:\n\(sortedColors6.description)\n")

// reversing the elements of an Array
let reversedArray = sortedColors6.reversed()
print(reversedArray)
//print("Array reversed:\n\(reversedArray.description)")











