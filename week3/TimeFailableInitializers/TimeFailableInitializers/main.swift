// main.swift
// Testing class Time's failable initializers
import Foundation

// attempt to create a Time object with failable designated initializer
if let time1 = Time(hour: 99, minute: 99, second: 99) {
    print("Time is \(time1.description)")
} else {
    print("time1: initializer failed due to invalid arguments")
}

// attempt to create a Time object with a failable convenience initializer
if let time2 = Time(hour: 99) {
    print("Time is \(time2.description)")
} else {
    print("time2: initializer failed due to invalid argument")
}

// create a Time object, then use it to initialize another Time object
if let time3 = Time(hour: 16, minute: 4, second: 5) {
    print("time3 is \(time3.description)")

    // attempt to create a Time object with an implicitly
    // unwrapped failable convenience initializer
    let time4 = Time(time: time3)
    print("time4 is \(time4?.description)")
}

