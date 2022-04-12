//
//  CoreDataManager.swift
//  Loss Less
//
//  Created by Dicky Alamsyah on 11/04/22.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager(modelName: "Loss_Less")
    
    let persistentContainer: NSPersistentContainer
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    init(modelName:String){
        persistentContainer = NSPersistentContainer(name: modelName)
    }
    
    func load(completion: (() -> Void)? = nil){
        persistentContainer.loadPersistentStores{
            (description, error) in
            guard error == nil else {
                fatalError(error!.localizedDescription)
            }
            completion?()
        }
    }
    
    func save() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                print("An error occured while saving: \(error.localizedDescription)")
            }
        }
    }
}
