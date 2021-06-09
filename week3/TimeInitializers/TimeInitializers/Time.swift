// Time.swift
// Time class with overloaded designated and convenience initializers.
// This is about - designated and convenience initializers.

public class Time {
    // an hour value in the range 0-23
    public var hour: Int = 0 {
        didSet {
            if hour < 0 || hour > 23 {
                hour = oldValue
            }
        }
    } // end property
    
    // a minute value in the range 0-59
    public var minute: Int = 0 {
        didSet {
            if minute < 0 || minute > 59 {
                minute = oldValue
            }
        }
    } // end property
    
    // a second value in the range 0-59
    public var second: Int = 0 {
        didSet {
            if second < 0 || second > 59 {
                second = oldValue
            }
        }
    } // end property
    
    // designated initializer: sets each stored property to default value
    public init() { } // empty body
    
    // designated initializer: sets all the stored properties to specified values
    public init(hour: Int, minute: Int, second: Int) {
        // add validations here. Check if hour is between > 0 and < 24
        self.hour = hour
        self.minute = minute
        self.second = second
        // No validations here. You need to add that
    }
    
// convenience initializer: hour supplied, minute and second set to 0
   public convenience init(hour: Int) {
       self.init(hour: hour, minute: 0, second: 0)
    }

    /*
    public  init(hour: Int) {
        self.hour = hour
        self.minute = 0
        self.second = 0
    }
    */
    // convenience initializer: hour and minute supplied, second set to 0
  public convenience init(hour: Int, minute: Int) {
        self.init(hour: hour, minute: minute, second: 0)
   }
    /*
    public  init(hour: Int, minute: Int) {
        //self.init(hour: hour, minute: minute, second: 0)
         self.hour = hour
         self.minute = minute
         self.second = 0
    }
 */
    // convenience initializer: another Time object supplied
    public convenience init(time: Time) {
        self.init(hour: time.hour, minute: time.minute,
            second: time.second)
    }
    
    // Computed property - universalDescription. It is read only.
    // not get and set means - get is implicit
    // convert to String in universal-time format (HH:MM:SS)
    public var universalDescription: String {
        return String(format: "%02d:%02d:%02d", hour, minute, second)
    }
    
    // Computed property - description. It is read only
    // convert to String in standard-time format (H:MM:SS AM or PM)
    public var description: String {
        return String(format: "%d:%02d:%02d %@",
            ((hour == 0 || hour == 12) ? 12 : hour % 12),
            minute, second, (hour < 12 ? "AM" : "PM"))
    }
}

