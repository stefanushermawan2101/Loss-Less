//
//  Food+CoreDataClass.swift
//  Loss Less
//
//  Created by Dicky Alamsyah on 13/04/22.
//
//

import Foundation
import CoreData

@objc(Food)
public class Food: NSManagedObject {
    
    var title: String {
        return name.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: .newlines).first ?? ""
    }
    
    var exp: String {
        return "\(expDate.format())"
    }

}
