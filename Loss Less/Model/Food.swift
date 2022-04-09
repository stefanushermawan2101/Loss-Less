//
//  Food.swift
//  Loss Less
//
//  Created by Stefanus Hermawan Sebastian on 09/04/22.
//

import Foundation

class Food {
    var name: String
    var location: String
    var addedDate: String
    var expDate: String
    var image: String
    var condition: String
    var isEaten: Bool
    var description: String
    
    
    init(name: String, location: String, addedDate: String, expDate: String, image: String, condition: String, isEaten: Bool, description: String) {
        
        self.name = name
        self.location = location
        self.addedDate = addedDate
        self.expDate = expDate
        self.image = image
        self.condition = condition
        self.isEaten = isEaten
        self.description = description
    }
    
    convenience init() {
        self.init(name: "", location: "", addedDate: "", expDate: "", image: "", condition: "", isEaten: false, description: "")
    }
   
}
