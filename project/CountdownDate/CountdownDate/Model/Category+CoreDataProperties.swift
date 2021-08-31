//
//  Category+CoreDataProperties.swift
//  CountdownDate
//
//  Created by Yu-Hsuan Huang on 2021/8/3.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var name: String?

}

extension Category : Identifiable {

}
