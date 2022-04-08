//
//  ViewController.swift
//  Loss Less
//
//  Created by Stefanus Hermawan Sebastian on 24/03/22.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    // reference ke manage object context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    
    //Data buat tabel
    var items: [Person]?
    
    
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return items.count
       return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellFridge", for: indexPath)
        
        let person = self.items![indexPath.row]
        
        cell.textLabel?.text = person.name//items[indexPath.row]
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        let entity = NSEntityDescription.entity(forEntityName: "Person", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        
        newUser.setValue("dennis", forKey: "name")
        
        
        fetchPeople()
        
    }
    
    func fetchPeople() {
        //fetch data from coredata to table view
        do {
            self.items = try context.fetch(Person.fetchRequest())
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        } catch {
            
        }
        
    }
    
}

