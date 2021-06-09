//
//  TimeClassExtensions.swift
//  TimeExtension
//
//  Created by Sujeet Lohan on 2020-10-05.
//  Copyright © 2020 Deitel & Associates, Inc. All rights reserved.
//

import Foundation
// extension to class Time containing convenience initializers
extension Time {
    // convenience initializer: hour supplied, minute and second set to 0
    public convenience init(hour: Int) {
        self.init(hour: hour, minute: 0, second: 0) // call the designated initializer
    }
    
    // convenience initializer: hour and minute supplied, second set to 0
    public convenience init(hour: Int, minute: Int) {
        self.init(hour: hour, minute: minute, second: 0)
        
    }
    
    // convenience initializer: use values from existing Time object
    public convenience init(time: Time) {
        self.init(hour: time.hour, minute: time.minute,
            second: time.second)
    }
} // end extension class Time

// extensions for String representations of a Time
extension Time {
    // convert to String in universal-time format (HH:MM:SS)
    public var universalDescription: String {
        return String(format: "%02d:%02d:%02d", hour, minute, second)
    }
    
    // convert to String in standard-time format (H:MM:SS AM or PM)
    public var description: String {
        return String(format: "%d:%02d:%02d %@",
            ((hour == 0 || hour == 12) ? 12 : hour % 12),
            minute, second, (hour < 12 ? "AM" : "PM"))
    }
} // end extension class Time



