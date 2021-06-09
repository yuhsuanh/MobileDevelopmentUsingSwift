// main.swift
// Testing class Time
import Foundation

// displays a Time object in 24-hour and 12-hour formats
func displayTime( _ header: String, _ time: Time) {
    print(String(format: "%@\nUniversal time: %@\nStandard time: %@\n",
        header, time.universalDescription, time.description))
}  // calling time.universalDescription and time.description computed properties

// create and initialize a Time object
let time = Time() // invokes Time default initializer
displayTime("AFTER TIME OBJECT IS CREATED", time)

// change time then display new time
print("SETTING A NEW TIME")
time.hour = 13 // this should be between 0 and 23
time.minute = 27 // this should be between 0 and 59
time.second = 6 // this should be between 0 and 59
displayTime("\nAFTER SETTING NEW HOUR, MINUTE, AND SECOND VALUES", time)

// attempt to set time with invalid values
print("ATTEMPTING TO SET INVALID PROPERTY VALUES")
time.hour = 99
time.minute = 99
time.second = 99
displayTime("\nAFTER ATTEMPTING TO SET INVALID VALUES", time)

