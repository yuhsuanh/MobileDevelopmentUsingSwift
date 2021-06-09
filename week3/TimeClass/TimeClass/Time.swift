// Time.swift
// Time class with default initializer and property observers
// When a property is assigned a new value, property observers enable code to execute
// before and after the property value changes
// Property observers don't execute when you define a default value in its definition
// Nor do they execute when you assign a value to the property in an initializer
// However property observers execute every time that property is assigned a new value

public class Time {
    // stored property - hour. It has property observers set by use of willSet and didSet
    // an hour value in the range 0-23
    public var hour: Int = 0 {
        willSet {
           print("hour is \(hour); setting it to \(newValue)")
       }
        didSet {
            if hour < 0 || hour > 23 {
                print("hour invalid, resetting to \(oldValue)")
                hour = oldValue
            }
        }
    } // end property

     // stored property - minute. It has property observers set by use of willSet and getSet
    // a minute value in the range 0-59
    // newValue and oldValue are default names
    public var minute: Int = 0 {
        willSet {
            print("minute is \(minute); setting it to \(newValue)")
        }
        didSet {
            if minute < 0 || minute > 59 {
                print("minute invalid, resetting to \(oldValue)")
                minute = oldValue
            }
        }
    }
    
     // stored property - second. It has property observers set by use of willSet and getSet
    // a second value in the range 0-59
    public var second: Int = 0 { 
        willSet {
            print("second is \(second); setting it to \(newValue)")
        }
        didSet {
            if second < 0 || second > 59 {
                print("second invalid, resetting to \(oldValue)")
                second = oldValue
            }
        }
    } // end property
    
    // computed property - universalDescription - read only property
    // Computed properties don't store any value
    // convert to String in universal-time format (HH:MM:SS)
    public var universalDescription: String {
        //get {
            return String(format: "%02d:%02d:%02d", hour, minute, second)
       // }
        // there is not set
    } // end property
    
    // computed property - description. If you don't specify get and set explicitly, then it is
    // considered as read-only
    // convert to String in standard-time format (H:MM:SS AM or PM)
    public var description: String {
        return String(format: "%d:%02d:%02d %@",
            ((hour == 0 || hour == 12) ? 12 : hour % 12),
            minute, second, (hour < 12 ? "AM" : "PM"))
    } // end property
} // end class
