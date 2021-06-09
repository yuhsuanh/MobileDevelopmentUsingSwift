// main.swift
// Testing struct Time
import Foundation

// displays a Time object in 24-hour and 12-hour formats
func displayTime(_ header: String, _ time: Time) {
    print(String(format:"%@\n   %@\n   %@",
        header, time.universalDescription, time.description))
}

// create and initialize Time objects
var t1 = Time() // 00:00:00
let t2 = Time(hour: 2) // 02:00:00
let t3 = Time(hour: 21, minute: 34) // 21:34:00
let t4 = Time(hour: 12, minute: 25, second: 42) // 12:25:42
let t5 = t4 // 12:25:42; initializes t5 with copies of t6's members

print("OBJECT: INITIALIZED WITH")
displayTime("t1: all default arguments", t1)
displayTime("t2: hour; default minute and second", t2)
displayTime("t3: hour and minute; default second", t3)
displayTime("t4: hour, minute and second", t4)
displayTime("t5: Time object t4", t5)

print("\nASSIGNING STRUCT OBJECTS")
t1 = t5 // copies t5's members into t1's members
displayTime("after t1 = t5, t1 is", t1)

print("\nADDING TO A TIME")
var t6 = Time(hour: 23, minute: 59, second: 58)
print("t6 is initially: \(t6.description)")
t6.addSeconds(7) // increment the time by 7 seconds
print("t6 after adding 7 seconds is: \(t6.description)")


