import Cocoa

import Darwin // allow program to use C function arc4random_uniform
// This uses random function to generate the values
for i in 1...20 {
    print("\(1 + arc4random_uniform(10)) ") // it generate any value between 0 and 9
}

// Simulating a game of die
for _ in 1...6 {
    print("\(1 + arc4random_uniform(6)) ")
}
