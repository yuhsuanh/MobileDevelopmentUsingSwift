//
//  Event+CoreDataProperties.swift
//  CountdownDate
//
//  Created by Yu-Hsuan Huang on 2021/8/3.
//
//

import Foundation
import CoreData


extension Event {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Event> {
        return NSFetchRequest<Event>(entityName: "Event")
    }

    @NSManaged public var category: String?
    @NSManaged public var desc: String?
    @NSManaged public var endDate: Date?
    @NSManaged public var eventEnd: Bool
    @NSManaged public var eventName: String?
    @NSManaged public var startDate: Date?
    @NSManaged public var top: Bool

}

extension Event : Identifiable {

}
