//
//  Food+CoreDataProperties.swift
//  Loss Less
//
//  Created by Dicky Alamsyah on 12/04/22.
//
//

import Foundation
import CoreData


extension Food {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Food> {
        return NSFetchRequest<Food>(entityName: "Food")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var lastUpdated: Date?
    @NSManaged public var imageFood: Data?
    @NSManaged public var text: String?

}

extension Food : Identifiable {

}
