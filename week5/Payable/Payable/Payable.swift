// Payable.swift
// Payable protocol definition
import Foundation
// protocol is similar to interface in java and C#
// It is like is contract.
// It can only have function headers, without definition.
// Protocol polymorphism
protocol Payable {
    var paymentAmount: NSDecimalNumber {get}
   // func move() { }
}

// so many classes who are providing the definition for move() function
// if I say move() to an object of frog class - he will jump
//if I say move() to an object of fish class  - it will swim
//if I say move() to bird - he will fly
//if I say move() to dog - he will run
//if I say move() to human - he will walk
// All the above classes are nothing in common

protocol IMove {
    func move()
}
class Frog : IMove {
    func move() { print("jump") }
}
class Fish : IMove {
    func move() { print("swim") }
}
