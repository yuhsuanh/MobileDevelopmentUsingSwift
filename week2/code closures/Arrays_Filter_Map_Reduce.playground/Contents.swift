// Array_Filter_Map_Reduce.playground:

//Demonstrating Array methods filter, map, reduce and sorted
// It is about the concept of functional programming
// Filtering --selecting a subset of values based on a condition
// Mapping -- one to one -- you end up getting the same number of values
// e.g. Add 2 to each value in an array.
// Reducing -- reduce the set of values to one value. Say get the sum of the values.

// Array of Ints to filter, map and reduce
let values = [3, 10, 6, 1, 4, 8, 2, 5, 9, 7]
let names = ["Java", "PHP", "Swift"]

print("values: \(values.description)")


// filter: even values displayed in sorted order

let evenValues = values.filter({ $0 % 2 == 0 }) // This a Closure expression
print("Even values extracted: \(evenValues.description)")

//let evenValuesSorted = values.filter( {$0 % 2 == 0 }).sorted( by: < )
// ..OR
let evenValuesSorted = values
                       .filter( {$0 % 2 == 0 } )
                       .sorted( by: < )

print("Even values sorted: \(evenValuesSorted.description)")

// Loops over a collection and applies the same operation to each element
//map: square each value then sort the squares

let squaresOfValues = values.map({$0 * $0})
print("Squares of values: \(squaresOfValues.description)")

let squaresOfValuesSorted = values.map({$0 * $0}).sorted(by: <)
print("Squares of values sorted: \(squaresOfValuesSorted.description)")

// reduce: sum the elements of values
let sumOfValues = values.reduce(0, {$0 + $1})
print("Sum of values: \(sumOfValues)")

// Chaining - filter, map and reduce: sum the squares of the even integers
let sumOfSquares =
    values.filter({$0 % 2 == 0}) // even integers
        .map({$0 * $0})        // squaring each number
          .reduce(0, {$0 + $1}) // reducing, means finding the sum
print("Sum of the even value squares: \(sumOfSquares)")


