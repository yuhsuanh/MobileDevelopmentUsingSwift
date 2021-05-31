
// Examples of if..else

//... Example 01: Examples of if statement
let studentGrade = 85

// if statement
if (studentGrade >= 60) {
    print("Passed")
}

//...Example 02:
// if...else statement
if studentGrade >= 60 {
    print("Passed")
} else {
    print("Failed")
}

//...Example 03:
// nested if...else statement
if studentGrade >= 90 {
    print("A")
} else {
    if studentGrade >= 80 {
        print("B")
    } else {
        if studentGrade >= 70 {
            print("C")
        } else {
            if studentGrade >= 60 {
                print("D")
            } else {
                print("F")
            }
        }
    }
}

//...Example 04:
// nested if...else statement
if studentGrade >= 90 {
    print("A")
} else if studentGrade >= 80 {
    print("B")
} else if studentGrade >= 70 {
    print("C")
} else if studentGrade >= 60 {
    print("D")
} else {
    print("F")
}

//...Example 05:
// ternary conditional operator
print(studentGrade >= 60 ? "Passed" : "Failed")




















