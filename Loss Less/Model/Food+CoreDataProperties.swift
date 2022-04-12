//
//  Food+CoreDataProperties.swift
//  Loss Less
//
//  Created by Dicky Alamsyah on 13/04/22.
//
//

import Foundation
import CoreData


extension Food {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Food> {
        return NSFetchRequest<Food>(entityName: "Food")
    }

    @NSManaged public var expDate: Date!
    @NSManaged public var id: UUID!
    @NSManaged public var imageFood: Data!
    @NSManaged public var isEaten: Bool
    @NSManaged public var lastUpdated: Date!
    @NSManaged public var location: String!
    @NSManaged public var name: String!
    @NSManaged public var text: String!

}

extension Food : Identifiable {

}
