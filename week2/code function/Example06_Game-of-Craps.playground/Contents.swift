import Cocoa

// Example: Simulating the dice game craps
// Game of Craps: Rules
// Since you roll two dice, minimum value will be 2 and maximum value will be 12
// On the first roll, if a player gets 7 (Seven) or 11 (Yoleven), he will win the game
// On the first roll if a player gets either of 2 ( SnakeEyes) or 3(Trey) or 12(BoxCars), he will loose
// On the first roll if a player get either of 4,5,6,8,9 or 10, then that become his point and he will roll the dice again
// and keeps rolling it again and again till he gets his point value. e.g. if he gets 8 in first roll, then he will keep rolling unless and until he gets 8 again, during that time if he gets 7 then he will loose. ( though he wins 7 on the first roll.)
//
import Darwin

// enum representing game status constants (no raw type)
enum Status {
    case Continue, Won, Lost
}

// enum with Int constants representing common dice totals
enum DiceNames: Int {
    case SnakeEyes = 2
    case Trey = 3
    case Seven = 7
    case YoLeven = 11
    case BoxCars = 12
}

// function that rolls two dice and returns them and their sum as a tuple
func rollDice() -> (die1: Int, die2: Int, sum: Int) {
    let die1 = Int(1 + arc4random_uniform(6)) // first die roll
    let die2 = Int(1 + arc4random_uniform(6)) // second die roll
    return (die1, die2, die1 + die2)
}

// function to display a roll of the dice, it takes one input tuple
func displayRoll(roll: (Int, Int, Int)) {
    print("Player rolled \(roll.0) + \(roll.1) = \(roll.2)")
}

// play one game of craps
var myPoint = 0 // point if no win or loss on first roll
var gameStatus = Status.Continue // can contain Continue, Won or Lost

var roll = rollDice() // first roll of the dice
displayRoll(roll: roll) // display the two dice and the sum

// determine game status and point based on first roll
switch roll.sum {
    // win on first roll, if you get 7 or 11
    case DiceNames.Seven.rawValue, DiceNames.YoLeven.rawValue:
        gameStatus = Status.Won
    // lose on first roll , if you get 2,3 or 12
    case DiceNames.SnakeEyes.rawValue, DiceNames.Trey.rawValue,
         DiceNames.BoxCars.rawValue:
        gameStatus = Status.Lost
    // did not win or lose, so remember point - so you may get 4 or 5 or 6 or 8 or 9 or 10. This value becomes your point.
    default:
        gameStatus = Status.Continue // game is not over
        myPoint = roll.sum // remember the point
        print("Point is \(myPoint)")
}

// while game is not complete
while gameStatus == Status.Continue
{
    roll = rollDice() // first roll of the dice
    displayRoll(roll: roll) // display the two dice and the sum
    
    // determine game status
    if roll.sum == myPoint { // won by making point
        gameStatus = Status.Won
    } else {
        if (roll.sum == DiceNames.Seven.rawValue) { // lost by rolling 7
            gameStatus = Status.Lost
        }
    }
}

// display won or lost message
if gameStatus == Status.Won {
    print("Player wins")
} else {
    print("Player loses")
}


