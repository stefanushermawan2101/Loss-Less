//
//  ViewController.swift
//  Loss Less
//
//  Created by Stefanus Hermawan Sebastian on 24/03/22.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var MainFoodTblView: UITableView!
    
    let fridgeArray = ["domba", "ayam", "kelinci"]
    
    func numberOfSections(in tableView: UITableView) -> Int
     {
         return 1
     }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fridgeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellFridge", for: indexPath)
                
                cell.textLabel!.text = fridgeArray[indexPath.row]
                
                return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MainFoodTblView.dataSource = self
        MainFoodTblView.delegate = self
    }
    
    
    
}

